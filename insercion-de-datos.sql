-- Insert into projects table
INSERT INTO manage_components.project (proj_name, descrip, client) VALUES
('Project Alpha', 'Descrip of Alpha Project', 'Client A'),
('Project Beta', 'Descrip of Beta Project', 'Client B'),
('Project Gamma', 'Descript of Gamma Project', 'Client C');

-- Insert into pn_intern table
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
INSERT INTO manage_components.pn_manufacturer (manuf_pn_id,pn_intern_id, descrip, manufacturer, lifecycle, eol_date, replace_id) VALUES
('MAN001',1, 'Capacitor 10uF 16V', 'Murata', 'Active', NULL, NULL),
('MAN002',2, 'Resistor 1k Ohm 1%', 'Vishay', 'Active', NULL, NULL),
('MAN003',3, 'IC 555 Timer', 'Texas Instruments', 'NRND', NULL, NULL),
('MAN004',4, 'Transistor NPN 2N3904', 'ON Semiconductor', 'Last Time Buy', '2025-12-31', NULL),
('MAN005',5, 'Diode 1N4001', 'Fairchild', 'Obsolete', '2022-12-31', 'INT002');

-- Insert into prices table
INSERT INTO manage_components.prices (supplier_id ,intern_pn_id, price, currency, price_source, MOQ, payment_conditions, update_date, incoterm) VALUES
(1,1, 0.10, 'USD', 'Online', 100, 'Net 30', '2024-02-01', 'FOB'),
(2,2, 0.05, 'USD', 'Online', 200, 'Net 30', '2024-02-01', 'FOB'),
(3,3, 0.50, 'USD', 'Online', 50, 'Net 30', '2024-02-01', 'FOB'),
(1,4, 0.20, 'USD', 'Online', 150, 'Net 30', '2024-02-01', 'FOB'),
(2,5, 0.15, 'USD', 'Online', 300, 'Net 30', '2024-02-01', 'FOB');

-- Insert into stock table
INSERT INTO manage_components.stock (intern_pn_id, description, state, update_date, warehouse, quantity) VALUES
(1, 'Capacitor 10uF 16V', 'Available', '2024-02-01', 'WH1', 500),
(2, 'Resistor 1k Ohm 1%', 'Available', '2024-02-01', 'WH2', 1000),
(3, 'IC 555 Timer', 'Low Stock', '2024-02-01', 'WH1', 50),
(4, 'Transistor NPN 2N3904', 'Available', '2024-02-01', 'WH3', 300),
(5, 'Diode 1N4001', 'Out of Stock', '2024-02-01', 'WH2', 0);

-- Insert into api_data table
INSERT INTO manage_components.api_data 
(manuf_pn_id, source_api , descrip, price, currency, MOQ, lifecycle) 
VALUES
-- Capacitor 10uF 16V
('MAN001','Arrow', 'Capacitor 10uF 16V - Murata', 0.12, 'USD', 100, 'Active'),
('MAN001','Digikey', 'Capacitor 10uF 16V - TDK', 0.14, 'USD', 120, 'NRND'),
('MAN001','Octopart', 'Capacitor 10uF 16V - Samsung', 0.11, 'USD', 90, 'Last Time Buy'),

-- Resistor 1k Ohm 1%
('MAN002','Arrow', 'Resistor 1k Ohm 1% - Vishay', 0.06, 'USD', 200, 'Active'),
('MAN002','Digikey', 'Resistor 1k Ohm 1% - Yageo', 0.07, 'USD', 250, 'Active'),
('MAN002','Octopart', 'Resistor 1k Ohm 1% - Panasonic',0.05, 'USD', 180, 'Obsolete'),

-- IC 555 Timer
('MAN003','Arrow', 'IC 555 Timer - Texas Instruments',0.55, 'USD', 50, 'NRND'),
('MAN003','Digikey', 'IC 555 Timer - STMicroelectronics', 0.60, 'USD', 70, 'Active'),
('MAN003','Octopart', 'IC 555 Timer - ON Semiconductor',0.53, 'USD', 60, 'Last Time Buy'),

-- Transistor NPN 2N3904
('MAN004','Arrow', 'Transistor NPN 2N3904 - ON Semiconductor', 0.25, 'USD', 150, 'Last Time Buy'),
('MAN004','Digikey', 'Transistor NPN 2N3904 - Fairchild', 0.22, 'USD', 130, 'Active'),
('MAN004','Octopart', 'Transistor NPN 2N3904 - Diodes Inc.', 0.27, 'USD', 140, 'NRND'),

-- Diode 1N4001
('MAN005','Arrow', 'Diode 1N4001 - Fairchild', 0.18, 'USD', 300, 'Obsolete'),
('MAN005','Digikey', 'Diode 1N4001 - Vishay', 0.20, 'USD', 280, 'Active'),
('MAN005','Octopart', 'Diode 1N4001 - ON Semiconductor', 0.17, 'USD', 310, 'Last Time Buy');

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
