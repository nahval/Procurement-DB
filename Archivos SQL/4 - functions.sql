-- 1 Función para Obtener el Precio Mínimo de un Componente
DELIMITER $$
CREATE FUNCTION Get_Min_Price (intern_pn VARCHAR(100))
RETURNS DECIMAL(15, 2)
DETERMINISTIC
BEGIN
    DECLARE min_price DECIMAL(15, 2);
    DECLARE intern_pn_id INT;

    -- Obtener el intern_pn_id correspondiente al intern_pn
    SELECT pn_intern_id INTO intern_pn_id
    FROM manage_components.pn_intern
    WHERE intern_pn = intern_pn
    LIMIT 1;

    -- Obtener el precio mínimo de la tabla de precios utilizando el intern_pn_id
    SELECT MIN(p.price) INTO min_price
    FROM manage_components.prices AS p
    WHERE p.intern_pn_id = intern_pn_id
    LIMIT 1;

    RETURN min_price;
END$$
DELIMITER ;

-- 2 Funcion para obtener el estado de ciclo de vida de un componente
DELIMITER $$
CREATE FUNCTION Get_Lifecycle_Status (intern_pn VARCHAR(100))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE lifecycle_status VARCHAR(50);

    -- Obtener el estado del ciclo de vida de un componente
    SELECT i.lifecycle INTO lifecycle_status
    FROM manage_components.pn_intern AS i
    WHERE i.intern_pn = intern_pn;

    RETURN lifecycle_status;
END$$
DELIMITER ;

-- 3 Funcion para obtener el numero de proyectos asociados a un componente
DELIMITER $$

CREATE FUNCTION Get_Project_Count (intern_pn VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE project_count INT;
    DECLARE intern_pn_id INT;

    -- Obtener el intern_pn_id para el intern_pn dado
    SELECT pn_intern_id INTO intern_pn_id
    FROM manage_components.pn_intern
    WHERE intern_pn = intern_pn
    LIMIT 1;

    -- Contar el número de proyectos asociados con el intern_pn_id a través de la tabla intermedia
    SELECT COUNT(DISTINCT p.project_id) INTO project_count
    FROM manage_components.project AS p
    JOIN manage_components.relation_projects_internpn AS rp ON p.project_id = rp.project_id
    WHERE rp.intern_pn_id = intern_pn_id;

    RETURN project_count;
END$$

DELIMITER ;

-- 4 Funcion para obtener el stock disponible de un componente en almacenes
DELIMITER $$

CREATE FUNCTION Get_Stock_Available (intern_pn VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_available INT;

    -- Obtener la cantidad de stock disponible para el componente
    SELECT SUM(s.quantity) INTO stock_available
    FROM manage_components.stock AS s
    JOIN manage_components.pn_intern AS i ON i.pn_intern_id = s.intern_pn_id
    WHERE i.intern_pn = intern_pn;

    RETURN stock_available;
END$$

DELIMITER ;

-- 5 Funcion para obtener la fecha de fin de vida (EOL) de un componente
DELIMITER $$

CREATE FUNCTION Get_EOL_Date (intern_pn VARCHAR(100))
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE eol_date DATE;

    -- Obtener la fecha de fin de vida del componente
    SELECT m.eol_date INTO eol_date
    FROM manage_components.pn_manufacturer AS m
    JOIN manage_components.pn_intern AS i ON i.pn_intern_id = m.pn_intern_id
    WHERE i.intern_pn = intern_pn;

    RETURN eol_date;
END$$

DELIMITER ;
-- 6 Funcion para obtener el estado de un componente desde una API especifica
DELIMITER $$

CREATE FUNCTION Get_API_Lifecycle_Status (intern_pn VARCHAR(100), api_name VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE api_status VARCHAR(50);

    -- Obtener el estado de ciclo de vida de la API seleccionada
    SELECT MAX(CASE 
                WHEN a.source_api = api_name THEN a.lifecycle 
                ELSE NULL END) INTO api_status
    FROM manage_components.api_data AS a
    JOIN manage_components.pn_manufacturer AS m ON m.manuf_pn_id = a.manuf_pn_id
    JOIN manage_components.pn_intern AS i ON i.pn_intern_id = m.pn_intern_id
    WHERE i.intern_pn = intern_pn;

    RETURN api_status;
END$$

DELIMITER ;


-- Pruebas
-- SELECT Get_Min_Price('INT001') AS Precio_Minimo;
-- SELECT Get_Lifecycle_Status('INT001') AS EstadoCicloVida;
-- SELECT Get_Project_Count('INT002') AS NumeroDeProyectos;
-- SELECT Get_Stock_Available('INT001') AS StockDisponible;
-- SELECT Get_EOL_Date('INT001') AS FechaEOL;
-- SELECT Get_API_Lifecycle_Status('INT001', 'Arrow') AS EstadoArrow;
