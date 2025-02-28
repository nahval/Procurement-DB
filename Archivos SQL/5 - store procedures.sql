USE manage_components;
--------------------------------  STORE PROCEDURES  --------------------------------------
-- Procedimiento de validación 
DROP PROCEDURE IF EXISTS validate_internal_pn;
DELIMITER //
CREATE PROCEDURE validate_internal_pn(
    IN p_intern_pn VARCHAR(100),
    IN p_descrip VARCHAR(500),
    IN p_lifecycle VARCHAR(50),
    IN p_quality_grade VARCHAR(50)
)
BEGIN
    IF p_intern_pn IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PN interno requerido';
    END IF;
    IF p_descrip IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Descripción requerida';
    END IF;
    IF p_lifecycle NOT IN ('Active', 'EOL', 'NRND', 'Obsolete') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lifecycle debe ser válido';
    END IF;
    IF p_quality_grade NOT IN ('Automotive', 'Industrial', 'Commercial', 'Military') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quality grade inválido';
    END IF;
END //
DELIMITER ;

-- Procedimiento de validación 
DROP PROCEDURE IF EXISTS manage_internal_pn;
DELIMITER //

CREATE PROCEDURE manage_internal_pn (
    IN p_action VARCHAR(10),
    IN p_intern_pn VARCHAR(100),
    IN p_descrip VARCHAR(500),
    IN p_lifecycle VARCHAR(50),
    IN p_quality_grade VARCHAR(50)
)
BEGIN
    IF p_action = 'ADD' THEN
        CALL validate_internal_pn(p_intern_pn, p_descrip, p_lifecycle, p_quality_grade);
        INSERT INTO pn_intern (intern_pn, descrip, lifecycle, quality_grade, update_date)
        VALUES (p_intern_pn, p_descrip, p_lifecycle, p_quality_grade, CURDATE());
    
    ELSEIF p_action = 'UPDATE' THEN
        CALL validate_internal_pn(p_intern_pn, p_descrip, p_lifecycle, p_quality_grade);
        UPDATE pn_intern
        SET descrip = p_descrip, lifecycle = p_lifecycle, quality_grade = p_quality_grade, update_date = CURDATE()
        WHERE intern_pn = p_intern_pn;

    ELSEIF p_action = 'DELETE' THEN
        DELETE FROM pn_intern WHERE intern_pn = p_intern_pn;

    END IF;
END //

DELIMITER //
-- Procedimiento centralizado para auditoría
CREATE PROCEDURE audit_operation(
    IN p_table_name VARCHAR(50),
    IN p_operation VARCHAR(10),
    IN p_record_id INT,
    IN p_old_data TEXT,
    IN p_new_data TEXT
)
BEGIN
    INSERT INTO audit_log (
        table_name, 
        operation_type, 
        record_id, 
        old_value, 
        new_value, 
        changed_by
    ) VALUES (
        p_table_name,
        p_operation,
        p_record_id,
        p_old_data,
        p_new_data,
        CURRENT_USER()
    );
END

DELIMITER ;


-- Llamadas de prueba:
CALL manage_internal_pn('ADD' , 'TEST001', 'Componente de prueba', 'Active', 'Industrial');
CALL manage_internal_pn('UPDATE', 'TEST001', 'Componente modificad', 'Obsolete', 'Automotive');
CALL manage_internal_pn('DELETE', 'TEST001', NULL, NULL, NULL);
CALL manage_internal_pn('ADD' , null , 'Componente de prueba', 'Active', 'Industrial');


SELECT * FROM pn_intern WHERE intern_pn = 'TEST001';