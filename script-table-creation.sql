-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS gestion_componentes;
USE gestion_componentes;

-- Crear tablas sin claves foráneas
CREATE TABLE Proyectos (
    Proyecto_ID VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(500),
    Cliente VARCHAR(100),
    SOP DATE,
    Presupuesto DECIMAL(15,2),
    Fecha_Inicio DATE,
    Fecha_Fin DATE
);

CREATE TABLE PN_fabricante (
    PN_Fabricante_ID VARCHAR(20) PRIMARY KEY,
    PN_Empresa_ID VARCHAR(20) UNIQUE,
    Descripcion VARCHAR(500),
    Fabricante VARCHAR(100),
    Estado VARCHAR(20),
    Fecha_Obsolescencia DATE,
    Reemplazo_ID VARCHAR(20)
);

CREATE TABLE PN_Interno (
    PN_Interno_ID VARCHAR(20) PRIMARY KEY,
    Descripcion VARCHAR(500),
    Estado VARCHAR(20),
    Fecha_Obsolescencia DATE,
    Fecha_Actualizacion DATE
);

CREATE TABLE Proveedores (
    Proveedor_ID VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100),
    Numero_Proveedor VARCHAR(50),
    Es_Distribuidor BOOLEAN,
    Pais VARCHAR(50),
    Valoracion INT,
    Contacto_Principal VARCHAR(100)
);

CREATE TABLE Stock (
    Stock_ID VARCHAR(20) PRIMARY KEY,
    PN_Empresa_ID VARCHAR(20),
    Descripcion VARCHAR(500),
    Estado VARCHAR(20),
    Fecha_Obsolescencia DATE,
    Fecha_Actualizacion DATE,
    Almacen VARCHAR(50)
);

CREATE TABLE Datos_API (
    API_ID VARCHAR(20) PRIMARY KEY,
    PN_Fabricante_ID VARCHAR(20),
    API_Nombre VARCHAR(100),
    Precio DECIMAL(15,2),
    Moneda VARCHAR(3),
    MOQ INT,
    Estado_Obsolescencia VARCHAR(20),
    Descripcion_API VARCHAR(100)
);

CREATE TABLE Precios (
    Precio_ID VARCHAR(20) PRIMARY KEY,
    Proveedor_ID VARCHAR(20),
    PN_Interno_ID VARCHAR(20),
    Precio DECIMAL(15,2),
    Moneda VARCHAR(3),
    MOQ INT,
    Condicion_Pago VARCHAR(50),
    Fecha_Actualizacion DATE,
    Incoterm VARCHAR(20)
);

CREATE TABLE Historico_Stock (
    Historico_Stock_ID VARCHAR(20) PRIMARY KEY,
    Stock_ID VARCHAR(20),
    PN_Interno_ID VARCHAR(20),
    Cantidad_Movimiento INT,
    Tipo_Movimiento VARCHAR(20),
    Fecha_Movimiento DATE,
    Usuario VARCHAR(50),
    Referencia_Documento VARCHAR(50)
);

CREATE TABLE Historico_Precios_Compras (
    Historico_Precio_Compra_ID VARCHAR(20) PRIMARY KEY,
    Precio_ID VARCHAR(20),
    PN_Interno_ID VARCHAR(20),
    Proveedor_ID VARCHAR(20),
    Precio_Anterior DECIMAL(15,2),
    Fecha_Cambio DATE,
    Motivo_Cambio VARCHAR(200),
    Usuario VARCHAR(50),
    MOQ INT,
    Condicion_Pago VARCHAR(50)
);

CREATE TABLE Historico_Precios_API (
    Historico_Precio_API_ID VARCHAR(20) PRIMARY KEY,
    API_ID VARCHAR(20),
    PN_Interno_ID VARCHAR(20),
    Precio_API_Anterior DECIMAL(15,2),
    Fecha_Captura DATE,
    Fuente_API VARCHAR(100),
    MOQ_API INT,
    Moneda VARCHAR(3),
    Estado_Disponibilidad VARCHAR(20)
);

CREATE TABLE Relacion_Proyectos_PNs (
    Relacion_ID VARCHAR(20) PRIMARY KEY,
    Proyecto_ID VARCHAR(20),
    PN_Empresa_ID VARCHAR(20)
);

CREATE TABLE Relacion_Proveedores_PNs (
    Relacion_ID VARCHAR(20) PRIMARY KEY,
    PN_Interno_ID VARCHAR(20),
    Proveedor_ID VARCHAR(20),
    Contrato_Vigente BOOLEAN,
    Nominacion VARCHAR(50)
);

CREATE TABLE Historico_Estado_PN (
    Historico_Estado_ID VARCHAR(20) PRIMARY KEY,
    PN_Interno_ID VARCHAR(20),
    Estado_Anterior VARCHAR(20),
    Estado_Nuevo VARCHAR(20),
    Fecha_Cambio DATE,
    Motivo_Cambio VARCHAR(200),
    Usuario VARCHAR(50)
);

-- Crear claves foráneas al final
ALTER TABLE Stock ADD FOREIGN KEY (PN_Empresa_ID) REFERENCES PN_fabricante(PN_Empresa_ID);
ALTER TABLE Datos_API ADD FOREIGN KEY (PN_Fabricante_ID) REFERENCES PN_fabricante(PN_Fabricante_ID);
ALTER TABLE Precios ADD FOREIGN KEY (Proveedor_ID) REFERENCES Proveedores(Proveedor_ID);
ALTER TABLE Precios ADD FOREIGN KEY (PN_Interno_ID) REFERENCES PN_Interno(PN_Interno_ID);
ALTER TABLE Historico_Stock ADD FOREIGN KEY (Stock_ID) REFERENCES Stock(Stock_ID);
ALTER TABLE Historico_Stock ADD FOREIGN KEY (PN_Interno_ID) REFERENCES PN_Interno(PN_Interno_ID);
ALTER TABLE Historico_Precios_Compras ADD FOREIGN KEY (PN_Interno_ID) REFERENCES PN_Interno(PN_Interno_ID);
ALTER TABLE Historico_Precios_Compras ADD FOREIGN KEY (Proveedor_ID) REFERENCES Proveedores(Proveedor_ID);
ALTER TABLE Historico_Precios_API ADD FOREIGN KEY (API_ID) REFERENCES Datos_API(API_ID);
ALTER TABLE Historico_Precios_API ADD FOREIGN KEY (PN_Interno_ID) REFERENCES PN_Interno(PN_Interno_ID);
ALTER TABLE Relacion_Proyectos_PNs ADD FOREIGN KEY (Proyecto_ID) REFERENCES Proyectos(Proyecto_ID);
ALTER TABLE Relacion_Proyectos_PNs ADD FOREIGN KEY (PN_Empresa_ID) REFERENCES PN_fabricante(PN_Empresa_ID);
ALTER TABLE Relacion_Proveedores_PNs ADD FOREIGN KEY (PN_Interno_ID) REFERENCES PN_Interno(PN_Interno_ID);
ALTER TABLE Relacion_Proveedores_PNs ADD FOREIGN KEY (Proveedor_ID) REFERENCES Proveedores(Proveedor_ID);
ALTER TABLE Historico_Estado_PN ADD FOREIGN KEY (PN_Interno_ID) REFERENCES PN_Interno(PN_Interno_ID);
