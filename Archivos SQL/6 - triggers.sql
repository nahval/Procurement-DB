USE manage_components;

DELIMITER $$
-- --------------------------- TRIGGERS PARA TABLA PN_INTERN-------------------------------------
-- ----------------------------           INSERT             -------------------------------------
CREATE TRIGGER audit_pn_intern_insert AFTER INSERT ON pn_intern
FOR EACH ROW
BEGIN
    SET @json_data = JSON_OBJECT(
        'pn_intern_id', NEW.pn_intern_id,
        'intern_pn', NEW.intern_pn,
        'descrip', NEW.descrip,
        'lifecycle', NEW.lifecycle,
        'eol_date', NEW.eol_date,
        'quality_grade', NEW.quality_grade,
        'replace_id', NEW.replace_id,
        'update_date', NEW.update_date
    );
    
CALL audit_operation('pn_intern', 'INSERT', NEW.pn_intern_id, NULL, @json_data);
END$$
-- ----------------------------           UPDATE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_pn_intern_update AFTER UPDATE ON pn_intern
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'pn_intern_id', OLD.pn_intern_id,
        'intern_pn', OLD.intern_pn,
        'descrip', OLD.descrip,
        'lifecycle', OLD.lifecycle,
        'eol_date', OLD.eol_date,
        'quality_grade', OLD.quality_grade,
        'replace_id', OLD.replace_id,
        'update_date', OLD.update_date
    );
    SET @new_json = JSON_OBJECT(
        'pn_intern_id', NEW.pn_intern_id,
        'intern_pn', NEW.intern_pn,
        'descrip', NEW.descrip,
        'lifecycle', NEW.lifecycle,
        'eol_date', NEW.eol_date,
        'quality_grade', NEW.quality_grade,
        'replace_id', NEW.replace_id,
        'update_date', NEW.update_date
    );
CALL audit_operation('pn_intern', 'UPDATE', NEW.pn_intern_id, @old_json, @new_json);
END$$
-- ----------------------------           DELETE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_pn_intern_delete AFTER DELETE ON pn_intern
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'pn_intern_id', OLD.pn_intern_id,
        'intern_pn', OLD.intern_pn,
        'descrip', OLD.descrip,
        'lifecycle', OLD.lifecycle,
        'eol_date', OLD.eol_date,
        'quality_grade', OLD.quality_grade,
        'replace_id', OLD.replace_id,
        'update_date', OLD.update_date
        -- Agregar cualquier otra columna que exista en tu tabla
    );
    
CALL audit_operation('pn_intern', 'DELETE', OLD.pn_intern_id, @old_json, NULL);
END$$
-- ----------------------------	TRIGGERS PARA TABLA PN_manufacturer-------------------------------------
-- ----------------------------           INSERT             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_pn_manufacturer_insert AFTER INSERT ON pn_manufacturer
FOR EACH ROW
BEGIN
    SET @json_data = JSON_OBJECT(
        'manuf_pn_id', NEW.manuf_pn_id,
        'pn_intern_id', NEW.pn_intern_id,
        'descrip', NEW.descrip,
        'manufacturer', NEW.manufacturer,
        'lifecycle', NEW.lifecycle,
        'eol_date', NEW.eol_date,
        'replace_id', NEW.replace_id
    );
    
CALL audit_operation('pn_manufacturer', 'INSERT', NEW.manuf_pn_id, NULL, @json_data);
END$$
-- ----------------------------           UPDATE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_pn_manufacturer_update AFTER UPDATE ON pn_manufacturer
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'manuf_pn_id', OLD.manuf_pn_id,
        'pn_intern_id', OLD.pn_intern_id,
        'descrip', OLD.descrip,
        'manufacturer', OLD.manufacturer,
        'lifecycle', OLD.lifecycle,
        'eol_date', OLD.eol_date,
        'replace_id', OLD.replace_id
    );
    SET @new_json = JSON_OBJECT(
        'manuf_pn_id', NEW.manuf_pn_id,
        'pn_intern_id', NEW.pn_intern_id,
        'descrip', NEW.descrip,
        'manufacturer', NEW.manufacturer,
        'lifecycle', NEW.lifecycle,
        'eol_date', NEW.eol_date,
        'replace_id', NEW.replace_id
    );
CALL audit_operation('pn_manufacturer', 'UPDATE', NEW.manuf_pn_id, @old_json, @new_json);
END$$
-- ----------------------------           DELETE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_pn_manufacturer_delete AFTER DELETE ON pn_manufacturer
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'manuf_pn_id', OLD.manuf_pn_id,
        'pn_intern_id', OLD.pn_intern_id,
        'descrip', OLD.descrip,
        'manufacturer', OLD.manufacturer,
        'lifecycle', OLD.lifecycle,
        'eol_date', OLD.eol_date,
        'replace_id', OLD.replace_id
    );
    
CALL audit_operation('pn_manufacturer', 'DELETE', OLD.manuf_pn_id, @old_json, NULL);
END$$

-- ----------------------------	TRIGGERS PARA TABLA project-------------------------------------
-- ----------------------------           INSERT             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_project_insert AFTER INSERT ON project
FOR EACH ROW
BEGIN
    SET @json_data = JSON_OBJECT(
        'project_id', NEW.project_id,
        'proj_name', NEW.proj_name,
        'descrip', NEW.descrip,
        'client', NEW.client
    );
    
CALL audit_operation('project', 'INSERT', NEW.project_id, NULL, @json_data);
END$$
-- ----------------------------           UPDATE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_project_update AFTER UPDATE ON project
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'project_id', OLD.project_id,
        'proj_name', OLD.proj_name,
        'descrip', OLD.descrip,
        'client', OLD.client
    );
    SET @new_json = JSON_OBJECT(
        'project_id', NEW.project_id,
        'proj_name', NEW.proj_name,
        'descrip', NEW.descrip,
        'client', NEW.client
    );
CALL audit_operation('project', 'UPDATE', NEW.project_id, @old_json, @new_json);
END$$
-- ----------------------------           DELETE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_project_delete AFTER DELETE ON project
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'project_id', OLD.project_id,
        'proj_name', OLD.proj_name,
        'descrip', OLD.descrip,
        'client', OLD.client
    );
    
CALL audit_operation('project', 'DELETE', OLD.project_id, @old_json, NULL);
END$$

-- ----------------------------	TRIGGERS PARA TABLA prices-------------------------------------
-- ----------------------------           INSERT             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_prices_insert AFTER INSERT ON prices
FOR EACH ROW
BEGIN
    SET @json_data = JSON_OBJECT(
        'price_id', NEW.price_id,
        'supplier_id', NEW.supplier_id,
        'intern_pn_id', NEW.intern_pn_id,
        'price', NEW.price,
        'currency', NEW.currency,
        'price_source',NEW.price_source,
        'MOQ',NEW.MOQ,
        'payment_conditions',NEW.payment_conditions,
        'update_date',NEW.update_date,
        'incoterm',NEW.incoterm
    );
    
CALL audit_operation('prices', 'INSERT', NEW.price_id, NULL, @json_data);
END$$
-- ----------------------------           UPDATE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_prices_update AFTER UPDATE ON prices
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'price_id', OLD.price_id,
        'supplier_id', OLD.supplier_id,
        'intern_pn_id', OLD.intern_pn_id,
        'price', OLD.price,
        'currency', OLD.currency,
        'price_source',OLD.price_source,
        'MOQ',OLD.MOQ,
        'payment_conditions',OLD.payment_conditions,
        'update_date',OLD.update_date,
        'incoterm',OLD.incoterm
    );
    SET @new_json = JSON_OBJECT(
        'price_id', NEW.price_id,
        'supplier_id', NEW.supplier_id,
        'intern_pn_id', NEW.intern_pn_id,
        'price', NEW.price,
        'currency', NEW.currency,
        'price_source',NEW.price_source,
        'MOQ',NEW.MOQ,
        'payment_conditions',NEW.payment_conditions,
        'update_date',NEW.update_date,
        'incoterm',NEW.incoterm
    );
CALL audit_operation('prices', 'UPDATE', NEW.price_id, @old_json, @new_json);
END$$
-- ----------------------------           DELETE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_prices_delete AFTER DELETE ON prices
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'price_id', OLD.price_id,
        'supplier_id', OLD.supplier_id,
        'intern_pn_id', OLD.intern_pn_id,
        'price', OLD.price,
        'currency', OLD.currency,
        'price_source',OLD.price_source,
        'MOQ',OLD.MOQ,
        'payment_conditions',OLD.payment_conditions,
        'update_date',OLD.update_date,
        'incoterm',OLD.incoterm
    );
    
CALL audit_operation('prices', 'DELETE', OLD.price_id, @old_json, NULL);
END$$

-- ----------------------------	TRIGGERS PARA TABLA stock-------------------------------------
-- ----------------------------           INSERT             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_stock_insert AFTER INSERT ON stock
FOR EACH ROW
BEGIN
    SET @json_data = JSON_OBJECT(
        'stock_id', NEW.stock_id,
        'intern_pn_id', NEW.intern_pn_id,
        'description', NEW.description,
        'state', NEW.state,
        'update_date', NEW.update_date,
        'warehouse', NEW.warehouse,
        'quantity', NEW.quantity
    );
    
CALL audit_operation('stock', 'INSERT', NEW.stock_id, NULL, @json_data);
END$$
-- ----------------------------           UPDATE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_stock_update AFTER UPDATE ON stock
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'stock_id', OLD.stock_id,
        'intern_pn_id', OLD.intern_pn_id,
        'description', OLD.description,
        'state', OLD.state,
        'update_date', OLD.update_date,
        'warehouse', OLD.warehouse,
        'quantity', OLD.quantity
    );
    SET @new_json = JSON_OBJECT(
        'stock_id', NEW.stock_id,
        'intern_pn_id', NEW.intern_pn_id,
        'description', NEW.description,
        'state', NEW.state,
        'update_date', NEW.update_date,
        'warehouse', NEW.warehouse,
        'quantity', NEW.quantity
    );
CALL audit_operation('stock', 'UPDATE', NEW.stock_id, @old_json, @new_json);
END$$
-- ----------------------------           DELETE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_stock_delete AFTER DELETE ON stock
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'stock_id', OLD.stock_id,
        'intern_pn_id', OLD.intern_pn_id,
        'description', OLD.description,
        'state', OLD.state,
        'update_date', OLD.update_date,
        'warehouse', OLD.warehouse,
        'quantity', OLD.quantity
    );
    
CALL audit_operation('stock', 'DELETE', OLD.stock_id, @old_json, NULL);
END$$

-- ----------------------------	TRIGGERS PARA TABLA suppliers-------------------------------------
-- ----------------------------           INSERT             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_suppliers_insert AFTER INSERT ON suppliers
FOR EACH ROW
BEGIN
    SET @json_data = JSON_OBJECT(
        'supplier_number_id', NEW.supplier_number_id,
        'name', NEW.name,
        'isDistributor', NEW.isDistributor,
        'country', NEW.country,
        'main_contact', NEW.main_contact
    );
    
CALL audit_operation('suppliers', 'INSERT', NEW.supplier_number_id, NULL, @json_data);
END$$
-- ----------------------------           UPDATE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_suppliers_update AFTER UPDATE ON suppliers
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'supplier_number_id', OLD.supplier_number_id,
        'name', OLD.name,
        'isDistributor', OLD.isDistributor,
        'country', OLD.country,
        'main_contact', OLD.main_contact
    );
    SET @new_json = JSON_OBJECT(
      	'supplier_number_id', NEW.supplier_number_id,
        'name', NEW.name,
        'isDistributor', NEW.isDistributor,
        'country', NEW.country,
        'main_contact', NEW.main_contact
    );
CALL audit_operation('suppliers', 'UPDATE', NEW.supplier_number_id, @old_json, @new_json);
END$$
-- ----------------------------           DELETE             -------------------------------------
DELIMITER $$
CREATE TRIGGER audit_suppliers_delete AFTER DELETE ON suppliers
FOR EACH ROW
BEGIN
    SET @old_json = JSON_OBJECT(
        'supplier_number_id', OLD.supplier_number_id,
        'name', OLD.name,
        'isDistributor', OLD.isDistributor,
        'country', OLD.country,
        'main_contact', OLD.main_contact
    );
    
CALL audit_operation('suppliers', 'DELETE', OLD.supplier_number_id, @old_json, NULL);
END$$

DELIMITER ;

-- ----------------------------           PRUEBAS             -------------------------------------

select * from audit_log;