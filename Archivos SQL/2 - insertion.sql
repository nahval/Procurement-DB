USE manage_components;
-------------------------------------- Projects table -----------------------------------------------------------------------------
INSERT INTO manage_components.project (proj_name, descrip, client) VALUES
('Project Alpha', 'Descrip of Alpha Project', 'Client A'),
('Project Beta', 'Descrip of Beta Project', 'Client B'),
('Project Gamma', 'Descript of Gamma Project', 'Client C');

-------------------------------------- Insert into pn_intern table ---------------------------------------------------------------
INSERT INTO manage_components.pn_intern (intern_pn, descrip, lifecycle, eol_date, quality_grade, replace_id, update_date) VALUES
('INT001','Capacitor 10uF 16V', 'Active', NULL, 'Industrial', NULL, '2024-02-01'),
('INT002','Resistor 1k Ohm 1%', 'Active', NULL, 'Automotive', NULL, '2024-02-01'),
('INT003','IC 555 Timer', 'NRND', NULL, 'Industrial', NULL, '2024-02-01'),
('INT004', 'Transistor NPN 2N3904', 'Last Time Buy', '2025-12-31', 'Aerospace', NULL, '2024-02-01'),
('INT005', 'Diode 1N4001', 'Obsolete', '2022-12-31', 'Industrial', 'INT002', '2024-02-01'),
('INT006', 'Microcontroller ATmega328P', 'Active', NULL, 'Automotive', NULL, '2024-02-01'),
('INT007', 'Inductor 10uH', 'Active', NULL, 'Industrial', NULL, '2024-02-01'),
('INT008', 'LED Red 5mm', 'NRND', NULL, 'Aerospace', NULL, '2024-02-01'),
('INT009', 'Connector USB Type-C', 'Active', NULL, 'Automotive', NULL, '2024-02-01'),
('INT010', 'Oscillator 16MHz', 'Last Time Buy', '2026-06-30', 'Industrial', NULL, '2024-02-01'),
('INT011', 'Switch SPDT', 'Active', NULL, 'Aerospace', NULL, '2024-02-01'),
('INT012', 'Potentiometer 10k Ohm', 'NRND', NULL, 'Industrial', NULL, '2024-02-01'),
('INT013', 'Fuse 5A 250V', 'Active', NULL, 'Automotive', NULL, '2024-02-01'),
('INT014', 'Relay 12V', 'Last Time Buy', '2025-03-15', 'Aerospace', NULL, '2024-02-01'),
('INT015', 'Crystal 8MHz', 'Obsolete', '2023-01-15', 'Industrial', 'INT010', '2024-02-01');

-- Insert into suppliers table
INSERT INTO manage_components.suppliers (name, isDistributor, country, main_contact) VALUES
('Digikey', 1, 'USA', 'contact@digikey.com'),
('Arrow',  1, 'USA', 'sales@arrow.com'),
('Avnet', 1, 'USA', 'support@avnet.com');

-- Insert into pn_manufacturer table
INSERT INTO manage_components.pn_manufacturer (manuf_pn,pn_intern_id, descrip, manufacturer, lifecycle, eol_date, replace_id) VALUES
('MAN001',1, 'Capacitor 10uF 16V', 'Murata', 'Active', NULL, NULL),
('MAN002',2, 'Resistor 1k Ohm 1%', 'Vishay', 'Active', NULL, NULL),
('MAN003',3, 'IC 555 Timer', 'Texas Instruments', 'NRND', NULL, NULL),
('MAN004',4, 'Transistor NPN 2N3904', 'ON Semiconductor', 'Last Time Buy', '2025-12-31', NULL),
('MAN005',5, 'Diode 1N4001', 'Fairchild', 'Obsolete', '2022-12-31', 'INT002'),
('MAN006',6, 'Microcontroller ATmega328P', 'Atmel', 'Active', NULL, NULL),
('MAN007',7, 'Inductor 10uH', 'Murata', 'Active', NULL, NULL),
('MAN008',8, 'LED Red 5mm', 'Osram', 'NRND', NULL, NULL),
('MAN009',9, 'Connector USB Type-C', 'Amphenol', 'Active', NULL, NULL),
('MAN010',10, 'Oscillator 16MHz', 'Epson', 'Last Time Buy', '2026-06-30', NULL),
('MAN011',11, 'Switch SPDT', 'Honeywell', 'Active', NULL, NULL),
('MAN012',12, 'Potentiometer 10k Ohm', 'Bourns', 'NRND', NULL, NULL),
('MAN013',13, 'Fuse 5A 250V', 'Littelfuse', 'Active', NULL, NULL),
('MAN014',14, 'Relay 12V', 'Schneider Electric', 'Last Time Buy', '2025-03-15', NULL),
('MAN015',15, 'Crystal 8MHz', 'Epson', 'Obsolete', '2023-01-15', 'INT010');

-- Insert into prices table
INSERT INTO manage_components.prices (supplier_id ,intern_pn_id, price, currency, price_source, MOQ, payment_conditions, update_date, incoterm) VALUES
(1,1, 0.10, 'USD', 'Online', 100, 'Net 30', '2024-02-01', 'FOB'),
(2,2, 0.05, 'USD', 'Online', 200, 'Net 30', '2024-02-01', 'FOB'),
(3,3, 0.50, 'USD', 'Online', 50, 'Net 30', '2024-02-01', 'FOB'),
(1,4, 0.20, 'USD', 'Online', 150, 'Net 30', '2024-02-01', 'FOB'),
(2,5, 0.15, 'USD', 'Online', 300, 'Net 30', '2024-02-01', 'FOB'),
(1,6, 2.50, 'USD', 'Online', 100, 'Net 30', '2024-02-01', 'FOB'),
(2,7, 0.08, 'USD', 'Online', 200, 'Net 30', '2024-02-01', 'FOB'),
(3,8, 0.10, 'USD', 'Online', 150, 'Net 30', '2024-02-01', 'FOB'),
(1,9, 1.50, 'USD', 'Online', 50, 'Net 30', '2024-02-01', 'FOB'),
(2,10, 0.30, 'USD', 'Online', 100, 'Net 30', '2024-02-01', 'FOB'),
(3,11, 0.75, 'USD', 'Online', 500, 'Net 30', '2024-02-01', 'FOB'),
(1,12, 0.05, 'USD', 'Online', 300, 'Net 30', '2024-02-01', 'FOB'),
(2,13, 0.12, 'USD', 'Online', 200, 'Net 30', '2024-02-01', 'FOB'),
(3,14, 0.30, 'USD', 'Online', 400, 'Net 30', '2024-02-01', 'FOB'),
(1,15, 0.40, 'USD', 'Online', 150, 'Net 30', '2024-02-01', 'FOB');

-- Insert into stock table
INSERT INTO manage_components.stock (intern_pn_id, description, state, update_date, warehouse, quantity) VALUES
(1, 'Almacen WH1', 'Available', '2024-02-01', 'WH1', 500),
(2, 'Almacen WH2', 'Available', '2024-02-01', 'WH2', 1000),
(3, 'Almacen WH1', 'Low Stock', '2024-02-01', 'WH1', 50),
(4, 'Almacen WH3', 'Available', '2024-02-01', 'WH3', 300),
(5, 'Almacen WH2', 'Out of Stock', '2024-02-01', 'WH2', 0),
(6, 'Almacen WH1', 'Available', '2024-02-01', 'WH1', 150),
(7, 'Almacen WH2', 'Available', '2024-02-01', 'WH2', 800),
(8, 'Almacen WH3', 'Low Stock', '2024-02-01', 'WH3', 50),
(9, 'Almacen WH1', 'Available', '2024-02-01', 'WH1', 600),
(10, 'Almacen WH2', 'Available', '2024-02-01', 'WH2', 200),
(11, 'Almacen WH3', 'Low Stock', '2024-02-01', 'WH3', 40),
(12, 'Almacen WH1', 'Available', '2024-02-01', 'WH1', 900),
(13, 'Almacen WH2', 'Available', '2024-02-01', 'WH2', 1000),
(14, 'Almacen WH3', 'Low Stock', '2024-02-01', 'WH3', 30),
(15, 'Almacen WH2', 'Out of Stock', '2024-02-01', 'WH2', 0);

-- Insert into api_data table
INSERT INTO manage_components.api_data 
(manuf_pn_id, source_api , descrip, price, currency, MOQ, lifecycle) 
VALUES
-- Capacitor 10uF 16V
(1,'Arrow', 'Capacitor 10uF 16V - Murata', 0.12, 'USD', 100, 'Active'),
(1,'Digikey', 'Capacitor 10uF 16V - TDK', 0.14, 'USD', 120, 'NRND'),
(1,'Octopart', 'Capacitor 10uF 16V - Samsung', 0.11, 'USD', 90, 'Last Time Buy'),

-- Resistor 1k Ohm 1%
(2,'Arrow', 'Resistor 1k Ohm 1% - Vishay', 0.06, 'USD', 200, 'Active'),
(2,'Digikey', 'Resistor 1k Ohm 1% - Yageo', 0.07, 'USD', 250, 'Active'),
(2,'Octopart', 'Resistor 1k Ohm 1% - Panasonic',0.05, 'USD', 180, 'Obsolete'),

-- IC 555 Timer
(3,'Arrow', 'IC 555 Timer - Texas Instruments',0.55, 'USD', 50, 'NRND'),
(3,'Digikey', 'IC 555 Timer - STMicroelectronics', 0.60, 'USD', 70, 'Active'),
(3,'Octopart', 'IC 555 Timer - ON Semiconductor',0.53, 'USD', 60, 'Last Time Buy'),

-- Transistor NPN 2N3904
(4,'Arrow', 'Transistor NPN 2N3904 - ON Semiconductor', 0.25, 'USD', 150, 'Last Time Buy'),
(4,'Digikey', 'Transistor NPN 2N3904 - Fairchild', 0.22, 'USD', 130, 'Active'),
(4,'Octopart', 'Transistor NPN 2N3904 - Diodes Inc.', 0.27, 'USD', 140, 'NRND'),

-- Diode 1N4001
(5,'Arrow', 'Diode 1N4001 - Fairchild', 0.18, 'USD', 300, 'Obsolete'),
(5,'Digikey', 'Diode 1N4001 - Vishay', 0.20, 'USD', 280, 'Active'),
(5,'Octopart', 'Diode 1N4001 - ON Semiconductor', 0.17, 'USD', 310, 'Last Time Buy'),

-- Microcontroller ATmega328P
(6,'Arrow', 'Microcontroller ATmega328P - Atmel', 2.55, 'USD', 100, 'Active'),
(6,'Digikey', 'Microcontroller ATmega328P - Atmel', 2.60, 'USD', 120, 'Active'),
(6,'Octopart', 'Microcontroller ATmega328P - Atmel', 2.50, 'USD', 150, 'Active'),

-- Inductor 10uH
(7,'Arrow', 'Inductor 10uH - Murata', 0.09, 'USD', 200, 'Active'),
(7,'Digikey', 'Inductor 10uH - TDK', 0.08, 'USD', 250, 'Active'),
(7,'Octopart', 'Inductor 10uH - Coilcraft', 0.10, 'USD', 150, 'Active'),

-- LED Red 5mm
(8,'Arrow', 'LED Red 5mm - Osram', 0.12, 'USD', 100, 'NRND'),
(8,'Digikey', 'LED Red 5mm - Cree', 0.13, 'USD', 120, 'NRND'),
(8,'Octopart', 'LED Red 5mm - Philips', 0.11, 'USD', 130, 'NRND'),

-- Connector USB Type-C
(9,'Arrow', 'Connector USB Type-C - Amphenol', 1.55, 'USD', 50, 'Active'),
(9,'Digikey', 'Connector USB Type-C - Molex', 1.50, 'USD', 70, 'Active'),
(9,'Octopart', 'Connector USB Type-C - TE Connectivity', 1.60, 'USD', 60, 'Active'),

-- Oscillator 16MHz
(10,'Arrow', 'Oscillator 16MHz - Epson', 0.35, 'USD', 100, 'Last Time Buy'),
(10,'Digikey', 'Oscillator 16MHz - Citizen', 0.40, 'USD', 120, 'Last Time Buy'),
(10,'Octopart', 'Oscillator 16MHz - Abracon', 0.30, 'USD', 130, 'Last Time Buy'),

-- Switch SPDT
(11,'Arrow', 'Switch SPDT - Honeywell', 0.80, 'USD', 500, 'Active'),
(11,'Digikey', 'Switch SPDT - Omron', 0.85, 'USD', 450, 'Active'),
(11,'Octopart', 'Switch SPDT - Panasonic', 0.75, 'USD', 400, 'Active'),

-- Potentiometer 10k Ohm
(12,'Arrow', 'Potentiometer 10k Ohm - Bourns', 0.06, 'USD', 300, 'NRND'),
(12,'Digikey', 'Potentiometer 10k Ohm - Vishay', 0.07, 'USD', 350, 'NRND'),
(12,'Octopart', 'Potentiometer 10k Ohm - Alps', 0.05, 'USD', 250, 'NRND'),

-- Fuse 5A 250V
(13,'Arrow', 'Fuse 5A 250V - Littelfuse', 0.15, 'USD', 200, 'Active'),
(13,'Digikey', 'Fuse 5A 250V - Bussmann', 0.12, 'USD', 250, 'Active'),
(13,'Octopart', 'Fuse 5A 250V - Schurter', 0.18, 'USD', 220, 'Active'),

-- Relay 12V
(14,'Arrow', 'Relay 12V - Schneider Electric', 0.32, 'USD', 400, 'Last Time Buy'),
(14,'Digikey', 'Relay 12V - Omron', 0.35, 'USD', 350, 'Last Time Buy'),
(14,'Octopart', 'Relay 12V - Panasonic', 0.30, 'USD', 380, 'Last Time Buy'),

-- Crystal 8MHz
(15,'Arrow', 'Crystal 8MHz - Epson', 0.45, 'USD', 150, 'Obsolete'),
(15,'Digikey', 'Crystal 8MHz - TXC', 0.40, 'USD', 180, 'Obsolete'),
(15,'Octopart', 'Crystal 8MHz - Seiko', 0.50, 'USD', 140, 'Obsolete');

-- Insert into relation_projects_internpn table
INSERT INTO manage_components.relation_projects_internpn (project_id, intern_pn_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5);

-- Insert into relation_suppliers_internpn table
INSERT INTO manage_components.relation_suppliers_internpn (intern_pn_id, supplier_id, currentcontract, used) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 1, 0, 0),
(5, 2, 0, 1);
