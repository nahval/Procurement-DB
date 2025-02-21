USE manage_components;
-- Vista 1. Comparativa de estados del ciclo de vida desde distintas APIs
CREATE OR REPLACE VIEW manage_components.vista_estado_ciclo_vida AS
SELECT
    i.descrip AS descripcion_interna,
    i.intern_pn AS codigo_interno,
    i.lifecycle AS estado_interno,
    m.manuf_pn_id AS codigo_fabricante,
    m.manufacturer AS fabricante,
    m.lifecycle AS estado_fabricante,
    m.eol_date AS fecha_fin_vida,
    MAX(CASE WHEN a.source_api = 'Arrow' THEN a.lifecycle ELSE NULL END) AS estado_api_Arrow,
    MAX(CASE WHEN a.source_api = 'Digikey' THEN a.lifecycle ELSE NULL END) AS estado_api_Digikey,
    MAX(CASE WHEN a.source_api = 'Octopart' THEN a.lifecycle ELSE NULL END) AS estado_api_Octopart
FROM
    manage_components.pn_intern AS i
LEFT JOIN
    manage_components.pn_manufacturer AS m 
    ON i.pn_intern_id = m.pn_intern_id
LEFT JOIN
    manage_components.api_data AS a 
    ON m.manuf_pn_id = a.manuf_pn_id
GROUP BY
    i.descrip, i.intern_pn, i.lifecycle, 
    m.manuf_pn_id, m.manufacturer, m.lifecycle, m.eol_date;

SELECT * FROM manage_components.vista_estado_ciclo_vida;

-- Vista 2. Visualizar componentes asociados a un proyecto con filtro por ciclo de vida
CREATE OR REPLACE VIEW manage_components.vista_comparativa_ciclo_vida AS
SELECT 
    i.pn_intern_id,
    i.descrip as internal_pn_description,
    i.lifecycle,
    p.project_id,
    p.proj_name,
    p.client,
    p.descrip as project_description
FROM 
    manage_components.project AS p
LEFT JOIN 
    manage_components.relation_projects_internpn AS cp ON p.project_id = cp.project_id
LEFT JOIN 
    manage_components.pn_intern AS i ON cp.intern_pn_id = i.pn_intern_id;

SELECT * FROM manage_components.vista_comparativa_ciclo_vida where proj_name = 'Project Alpha';

-- Vista 3. Comparativa de precios para un componente específico
CREATE OR REPLACE VIEW manage_components.vista_comparativa_precios AS
SELECT 
    i.pn_intern_id,
    i.intern_pn,
    i.descrip,
    m.manuf_pn_id,
    p.price AS precio_interno,
    p.currency AS moneda_interna,
    MAX(CASE WHEN a.source_api = 'Arrow' THEN a.price ELSE NULL END) AS precio_api_Arrow,
    MAX(CASE WHEN a.source_api = 'Arrow' THEN a.currency ELSE NULL END) AS moneda_api_Arrow,
    MAX(CASE WHEN a.source_api = 'Digikey' THEN a.price ELSE NULL END) AS precio_api_Digikey,
    MAX(CASE WHEN a.source_api = 'Digikey' THEN a.currency ELSE NULL END) AS moneda_api_Digikey,
    MAX(CASE WHEN a.source_api = 'Octopart' THEN a.price ELSE NULL END) AS precio_api_Octopart,
    MAX(CASE WHEN a.source_api = 'Octopart' THEN a.currency ELSE NULL END) AS moneda_api_Octopart
FROM 
    manage_components.pn_intern AS i
LEFT JOIN 
    manage_components.pn_manufacturer AS m ON i.pn_intern_id = m.pn_intern_id
LEFT JOIN 
    manage_components.prices AS p ON i.pn_intern_id = p.intern_pn_id
LEFT JOIN 
    manage_components.api_data AS a ON m.manuf_pn_id = a.manuf_pn_id
GROUP BY 
    i.pn_intern_id, i.descrip, m.manuf_pn_id, p.price, p.currency
ORDER BY 
    i.pn_intern_id;

SELECT * FROM manage_components.vista_comparativa_precios WHERE intern_pn = 'INT001';

-- Vista 4: Dashboard de ciclo de vida por proyecto
CREATE OR REPLACE VIEW manage_components.vista_dashboard_proyecto AS
SELECT 
    pr.project_id,
    pr.proj_name,
    COUNT(CASE WHEN i.lifecycle = 'Active' THEN 1 ELSE NULL END) AS activos,
    COUNT(CASE WHEN i.lifecycle = 'NRND' THEN 1 ELSE NULL END) AS nrnd,
    COUNT(CASE WHEN i.lifecycle = 'Last Time Buy' THEN 1 ELSE NULL END) AS last_time_buy,
    COUNT(CASE WHEN i.lifecycle = 'EOL' THEN 1 ELSE NULL END) AS eol
FROM 
    manage_components.project AS pr
LEFT JOIN 
    manage_components.relation_projects_internpn AS pc ON pr.project_id = pc.project_id
LEFT JOIN 
    manage_components.pn_intern AS i ON pc.intern_pn_id = i.pn_intern_id
GROUP BY 
    pr.project_id, pr.proj_name;

SELECT * FROM manage_components.vista_dashboard_proyecto WHERE proj_name = 'Project Alpha';

-- Vista 5: Stock en todos los almacenes
CREATE OR REPLACE VIEW manage_components.vista_stock_almacenes AS
SELECT 
    i.pn_intern_id,
    i.intern_pn,
    i.descrip,
    s.warehouse,
    s.quantity
FROM 
    manage_components.pn_intern AS i
LEFT JOIN 
    manage_components.stock AS s ON i.pn_intern_id = s.intern_pn_id;

SELECT * FROM manage_components.vista_stock_almacenes WHERE intern_pn = 'INT002';

--------------------------STORE PROCEDURES---------------------------

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

DELIMITER ;


-- Llamadas de prueba:
CALL manage_internal_pn('ADD' , 'TEST001', 'Componente de prueba', 'Active', 'Industrial');
CALL manage_internal_pn('UPDATE', 'TEST001', 'Componente modificad', 'Obsolete', 'Automotive');
CALL manage_internal_pn('DELETE', 'TEST001', NULL, NULL, NULL);
CALL manage_internal_pn('ADD' , null , 'Componente de prueba', 'Active', 'Industrial');


SELECT * FROM pn_intern WHERE intern_pn = 'TEST001';