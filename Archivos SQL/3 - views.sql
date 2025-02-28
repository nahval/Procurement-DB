use manage_components;
-- ----------------------------------- Vista 1 -----------------------------------------------
-- ------------ Comparativa de estados del ciclo de vida desde distintas APIs-----------------
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

-- SELECT * FROM manage_components.vista_estado_ciclo_vida;
-- ----------------------------------- Vista 2 -----------------------------------------------
-- ------------ Visualizar componentes asociados a un proyecto con filtro por ciclo de vida -----------------
CREATE OR REPLACE VIEW manage_components.vista_comparativa_ciclo_vida AS
SELECT 
    i.pn_intern_id as pn_intern_id,
    i.intern_pn as codigo_interno,
    i.descrip as internal_pn_description,
    i.lifecycle as estado_interno,
    p.project_id as project_id,
    p.proj_name as project_name,
    p.client as client,
    p.descrip as project_description
FROM 
    manage_components.project AS p
LEFT JOIN 
    manage_components.relation_projects_internpn AS cp ON p.project_id = cp.project_id
LEFT JOIN 
    manage_components.pn_intern AS i ON cp.intern_pn_id = i.pn_intern_id;
-- SELECT * FROM manage_components.vista_comparativa_ciclo_vida where proj_name = 'Project Alpha';

-- ----------------------------------- Vista 3 -----------------------------------------------
-- ------------ Comparativa de precios para un componente específico--------------------------
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

-- SELECT * FROM manage_components.vista_comparativa_precios WHERE intern_pn = 'INT001';
-- ----------------------------------- Vista 4 -----------------------------------------------
-- ---------------------- Dashboard de ciclo de vida por proyecto ----------------------------

CREATE OR REPLACE VIEW manage_components.vista_dashboard_proyecto AS
SELECT 
    pr.project_id,
    pr.proj_name,
    COUNT(CASE WHEN i.lifecycle = 'Active' THEN 1 ELSE NULL END) AS ACTIVOS,
    COUNT(CASE WHEN i.lifecycle = 'NRND' THEN 1 ELSE NULL END) AS NRND,
    COUNT(CASE WHEN i.lifecycle = 'Last Time Buy' THEN 1 ELSE NULL END) AS LAST_TIME_BUY,
    COUNT(CASE WHEN i.lifecycle = 'EOL' THEN 1 ELSE NULL END) AS EOL
FROM 
    manage_components.project AS pr
LEFT JOIN 
    manage_components.relation_projects_internpn AS pc ON pr.project_id = pc.project_id
LEFT JOIN 
    manage_components.pn_intern AS i ON pc.intern_pn_id = i.pn_intern_id
GROUP BY 
    pr.project_id, pr.proj_name;

-- SELECT * FROM manage_components.vista_dashboard_proyecto WHERE proj_name = 'Project Alpha';
-- ----------------------------------- Vista 5 -----------------------------------------------
-- ---------------------- Stock en todos los almacenes --------------------------------------
CREATE OR REPLACE VIEW manage_components.vista_stock_almacenes AS
SELECT 
    i.pn_intern_id as pn_intern_id,
    i.intern_pn as codigo_interno,
    i.descrip as descripcion,
    s.warehouse as deposito,
    s.quantity as cantidad
FROM 
    manage_components.pn_intern AS i
LEFT JOIN 
    manage_components.stock AS s ON i.pn_intern_id = s.intern_pn_id;

-- SELECT * FROM manage_components.vista_stock_almacenes WHERE intern_pn = 'INT002';