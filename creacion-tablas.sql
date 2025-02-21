
CREATE DATABASE manage_components;
USE manage_components;

CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    proj_name VARCHAR(100) NOT NULL,
    descrip VARCHAR(500),
    client VARCHAR(100)
);

CREATE TABLE pn_intern (
    pn_intern_id INT AUTO_INCREMENT PRIMARY KEY, 
    intern_pn VARCHAR(100) UNIQUE NOT NULL,
    descrip VARCHAR(500),
    lifecycle VARCHAR(50),
    eol_date DATE,
    quality_grade VARCHAR(50),
    replace_id VARCHAR(50),
    update_date DATE
);

CREATE TABLE pn_manufacturer (
    manuf_pn_id VARCHAR(100) PRIMARY KEY, -- Se mantiene como PK porque los PNs de fabricantes incluyen letras
    pn_intern_id INT,
    descrip VARCHAR(500),
    manufacturer VARCHAR(100),
    lifecycle VARCHAR(50),
    eol_date DATE,
    replace_id VARCHAR(50),
    FOREIGN KEY (pn_intern_id) REFERENCES pn_intern(pn_intern_id) ON DELETE SET NULL
);

CREATE TABLE suppliers (
    supplier_number_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) unique NOT NULL,
    isDistributor TINYINT(1),
    country VARCHAR(50),
    main_contact VARCHAR(100)
);

CREATE TABLE stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    intern_pn_id INT,
    description VARCHAR(200),
    state VARCHAR(20),
    update_date DATE,
    warehouse VARCHAR(100),
    quantity INT,
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(pn_intern_id) ON DELETE SET NULL
);

CREATE TABLE api_data (
    api_data_id INT AUTO_INCREMENT PRIMARY KEY,
    manuf_pn_id VARCHAR(100),
    source_api VARCHAR(100),
    price DECIMAL(15,2),
    currency VARCHAR(3),
    MOQ INT,
    lifecycle VARCHAR(50),
    descrip VARCHAR(300),
    FOREIGN KEY (manuf_pn_id) REFERENCES pn_manufacturer(manuf_pn_id) ON DELETE SET null
);

CREATE TABLE prices (
    price_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    intern_pn_id INT,
    price DECIMAL(15,2),
    currency VARCHAR(3),
    price_source VARCHAR(30),
    MOQ INT,
    payment_conditions VARCHAR(100),
    update_date DATE,
    incoterm VARCHAR(50),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_number_id) ON DELETE CASCADE,
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(pn_intern_id) ON DELETE SET NULL
);

CREATE TABLE relation_projects_internpn (
    relation_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    intern_pn_id INT,
    FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(pn_intern_id) ON DELETE CASCADE
);


CREATE TABLE relation_suppliers_internpn (
    relation_id INT AUTO_INCREMENT PRIMARY KEY,
    intern_pn_id INT,
    supplier_id INT,
    currentcontract TINYINT(1),
    used TINYINT(1),
    FOREIGN KEY (intern_pn_id) REFERENCES pn_intern(pn_intern_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_number_id) ON DELETE CASCADE
);