INSERT INTO manage_components.project (project_id, proj_name, descrip, client) VALUES
('PROJ001', 'Project Alpha', 'Descrip of Alpha Project', 'Client A'),
('PROJ002', 'Project Beta', 'Descrip of Beta Project', 'Client B'),
('PROJ003', 'Project Gamma', 'Descript of Gamma Project', 'Client C');

INSERT INTO manage_components.pn_intern (intern_pn_id, descrip, lifecycle, eol_date, quality_grade, replace_id, update_date) VALUES
('INT001', 'Capacitor 10uF 16V', 'Active', NULL, 'Industrial', NULL, '2024-02-01'),
('INT002', 'Resistor 1k Ohm 1%', 'Active', NULL, 'Automotive', NULL, '2024-02-01'),
('INT003', 'IC 555 Timer', 'NRND', NULL, 'Industrial', NULL, '2024-02-01'),
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

INSERT INTO manage_components.suppliers (supplier_id, name, supplier_number, isDistributor, country, main_contact) VALUES
('SUP001', 'Digikey', 'DK12345', 1, 'USA', 'contact@digikey.com'),
('SUP002', 'Arrow', 'AR67890', 1, 'USA', 'sales@arrow.com'),
('SUP003', 'Avnet', 'AV54321', 1, 'USA', 'support@avnet.com');

INSERT INTO manage_components.pn_manufacturer (manuf_pn_id, intern_pn_id, descrip, manufacturer, lifecycle, eol_date, replace_id) VALUES
('MAN001', 'INT001', 'Capacitor 10uF 16V', 'Murata', 'Active', NULL, NULL),
('MAN002', 'INT002', 'Resistor 1k Ohm 1%', 'Vishay', 'Active', NULL, NULL),
('MAN003', 'INT003', 'IC 555 Timer', 'Texas Instruments', 'NRND', NULL, NULL),
('MAN004', 'INT004', 'Transistor NPN 2N3904', 'ON Semiconductor', 'Last Time Buy', '2025-12-31', NULL),
('MAN005', 'INT005', 'Diode 1N4001', 'Fairchild', 'Obsolete', '2022-12-31', 'INT002');

INSERT INTO manage_components.prices (supplier_id, intern_pn_id, price, currency, price_source, MOQ, payment_conditions, update_date, incoterm) VALUES
('SUP001', 'INT001', 0.10, 'USD', 'Online', 100, 'Net 30', '2024-02-01', 'FOB'),
('SUP002', 'INT002', 0.05, 'USD', 'Online', 200, 'Net 30', '2024-02-01', 'FOB'),
('SUP003', 'INT003', 0.50, 'USD', 'Online', 50, 'Net 30', '2024-02-01', 'FOB'),
('SUP001', 'INT004', 0.20, 'USD', 'Online', 150, 'Net 30', '2024-02-01', 'FOB'),
('SUP002', 'INT005', 0.15, 'USD', 'Online', 300, 'Net 30', '2024-02-01', 'FOB');

INSERT INTO manage_components.stock (intern_pn_id, description, state, update_date, warehouse, quantity) VALUES
('INT001', 'Capacitor 10uF 16V', 'Available', '2024-02-01', 'WH1', 500),
('INT002', 'Resistor 1k Ohm 1%', 'Available', '2024-02-01', 'WH2', 1000),
('INT003', 'IC 555 Timer', 'Low Stock', '2024-02-01', 'WH1', 50),
('INT004', 'Transistor NPN 2N3904', 'Available', '2024-02-01', 'WH3', 300),
('INT005', 'Diode 1N4001', 'Out of Stock', '2024-02-01', 'WH2', 0);

INSERT INTO manage_components.api_data 
(supplier_id, descrip, manuf_pn_id, price, currency, MOQ, lifecycle) 
VALUES
-- Capacitor 10uF 16V
('SUP001', 'Capacitor 10uF 16V - Murata', 'MAN001', 0.12, 'USD', 100, 'Active'),
('SUP002', 'Capacitor 10uF 16V - TDK', 'MAN001', 0.14, 'USD', 120, 'NRND'),
('SUP003', 'Capacitor 10uF 16V - Samsung', 'MAN001', 0.11, 'USD', 90, 'Last Time Buy'),

-- Resistor 1k Ohm 1%
('SUP001', 'Resistor 1k Ohm 1% - Vishay', 'MAN002', 0.06, 'USD', 200, 'Active'),
('SUP002', 'Resistor 1k Ohm 1% - Yageo', 'MAN002', 0.07, 'USD', 250, 'Active'),
('SUP003', 'Resistor 1k Ohm 1% - Panasonic', 'MAN002', 0.05, 'USD', 180, 'Obsolete'),

-- IC 555 Timer
('SUP001', 'IC 555 Timer - Texas Instruments', 'MAN003', 0.55, 'USD', 50, 'NRND'),
('SUP002', 'IC 555 Timer - STMicroelectronics', 'MAN003', 0.60, 'USD', 70, 'Active'),
('SUP003', 'IC 555 Timer - ON Semiconductor', 'MAN003', 0.53, 'USD', 60, 'Last Time Buy'),

-- Transistor NPN 2N3904
('SUP001', 'Transistor NPN 2N3904 - ON Semiconductor', 'MAN004', 0.25, 'USD', 150, 'Last Time Buy'),
('SUP002', 'Transistor NPN 2N3904 - Fairchild', 'MAN004', 0.22, 'USD', 130, 'Active'),
('SUP003', 'Transistor NPN 2N3904 - Diodes Inc.', 'MAN004', 0.27, 'USD', 140, 'NRND'),

-- Diode 1N4001
('SUP001', 'Diode 1N4001 - Fairchild', 'MAN005', 0.18, 'USD', 300, 'Obsolete'),
('SUP002', 'Diode 1N4001 - Vishay', 'MAN005', 0.20, 'USD', 280, 'Active'),
('SUP003', 'Diode 1N4001 - ON Semiconductor', 'MAN005', 0.17, 'USD', 310, 'Last Time Buy');


INSERT INTO manage_components.relation_projects_internpn (relation_id, project_id, intern_pn_id) VALUES
('REL001', 'PROJ001', 'INT001'),
('REL002', 'PROJ002', 'INT002'),
('REL003', 'PROJ003', 'INT003'),
('REL004', 'PROJ001', 'INT004'),
('REL005', 'PROJ002', 'INT005');

INSERT INTO manage_components.relation_suppliers_internpn (relation_id, intern_pn_id, supplier_id, currentcontract, used) VALUES
('RSI001', 'INT001', 'SUP001', 1, 1),
('RSI002', 'INT002', 'SUP002', 1, 1),
('RSI003', 'INT003', 'SUP003', 1, 1),
('RSI004', 'INT004', 'SUP001', 0, 0),
('RSI005', 'INT005', 'SUP002', 0, 1);