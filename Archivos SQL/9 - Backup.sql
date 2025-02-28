-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: manage_components
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_data`
--

DROP TABLE IF EXISTS `api_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_data` (
  `api_data_id` int NOT NULL AUTO_INCREMENT,
  `manuf_pn_id` int DEFAULT NULL,
  `source_api` varchar(100) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `MOQ` int DEFAULT NULL,
  `lifecycle` varchar(50) DEFAULT NULL,
  `descrip` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`api_data_id`),
  KEY `manuf_pn_id` (`manuf_pn_id`),
  CONSTRAINT `api_data_ibfk_1` FOREIGN KEY (`manuf_pn_id`) REFERENCES `pn_manufacturer` (`manuf_pn_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_data`
--

LOCK TABLES `api_data` WRITE;
/*!40000 ALTER TABLE `api_data` DISABLE KEYS */;
INSERT INTO `api_data` VALUES (1,1,'Arrow',0.12,'USD',100,'Active','Capacitor 10uF 16V - Murata'),(2,1,'Digikey',0.14,'USD',120,'NRND','Capacitor 10uF 16V - TDK'),(3,1,'Octopart',0.11,'USD',90,'Last Time Buy','Capacitor 10uF 16V - Samsung'),(4,2,'Arrow',0.06,'USD',200,'Active','Resistor 1k Ohm 1% - Vishay'),(5,2,'Digikey',0.07,'USD',250,'Active','Resistor 1k Ohm 1% - Yageo'),(6,2,'Octopart',0.05,'USD',180,'Obsolete','Resistor 1k Ohm 1% - Panasonic'),(7,3,'Arrow',0.55,'USD',50,'NRND','IC 555 Timer - Texas Instruments'),(8,3,'Digikey',0.60,'USD',70,'Active','IC 555 Timer - STMicroelectronics'),(9,3,'Octopart',0.53,'USD',60,'Last Time Buy','IC 555 Timer - ON Semiconductor'),(10,4,'Arrow',0.25,'USD',150,'Last Time Buy','Transistor NPN 2N3904 - ON Semiconductor'),(11,4,'Digikey',0.22,'USD',130,'Active','Transistor NPN 2N3904 - Fairchild'),(12,4,'Octopart',0.27,'USD',140,'NRND','Transistor NPN 2N3904 - Diodes Inc.'),(13,5,'Arrow',0.18,'USD',300,'Obsolete','Diode 1N4001 - Fairchild'),(14,5,'Digikey',0.20,'USD',280,'Active','Diode 1N4001 - Vishay'),(15,5,'Octopart',0.17,'USD',310,'Last Time Buy','Diode 1N4001 - ON Semiconductor'),(16,6,'Arrow',2.55,'USD',100,'Active','Microcontroller ATmega328P - Atmel'),(17,6,'Digikey',2.60,'USD',120,'Active','Microcontroller ATmega328P - Atmel'),(18,6,'Octopart',2.50,'USD',150,'Active','Microcontroller ATmega328P - Atmel'),(19,7,'Arrow',0.09,'USD',200,'Active','Inductor 10uH - Murata'),(20,7,'Digikey',0.08,'USD',250,'Active','Inductor 10uH - TDK'),(21,7,'Octopart',0.10,'USD',150,'Active','Inductor 10uH - Coilcraft'),(22,8,'Arrow',0.12,'USD',100,'NRND','LED Red 5mm - Osram'),(23,8,'Digikey',0.13,'USD',120,'NRND','LED Red 5mm - Cree'),(24,8,'Octopart',0.11,'USD',130,'NRND','LED Red 5mm - Philips'),(25,9,'Arrow',1.55,'USD',50,'Active','Connector USB Type-C - Amphenol'),(26,9,'Digikey',1.50,'USD',70,'Active','Connector USB Type-C - Molex'),(27,9,'Octopart',1.60,'USD',60,'Active','Connector USB Type-C - TE Connectivity'),(28,10,'Arrow',0.35,'USD',100,'Last Time Buy','Oscillator 16MHz - Epson'),(29,10,'Digikey',0.40,'USD',120,'Last Time Buy','Oscillator 16MHz - Citizen'),(30,10,'Octopart',0.30,'USD',130,'Last Time Buy','Oscillator 16MHz - Abracon'),(31,11,'Arrow',0.80,'USD',500,'Active','Switch SPDT - Honeywell'),(32,11,'Digikey',0.85,'USD',450,'Active','Switch SPDT - Omron'),(33,11,'Octopart',0.75,'USD',400,'Active','Switch SPDT - Panasonic'),(34,12,'Arrow',0.06,'USD',300,'NRND','Potentiometer 10k Ohm - Bourns'),(35,12,'Digikey',0.07,'USD',350,'NRND','Potentiometer 10k Ohm - Vishay'),(36,12,'Octopart',0.05,'USD',250,'NRND','Potentiometer 10k Ohm - Alps'),(37,13,'Arrow',0.15,'USD',200,'Active','Fuse 5A 250V - Littelfuse'),(38,13,'Digikey',0.12,'USD',250,'Active','Fuse 5A 250V - Bussmann'),(39,13,'Octopart',0.18,'USD',220,'Active','Fuse 5A 250V - Schurter'),(40,14,'Arrow',0.32,'USD',400,'Last Time Buy','Relay 12V - Schneider Electric'),(41,14,'Digikey',0.35,'USD',350,'Last Time Buy','Relay 12V - Omron'),(42,14,'Octopart',0.30,'USD',380,'Last Time Buy','Relay 12V - Panasonic'),(43,15,'Arrow',0.45,'USD',150,'Obsolete','Crystal 8MHz - Epson'),(44,15,'Digikey',0.40,'USD',180,'Obsolete','Crystal 8MHz - TXC'),(45,15,'Octopart',0.50,'USD',140,'Obsolete','Crystal 8MHz - Seiko');
/*!40000 ALTER TABLE `api_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `operation_type` varchar(10) NOT NULL,
  `record_id` int NOT NULL,
  `old_value` json DEFAULT NULL,
  `new_value` json DEFAULT NULL,
  `changed_by` varchar(50) DEFAULT NULL,
  `change_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES (1,'stock','UPDATE',2,'{\"state\": \"Available\", \"quantity\": 1000, \"stock_id\": 2, \"warehouse\": \"WH2\", \"description\": \"Almacen WH2\", \"update_date\": \"2024-02-01\", \"intern_pn_id\": 2}','{\"state\": \"Available\", \"quantity\": 960, \"stock_id\": 2, \"warehouse\": \"WH2\", \"description\": \"Almacen WH2\", \"update_date\": \"2025-02-27\", \"intern_pn_id\": 2}','root@localhost','2025-02-28 01:54:05');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pn_intern`
--

DROP TABLE IF EXISTS `pn_intern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pn_intern` (
  `pn_intern_id` int NOT NULL AUTO_INCREMENT,
  `intern_pn` varchar(100) NOT NULL,
  `descrip` varchar(500) DEFAULT NULL,
  `lifecycle` varchar(50) DEFAULT NULL,
  `eol_date` date DEFAULT NULL,
  `quality_grade` varchar(50) DEFAULT NULL,
  `replace_id` varchar(50) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`pn_intern_id`),
  UNIQUE KEY `intern_pn` (`intern_pn`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pn_intern`
--

LOCK TABLES `pn_intern` WRITE;
/*!40000 ALTER TABLE `pn_intern` DISABLE KEYS */;
INSERT INTO `pn_intern` VALUES (1,'INT001','Capacitor 10uF 16V','Active',NULL,'Industrial',NULL,'2024-02-01'),(2,'INT002','Resistor 1k Ohm 1%','Active',NULL,'Automotive',NULL,'2024-02-01'),(3,'INT003','IC 555 Timer','NRND',NULL,'Industrial',NULL,'2024-02-01'),(4,'INT004','Transistor NPN 2N3904','Last Time Buy','2025-12-31','Aerospace',NULL,'2024-02-01'),(5,'INT005','Diode 1N4001','Obsolete','2022-12-31','Industrial','INT002','2024-02-01'),(6,'INT006','Microcontroller ATmega328P','Active',NULL,'Automotive',NULL,'2024-02-01'),(7,'INT007','Inductor 10uH','Active',NULL,'Industrial',NULL,'2024-02-01'),(8,'INT008','LED Red 5mm','NRND',NULL,'Aerospace',NULL,'2024-02-01'),(9,'INT009','Connector USB Type-C','Active',NULL,'Automotive',NULL,'2024-02-01'),(10,'INT010','Oscillator 16MHz','Last Time Buy','2026-06-30','Industrial',NULL,'2024-02-01'),(11,'INT011','Switch SPDT','Active',NULL,'Aerospace',NULL,'2024-02-01'),(12,'INT012','Potentiometer 10k Ohm','NRND',NULL,'Industrial',NULL,'2024-02-01'),(13,'INT013','Fuse 5A 250V','Active',NULL,'Automotive',NULL,'2024-02-01'),(14,'INT014','Relay 12V','Last Time Buy','2025-03-15','Aerospace',NULL,'2024-02-01'),(15,'INT015','Crystal 8MHz','Obsolete','2023-01-15','Industrial','INT010','2024-02-01');
/*!40000 ALTER TABLE `pn_intern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pn_manufacturer`
--

DROP TABLE IF EXISTS `pn_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pn_manufacturer` (
  `manuf_pn_id` int NOT NULL AUTO_INCREMENT,
  `manuf_pn` varchar(100) NOT NULL,
  `pn_intern_id` int DEFAULT NULL,
  `descrip` varchar(500) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `lifecycle` varchar(50) DEFAULT NULL,
  `eol_date` date DEFAULT NULL,
  `replace_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`manuf_pn_id`),
  UNIQUE KEY `manuf_pn` (`manuf_pn`),
  KEY `pn_intern_id` (`pn_intern_id`),
  CONSTRAINT `pn_manufacturer_ibfk_1` FOREIGN KEY (`pn_intern_id`) REFERENCES `pn_intern` (`pn_intern_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pn_manufacturer`
--

LOCK TABLES `pn_manufacturer` WRITE;
/*!40000 ALTER TABLE `pn_manufacturer` DISABLE KEYS */;
INSERT INTO `pn_manufacturer` VALUES (1,'MAN001',1,'Capacitor 10uF 16V','Murata','Active',NULL,NULL),(2,'MAN002',2,'Resistor 1k Ohm 1%','Vishay','Active',NULL,NULL),(3,'MAN003',3,'IC 555 Timer','Texas Instruments','NRND',NULL,NULL),(4,'MAN004',4,'Transistor NPN 2N3904','ON Semiconductor','Last Time Buy','2025-12-31',NULL),(5,'MAN005',5,'Diode 1N4001','Fairchild','Obsolete','2022-12-31','INT002'),(6,'MAN006',6,'Microcontroller ATmega328P','Atmel','Active',NULL,NULL),(7,'MAN007',7,'Inductor 10uH','Murata','Active',NULL,NULL),(8,'MAN008',8,'LED Red 5mm','Osram','NRND',NULL,NULL),(9,'MAN009',9,'Connector USB Type-C','Amphenol','Active',NULL,NULL),(10,'MAN010',10,'Oscillator 16MHz','Epson','Last Time Buy','2026-06-30',NULL),(11,'MAN011',11,'Switch SPDT','Honeywell','Active',NULL,NULL),(12,'MAN012',12,'Potentiometer 10k Ohm','Bourns','NRND',NULL,NULL),(13,'MAN013',13,'Fuse 5A 250V','Littelfuse','Active',NULL,NULL),(14,'MAN014',14,'Relay 12V','Schneider Electric','Last Time Buy','2025-03-15',NULL),(15,'MAN015',15,'Crystal 8MHz','Epson','Obsolete','2023-01-15','INT010');
/*!40000 ALTER TABLE `pn_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `price_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int DEFAULT NULL,
  `intern_pn_id` int DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `price_source` varchar(30) DEFAULT NULL,
  `MOQ` int DEFAULT NULL,
  `payment_conditions` varchar(100) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `incoterm` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`price_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `intern_pn_id` (`intern_pn_id`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_number_id`) ON DELETE CASCADE,
  CONSTRAINT `prices_ibfk_2` FOREIGN KEY (`intern_pn_id`) REFERENCES `pn_intern` (`pn_intern_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,1,1,0.10,'USD','Online',100,'Net 30','2024-02-01','FOB'),(2,2,2,0.05,'USD','Online',200,'Net 30','2024-02-01','FOB'),(3,3,3,0.50,'USD','Online',50,'Net 30','2024-02-01','FOB'),(4,1,4,0.20,'USD','Online',150,'Net 30','2024-02-01','FOB'),(5,2,5,0.15,'USD','Online',300,'Net 30','2024-02-01','FOB'),(6,1,6,2.50,'USD','Online',100,'Net 30','2024-02-01','FOB'),(7,2,7,0.08,'USD','Online',200,'Net 30','2024-02-01','FOB'),(8,3,8,0.10,'USD','Online',150,'Net 30','2024-02-01','FOB'),(9,1,9,1.50,'USD','Online',50,'Net 30','2024-02-01','FOB'),(10,2,10,0.30,'USD','Online',100,'Net 30','2024-02-01','FOB'),(11,3,11,0.75,'USD','Online',500,'Net 30','2024-02-01','FOB'),(12,1,12,0.05,'USD','Online',300,'Net 30','2024-02-01','FOB'),(13,2,13,0.12,'USD','Online',200,'Net 30','2024-02-01','FOB'),(14,3,14,0.30,'USD','Online',400,'Net 30','2024-02-01','FOB'),(15,1,15,0.40,'USD','Online',150,'Net 30','2024-02-01','FOB');
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `proj_name` varchar(100) NOT NULL,
  `descrip` varchar(500) DEFAULT NULL,
  `client` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Project Alpha','Descrip of Alpha Project','Client A'),(2,'Project Beta','Descrip of Beta Project','Client B'),(3,'Project Gamma','Descript of Gamma Project','Client C');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_projects_internpn`
--

DROP TABLE IF EXISTS `relation_projects_internpn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_projects_internpn` (
  `relation_id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `intern_pn_id` int DEFAULT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `project_id` (`project_id`),
  KEY `intern_pn_id` (`intern_pn_id`),
  CONSTRAINT `relation_projects_internpn_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `relation_projects_internpn_ibfk_2` FOREIGN KEY (`intern_pn_id`) REFERENCES `pn_intern` (`pn_intern_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_projects_internpn`
--

LOCK TABLES `relation_projects_internpn` WRITE;
/*!40000 ALTER TABLE `relation_projects_internpn` DISABLE KEYS */;
INSERT INTO `relation_projects_internpn` VALUES (1,1,1),(2,2,2),(3,3,3),(4,1,4),(5,2,5);
/*!40000 ALTER TABLE `relation_projects_internpn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_suppliers_internpn`
--

DROP TABLE IF EXISTS `relation_suppliers_internpn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_suppliers_internpn` (
  `relation_id` int NOT NULL AUTO_INCREMENT,
  `intern_pn_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `currentcontract` tinyint(1) DEFAULT NULL,
  `used` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `intern_pn_id` (`intern_pn_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `relation_suppliers_internpn_ibfk_1` FOREIGN KEY (`intern_pn_id`) REFERENCES `pn_intern` (`pn_intern_id`) ON DELETE CASCADE,
  CONSTRAINT `relation_suppliers_internpn_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_number_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_suppliers_internpn`
--

LOCK TABLES `relation_suppliers_internpn` WRITE;
/*!40000 ALTER TABLE `relation_suppliers_internpn` DISABLE KEYS */;
INSERT INTO `relation_suppliers_internpn` VALUES (1,1,1,1,1),(2,2,2,1,1),(3,3,3,1,1),(4,4,1,0,0),(5,5,2,0,1);
/*!40000 ALTER TABLE `relation_suppliers_internpn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `intern_pn_id` int DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `warehouse` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `intern_pn_id` (`intern_pn_id`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`intern_pn_id`) REFERENCES `pn_intern` (`pn_intern_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,'Almacen WH1','Available','2024-02-01','WH1',500),(2,2,'Almacen WH2','Available','2025-02-27','WH2',960),(3,3,'Almacen WH1','Low Stock','2024-02-01','WH1',50),(4,4,'Almacen WH3','Available','2024-02-01','WH3',300),(5,5,'Almacen WH2','Out of Stock','2024-02-01','WH2',0),(6,6,'Almacen WH1','Available','2024-02-01','WH1',150),(7,7,'Almacen WH2','Available','2024-02-01','WH2',800),(8,8,'Almacen WH3','Low Stock','2024-02-01','WH3',50),(9,9,'Almacen WH1','Available','2024-02-01','WH1',600),(10,10,'Almacen WH2','Available','2024-02-01','WH2',200),(11,11,'Almacen WH3','Low Stock','2024-02-01','WH3',40),(12,12,'Almacen WH1','Available','2024-02-01','WH1',900),(13,13,'Almacen WH2','Available','2024-02-01','WH2',1000),(14,14,'Almacen WH3','Low Stock','2024-02-01','WH3',30),(15,15,'Almacen WH2','Out of Stock','2024-02-01','WH2',0);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_number_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `isDistributor` tinyint(1) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `main_contact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`supplier_number_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Digikey',1,'USA','contact@digikey.com'),(2,'Arrow',1,'USA','sales@arrow.com'),(3,'Avnet',1,'USA','support@avnet.com');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_comparativa_ciclo_vida`
--

DROP TABLE IF EXISTS `vista_comparativa_ciclo_vida`;
/*!50001 DROP VIEW IF EXISTS `vista_comparativa_ciclo_vida`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_comparativa_ciclo_vida` AS SELECT 
 1 AS `pn_intern_id`,
 1 AS `codigo_interno`,
 1 AS `internal_pn_description`,
 1 AS `estado_interno`,
 1 AS `project_id`,
 1 AS `project_name`,
 1 AS `client`,
 1 AS `project_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_comparativa_precios`
--

DROP TABLE IF EXISTS `vista_comparativa_precios`;
/*!50001 DROP VIEW IF EXISTS `vista_comparativa_precios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_comparativa_precios` AS SELECT 
 1 AS `pn_intern_id`,
 1 AS `intern_pn`,
 1 AS `descrip`,
 1 AS `manuf_pn_id`,
 1 AS `precio_interno`,
 1 AS `moneda_interna`,
 1 AS `precio_api_Arrow`,
 1 AS `moneda_api_Arrow`,
 1 AS `precio_api_Digikey`,
 1 AS `moneda_api_Digikey`,
 1 AS `precio_api_Octopart`,
 1 AS `moneda_api_Octopart`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_dashboard_proyecto`
--

DROP TABLE IF EXISTS `vista_dashboard_proyecto`;
/*!50001 DROP VIEW IF EXISTS `vista_dashboard_proyecto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_dashboard_proyecto` AS SELECT 
 1 AS `project_id`,
 1 AS `proj_name`,
 1 AS `ACTIVOS`,
 1 AS `NRND`,
 1 AS `LAST_TIME_BUY`,
 1 AS `EOL`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estado_ciclo_vida`
--

DROP TABLE IF EXISTS `vista_estado_ciclo_vida`;
/*!50001 DROP VIEW IF EXISTS `vista_estado_ciclo_vida`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estado_ciclo_vida` AS SELECT 
 1 AS `descripcion_interna`,
 1 AS `codigo_interno`,
 1 AS `estado_interno`,
 1 AS `codigo_fabricante`,
 1 AS `fabricante`,
 1 AS `estado_fabricante`,
 1 AS `fecha_fin_vida`,
 1 AS `estado_api_Arrow`,
 1 AS `estado_api_Digikey`,
 1 AS `estado_api_Octopart`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_stock_almacenes`
--

DROP TABLE IF EXISTS `vista_stock_almacenes`;
/*!50001 DROP VIEW IF EXISTS `vista_stock_almacenes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_stock_almacenes` AS SELECT 
 1 AS `pn_intern_id`,
 1 AS `codigo_interno`,
 1 AS `descripcion`,
 1 AS `deposito`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_comparativa_ciclo_vida`
--

/*!50001 DROP VIEW IF EXISTS `vista_comparativa_ciclo_vida`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_comparativa_ciclo_vida` AS select `i`.`pn_intern_id` AS `pn_intern_id`,`i`.`intern_pn` AS `codigo_interno`,`i`.`descrip` AS `internal_pn_description`,`i`.`lifecycle` AS `estado_interno`,`p`.`project_id` AS `project_id`,`p`.`proj_name` AS `project_name`,`p`.`client` AS `client`,`p`.`descrip` AS `project_description` from ((`project` `p` left join `relation_projects_internpn` `cp` on((`p`.`project_id` = `cp`.`project_id`))) left join `pn_intern` `i` on((`cp`.`intern_pn_id` = `i`.`pn_intern_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_comparativa_precios`
--

/*!50001 DROP VIEW IF EXISTS `vista_comparativa_precios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_comparativa_precios` AS select `i`.`pn_intern_id` AS `pn_intern_id`,`i`.`intern_pn` AS `intern_pn`,`i`.`descrip` AS `descrip`,`m`.`manuf_pn_id` AS `manuf_pn_id`,`p`.`price` AS `precio_interno`,`p`.`currency` AS `moneda_interna`,max((case when (`a`.`source_api` = 'Arrow') then `a`.`price` else NULL end)) AS `precio_api_Arrow`,max((case when (`a`.`source_api` = 'Arrow') then `a`.`currency` else NULL end)) AS `moneda_api_Arrow`,max((case when (`a`.`source_api` = 'Digikey') then `a`.`price` else NULL end)) AS `precio_api_Digikey`,max((case when (`a`.`source_api` = 'Digikey') then `a`.`currency` else NULL end)) AS `moneda_api_Digikey`,max((case when (`a`.`source_api` = 'Octopart') then `a`.`price` else NULL end)) AS `precio_api_Octopart`,max((case when (`a`.`source_api` = 'Octopart') then `a`.`currency` else NULL end)) AS `moneda_api_Octopart` from (((`pn_intern` `i` left join `pn_manufacturer` `m` on((`i`.`pn_intern_id` = `m`.`pn_intern_id`))) left join `prices` `p` on((`i`.`pn_intern_id` = `p`.`intern_pn_id`))) left join `api_data` `a` on((`m`.`manuf_pn_id` = `a`.`manuf_pn_id`))) group by `i`.`pn_intern_id`,`i`.`descrip`,`m`.`manuf_pn_id`,`p`.`price`,`p`.`currency` order by `i`.`pn_intern_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_dashboard_proyecto`
--

/*!50001 DROP VIEW IF EXISTS `vista_dashboard_proyecto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_dashboard_proyecto` AS select `pr`.`project_id` AS `project_id`,`pr`.`proj_name` AS `proj_name`,count((case when (`i`.`lifecycle` = 'Active') then 1 else NULL end)) AS `ACTIVOS`,count((case when (`i`.`lifecycle` = 'NRND') then 1 else NULL end)) AS `NRND`,count((case when (`i`.`lifecycle` = 'Last Time Buy') then 1 else NULL end)) AS `LAST_TIME_BUY`,count((case when (`i`.`lifecycle` = 'EOL') then 1 else NULL end)) AS `EOL` from ((`project` `pr` left join `relation_projects_internpn` `pc` on((`pr`.`project_id` = `pc`.`project_id`))) left join `pn_intern` `i` on((`pc`.`intern_pn_id` = `i`.`pn_intern_id`))) group by `pr`.`project_id`,`pr`.`proj_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estado_ciclo_vida`
--

/*!50001 DROP VIEW IF EXISTS `vista_estado_ciclo_vida`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estado_ciclo_vida` AS select `i`.`descrip` AS `descripcion_interna`,`i`.`intern_pn` AS `codigo_interno`,`i`.`lifecycle` AS `estado_interno`,`m`.`manuf_pn_id` AS `codigo_fabricante`,`m`.`manufacturer` AS `fabricante`,`m`.`lifecycle` AS `estado_fabricante`,`m`.`eol_date` AS `fecha_fin_vida`,max((case when (`a`.`source_api` = 'Arrow') then `a`.`lifecycle` else NULL end)) AS `estado_api_Arrow`,max((case when (`a`.`source_api` = 'Digikey') then `a`.`lifecycle` else NULL end)) AS `estado_api_Digikey`,max((case when (`a`.`source_api` = 'Octopart') then `a`.`lifecycle` else NULL end)) AS `estado_api_Octopart` from ((`pn_intern` `i` left join `pn_manufacturer` `m` on((`i`.`pn_intern_id` = `m`.`pn_intern_id`))) left join `api_data` `a` on((`m`.`manuf_pn_id` = `a`.`manuf_pn_id`))) group by `i`.`descrip`,`i`.`intern_pn`,`i`.`lifecycle`,`m`.`manuf_pn_id`,`m`.`manufacturer`,`m`.`lifecycle`,`m`.`eol_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_stock_almacenes`
--

/*!50001 DROP VIEW IF EXISTS `vista_stock_almacenes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_stock_almacenes` AS select `i`.`pn_intern_id` AS `pn_intern_id`,`i`.`intern_pn` AS `codigo_interno`,`i`.`descrip` AS `descripcion`,`s`.`warehouse` AS `deposito`,`s`.`quantity` AS `cantidad` from (`pn_intern` `i` left join `stock` `s` on((`i`.`pn_intern_id` = `s`.`intern_pn_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 22:56:40
