CREATE DATABASE manage_components;
USE manage_components;

CREATE TABLE project (
    project_id VARCHAR(50) PRIMARY KEY,
    proj_name VARCHAR(100) NOT NULL,
    descrip VARCHAR(500),
    client VARCHAR(100)
);

CREATE TABLE pn_intern (
    intern_pn_id VARCHAR(100) PRIMARY KEY,
    descrip VARCHAR(500),
    lifecycle VARCHAR(50),
    eol_date DATE,
    quality_grade VARCHAR(50),
    replace_id VARCHAR(50),
    update_date DATE
);

CREATE TABLE pn_manufacturer (
    manuf_pn_id VARCHAR(100) PRIMARY KEY,
    intern_pn_id VARCHAR(100) UNIQUE,
    descrip VARCHAR(500),
    manufacturer VARCHAR(100),
    lifecycle VARCHAR(50),
    eol_date DATE,
    replace_id VARCHAR(50),
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(intern_pn_id) ON DELETE SET NULL
);

CREATE TABLE suppliers (
    supplier_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    supplier_number VARCHAR(50),
    isDistributor TINYINT(1),
    country VARCHAR(50),
    main_contact VARCHAR(100)
);

CREATE TABLE stock (
    stock_id VARCHAR(20) PRIMARY KEY,
    intern_pn_id VARCHAR(100),
    description VARCHAR(200),
    state VARCHAR(20),
    update_date DATE,
    warehouse VARCHAR(100),
    quantity INT,
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(intern_pn_id) ON DELETE SET NULL
);

CREATE TABLE api_data (
    name VARCHAR(100) PRIMARY KEY,
    intern_pn_id VARCHAR(100),
    price DECIMAL(15,2),
    currency VARCHAR(3),
    MOQ INT,
    lifecycle VARCHAR(50),
    descrip VARCHAR(300),
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(intern_pn_id) ON DELETE SET NULL
);

CREATE TABLE prices (
    price_id VARCHAR(20) PRIMARY KEY,
    supplier_id VARCHAR(20),
    intern_pn_id VARCHAR(100),
    price DECIMAL(15,2),
    currency VARCHAR(3),
    price_source VARCHAR(30),
    MOQ INT,
    payment_conditions VARCHAR(100),
    update_date DATE,
    incoterm VARCHAR(50),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE CASCADE,
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(intern_pn_id) ON DELETE SET NULL
);

CREATE TABLE relation_projects_internpn (
    relation_id VARCHAR(20) PRIMARY KEY,
    project_id VARCHAR(50),
    intern_pn_id VARCHAR(100),
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(intern_pn_id) ON DELETE CASCADE
);

CREATE TABLE relation_suppliers_internpn (
    relation_id VARCHAR(20) PRIMARY KEY,
    intern_pn_id VARCHAR(100),
    supplier_id VARCHAR(50),
    currentcontract TINYINT(1),
    used TINYINT(1),
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(intern_pn_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE CASCADE
);
