-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lease
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip_code` varchar(45) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'4557 De Silva St','Fremont','California','94538'),(2,'45620 Jeronimo St','Temecula','California','92592'),(3,'4773 Moorpark Ave','Moorpark','California','93021'),(4,'21209 Aspen Ln','Weston','Colorado','81091'),(5,'124 E Meadow Dr','Vali','Colorado','81657'),(6,'216 Barone Ave','South Plainfield','New Jersey','07080'),(7,'237 Shirley Rd','Upper Darby','Pennsylvania','19082'),(8,'1023 Bluebonnet Ave','Big Spring','Texas','79720'),(9,'8907 Harbour Town','Schertz','Texas','78154'),(10,'883 Clay St','Ashland','Oregon ','97520'),(11,' 2147 Rio Guacimal Ct','San Jose','California','95116'),(12,'1895 Maccandless Dr','Milpitas','California ','95035'),(13,'2823 N 31St St','Boise','Idaho','83703'),(14,'6109 S Palatino Way','Meridian ','Idaho','83642'),(15,'7539 S Champlain Ave','Chicago ','illinois','60619');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL,
  `user_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,7,'Tianxiang','Chen'),(2,8,'Hazuki ','Sugahara'),(3,9,'David','Jeong');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `create`
--

DROP TABLE IF EXISTS `create`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `create` (
  `listing_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`listing_id`,`order_id`),
  KEY `order_id_idx` (`order_id`),
  CONSTRAINT `listing_id` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`listing_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `create`
--

LOCK TABLES `create` WRITE;
/*!40000 ALTER TABLE `create` DISABLE KEYS */;
INSERT INTO `create` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `create` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease`
--

DROP TABLE IF EXISTS `lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lease` (
  `landlord_id` varchar(45) NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`landlord_id`,`listing_id`),
  KEY `listing_fkid_idx` (`listing_id`),
  CONSTRAINT `landlord_fkid` FOREIGN KEY (`landlord_id`) REFERENCES `users` (`landlord_id`),
  CONSTRAINT `listing_fkid` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`listing_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease`
--

LOCK TABLES `lease` WRITE;
/*!40000 ALTER TABLE `lease` DISABLE KEYS */;
INSERT INTO `lease` VALUES ('L2',1),('L2',2),('L5',3),('L1',4),('L1',5),('L1',6),('L2',7),('L6',8),('L3',9),('L1',10),('L1',11),('L1',12),('L3',13),('L3',14),('L4',15),('L4',16),('L2',17),('L1',18),('L1',19),('L5',20),('L5',21),('L5',22),('L5',23),('L5',24),('L5',25),('L2',26),('L2',27),('L2',28),('L2',29),('L5',30),('L4',31),('L4',32),('L4',33),('L4',34),('L4',35),('L4',36),('L5',37),('L5',38),('L5',39),('L5',40),('L5',41),('L6',42),('L6',43),('L6',44),('L6',45),('L6',46),('L6',47),('L6',48),('L6',49),('L2',50),('L2',51),('L2',52),('L2',53),('L1',54),('L3',55),('L3',56),('L3',57),('L3',58),('L3',59),('L3',60),('L3',61),('L3',62),('L3',63),('L3',64),('L3',65),('L3',66),('L3',67),('L3',68),('L3',69),('L3',70),('L1',71),('L1',72),('L1',73),('L1',74),('L1',75),('L1',76),('L1',77),('L1',78),('L1',79),('L1',80),('L1',81),('L4',82),('L4',83),('L4',84),('L4',85),('L4',86),('L4',87),('L4',88),('L1',89),('L1',90),('L1',91),('L1',92),('L1',93),('L1',94),('L2',95),('L2',96),('L2',97),('L2',98),('L2',99),('L2',100);
/*!40000 ALTER TABLE `lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listings` (
  `listing_id` int NOT NULL,
  `property_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `max_headcount` int NOT NULL,
  `booking_status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
INSERT INTO `listings` VALUES (1,2,'2023-07-28','2023-07-29',2,1),(2,5,'2023-09-09','2023-09-10',2,1),(3,9,'2023-12-10','2023-12-12',1,1),(4,4,'2023-11-05','2023-11-09',4,1),(5,11,'2023-08-10','2023-08-14',6,1),(6,8,'2023-08-03','2023-08-06',4,0),(7,5,'2023-10-10','2023-10-11',2,0),(8,3,'2023-11-16','2023-11-19',4,0),(9,7,'2023-09-26','2023-09-27',1,0),(10,4,'2023-09-27','2023-09-28',4,0),(11,1,'2023-07-25','2023-07-28',1,0),(12,1,'2023-08-24','2023-08-26',1,0),(13,6,'2023-09-10','2023-09-12',1,0),(14,6,'2023-10-01','2023-10-03',1,0),(15,13,'2023-09-04','2023-09-05',2,0),(16,10,'2023-09-23','2023-09-26',4,0),(17,15,'2023-09-12','2023-09-14',4,0),(18,1,'2023-09-04','2023-09-06',1,0),(19,11,'2023-09-15','2023-09-16',6,0),(20,14,'2023-09-12','2023-09-15',4,0),(21,14,'2023-09-20','2023-09-23',4,0),(22,14,'2023-12-15','2023-12-18',4,0),(23,14,'2023-12-12','2023-12-14',4,0),(24,14,'2023-08-12','2023-08-14',4,0),(25,14,'2023-10-16','2023-10-18',4,0),(26,15,'2023-09-20','2023-09-24',4,0),(27,15,'2023-08-15','2023-08-17',4,0),(28,15,'2023-12-09','2023-12-12',4,0),(29,15,'2023-11-16','2023-11-19',4,0),(30,14,'2023-11-04','2023-11-06',4,0),(31,10,'2023-09-13','2023-09-15',4,0),(32,10,'2023-10-03','2023-10-05',4,0),(33,10,'2023-11-10','2023-11-24',4,0),(34,10,'2023-10-18','2023-10-20',4,0),(35,10,'2023-12-27','2023-12-29',4,0),(36,10,'2023-09-09','2023-09-12',4,0),(37,9,'2023-09-11','2023-09-12',1,0),(38,9,'2023-10-05','2023-10-07',1,0),(39,9,'2023-10-18','2023-10-20',1,0),(40,9,'2023-11-23','2023-11-26',1,0),(41,9,'2023-08-13','2023-08-15',1,0),(42,12,'2023-11-14','2023-11-17',3,0),(43,12,'2023-11-27','2023-11-29',3,0),(44,12,'2023-10-09','2023-10-11',3,0),(45,12,'2023-10-11','2023-10-13',3,0),(46,12,'2023-09-16','2023-09-17',3,0),(47,12,'2023-12-09','2023-12-11',3,0),(48,12,'2023-09-24','2023-09-25',3,0),(49,12,'2023-12-16','2023-12-18',3,0),(50,15,'2023-12-09','2023-12-12',4,0),(51,15,'2023-11-12','2023-11-03',4,0),(52,15,'2023-11-29','2023-12-01',4,0),(53,15,'2023-10-10','2023-10-12',4,0),(54,20,'2023-12-15','2023-12-17',2,0),(55,7,'2023-11-12','2023-11-14',1,0),(56,7,'2023-11-25','2023-11-27',1,0),(57,7,'2023-12-07','2023-12-08',1,0),(58,7,'2023-09-21','2023-09-25',1,0),(59,7,'2023-08-22','2023-08-24',1,0),(60,7,'2023-10-24','2023-10-25',1,0),(61,16,'2023-11-12','2023-11-14',4,0),(62,16,'2023-11-29','2023-12-01',4,0),(63,16,'2023-09-01','2023-09-03',4,0),(64,16,'2023-12-01','2023-12-04',4,0),(65,16,'2023-09-13','2023-09-15',4,0),(66,16,'2023-09-26','2023-09-28',4,0),(67,16,'2023-10-12','2023-10-13',4,0),(68,6,'2023-11-15','2023-11-17',4,0),(69,6,'2023-12-10','2023-12-13',4,0),(70,6,'2023-08-18','2023-08-21',4,0),(71,20,'2023-11-05','2023-11-06',2,0),(72,20,'2023-11-25','2023-11-27',2,0),(73,20,'2023-10-01','2023-10-03',2,0),(74,20,'2023-10-16','2023-10-18',2,0),(75,20,'2023-10-29','2023-11-01',2,0),(76,11,'2023-11-14','2023-11-17',6,0),(77,11,'2023-12-06','2023-12-07',6,0),(78,11,'2023-10-19','2023-10-22',6,0),(79,20,'2023-08-25','2023-08-28',2,0),(80,11,'2023-09-06','2023-09-08',2,0),(81,11,'2023-09-23','2023-09-23',2,0),(82,18,'2023-11-15','2023-11-17',2,0),(83,18,'2023-08-12','2023-08-14',2,0),(84,18,'2023-09-17','2023-09-19',2,0),(85,18,'2023-10-25','2023-10-28',2,0),(86,18,'2023-08-25','2023-08-27',2,0),(87,18,'2023-08-17','2023-08-19',2,0),(88,18,'2023-12-02','2023-12-05',2,0),(89,4,'2023-08-12','2023-08-14',4,0),(90,4,'2023-10-01','2023-10-02',4,0),(91,4,'2023-12-12','2023-12-15',4,0),(92,4,'2023-10-17','2023-10-19',4,0),(93,4,'2023-08-29','2023-09-01',4,0),(94,4,'2023-09-14','2023-09-16',4,0),(95,5,'2023-09-26','2023-09-28',2,0),(96,5,'2023-11-18','2023-11-20',2,0),(97,5,'2023-12-12','2023-12-14',2,0),(98,5,'2023-10-26','2023-10-28',2,0),(99,5,'2023-08-27','2023-08-29',2,0),(100,5,'2023-12-15','2023-12-18',2,0);
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `listing_id` int NOT NULL,
  `tenant_id` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,4,'T1'),(2,2,'T2'),(3,3,'T6'),(4,5,'T1'),(5,6,'T1');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `own`
--

DROP TABLE IF EXISTS `own`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `own` (
  `property_id` int NOT NULL,
  `landlord_id` varchar(45) NOT NULL,
  PRIMARY KEY (`property_id`,`landlord_id`),
  KEY `landlord_id_idx` (`landlord_id`),
  CONSTRAINT `landlord_id_idx` FOREIGN KEY (`landlord_id`) REFERENCES `users` (`landlord_id`),
  CONSTRAINT `property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `own`
--

LOCK TABLES `own` WRITE;
/*!40000 ALTER TABLE `own` DISABLE KEYS */;
INSERT INTO `own` VALUES (1,'L1'),(4,'L1'),(8,'L1'),(11,'L1'),(20,'L1'),(2,'L2'),(5,'L2'),(15,'L2'),(17,'L2'),(19,'L2'),(6,'L3'),(7,'L3'),(16,'L3'),(10,'L4'),(13,'L4'),(18,'L4'),(9,'L5'),(14,'L5'),(3,'L6'),(12,'L6');
/*!40000 ALTER TABLE `own` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `payment_date` date NOT NULL,
  `tenant_id` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_fkid_idx` (`order_id`),
  CONSTRAINT `order_fkid` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'2022-10-08','T1'),(2,2,'2021-07-14','T2'),(3,3,'2023-08-09','T6');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `property_id` int NOT NULL,
  `address_id` int NOT NULL,
  `bd_count` int NOT NULL,
  `br_count` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`property_id`),
  KEY `address_id_idx` (`address_id`),
  CONSTRAINT `address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,1,1,1,'single',800),(2,2,1,1,'double',400),(3,3,2,1,'house',600),(4,4,2,2,'house',800),(5,5,1,1,'double',250),(6,6,1,1,'single',400),(7,7,1,1,'apartment',300),(8,8,2,2,'house',550),(9,9,1,1,'apartment',300),(10,10,2,2,'house',650),(11,14,3,3,'house',2000),(12,13,3,2,'single',400),(13,15,2,1,'single',400),(14,11,2,2,'house',900),(15,12,2,1,'double',500),(16,6,2,2,'house',850),(17,15,1,1,'double',400),(18,10,1,1,'double',300),(19,5,3,2,'house',1200),(20,14,1,1,'double',450);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent` (
  `tenant_id` varchar(45) NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`tenant_id`,`listing_id`),
  KEY `tenant_id_idx` (`tenant_id`),
  KEY `listing_id` (`listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES ('T3',2),('T3',4);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update`
--

DROP TABLE IF EXISTS `update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `update` (
  `admin_id` int NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`admin_id`,`listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update`
--

LOCK TABLES `update` WRITE;
/*!40000 ALTER TABLE `update` DISABLE KEYS */;
INSERT INTO `update` VALUES (1,1),(1,2),(2,2),(3,3);
/*!40000 ALTER TABLE `update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `email_address` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `landlord_id` varchar(45) DEFAULT NULL,
  `tenant_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `Tenant_id_UNIQUE` (`tenant_id`),
  UNIQUE KEY `landlord_id_UNIQUE` (`landlord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abc@gmail.com','Tina','Smith','L1','T1'),(2,'def@gmail.com','Mike','Lee','L2','T2'),(3,'ghi@gmail.com','Jake','Brown','L3','T3'),(4,'jkl@gmail.com','Jeniffer','Potter','L4','T4'),(5,'mno@gmail.com','Kevin','Taylor','L5','T5'),(6,'pqr@gmail.com','John','Anderson','L6','T6'),(7,'tationchen@gmail.com','Tianxiang','Chen',NULL,NULL),(8,'sugahara.hazuki@gmail.com','Hazuki','Sugahara',NULL,NULL),(9,'ddavidjeong@gmail.com','David','Jeong',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-29 14:04:11
