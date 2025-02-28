
CREATE DATABASE IF NOT EXISTS manage_components;
USE manage_components;

DELIMITER $$

CREATE ROLE 'ingenieria_electronica';
CREATE ROLE 'almacenamiento';
CREATE ROLE 'compras';
CREATE ROLE 'lectura_general';
CREATE ROLE 'administrador';

GRANT SELECT, INSERT, UPDATE, DELETE ON manage_components.pn_manufacturer TO 'ingenieria_electronica';
GRANT SELECT, INSERT, UPDATE, DELETE ON manage_components.pn_intern TO 'ingenieria_electronica';

GRANT SELECT, INSERT, UPDATE, DELETE ON manage_components.stock TO 'almacenamiento';

GRANT SELECT, INSERT, UPDATE, DELETE ON manage_components.prices TO 'compras';

GRANT SELECT ON manage_components.* TO 'lectura_general';

CREATE USER 'usuario_ingenieria'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT 'ingenieria_electronica' TO 'usuario_ingenieria'@'localhost';

CREATE USER 'usuario_almacenamiento'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT 'almacenamiento' TO 'usuario_almacenamiento'@'localhost';

CREATE USER 'usuario_compras'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT 'compras' TO 'usuario_compras'@'localhost';

CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT 'lectura_general' TO 'usuario_lectura'@'localhost';

CREATE USER 'usuario_admin'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT 'administrador' TO 'usuario_admin'@'localhost';

FLUSH PRIVILEGES;
$$
DELIMITER ;