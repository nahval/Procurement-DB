START TRANSACTION;
SAVEPOINT before_stock_update;

-- Intentamos actualizar la cantidad y la fecha de actualización del stock
UPDATE stock 
SET quantity = quantity - 40,  -- Ajusta la cantidad según lo necesario
    update_date = CURDATE()    -- Para MySQL (usar CURRENT_DATE en PostgreSQL)
WHERE intern_pn_id = 2 AND warehouse = 'WH2';

-- Si hubo error, deshacemos cambios
ROLLBACK TO SAVEPOINT before_stock_update;

-- Si no hubo errores, liberamos el savepoint y confirmamos
RELEASE SAVEPOINT before_stock_update;

COMMIT;

SELECT * FROM stock;
SELECT * FROM AUDIT_LOG;