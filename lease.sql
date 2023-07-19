-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
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
  `property_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip_code` varchar(45) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `property_id_idx` (`property_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`),
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`),
  CONSTRAINT `address_ibfk_3` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'4557 De Silva St','Fremont','California','94538'),(2,2,'45620 Jeronimo St','Temecula','California','92592'),(3,3,'4773 Moorpark Ave','Moorpark','California','93021'),(4,4,'21209 Aspen Ln','Weston','Colorado','81091'),(5,5,'124 E Meadow Dr','Vali','Colorado','81657'),(6,6,'216 Barone Ave','South Plainfield','New Jersey','07080'),(7,7,'237 Shirley Rd','Upper Darby','Pennsylvania','19082'),(8,8,'1023 Bluebonnet Ave','Big Spring','Texas','79720'),(9,9,'8907 Harbour Town','Schertz','Texas','78154'),(10,10,'883 Clay St','Ashland','Oregon ','97520');
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
  CONSTRAINT `listing_id` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`listing_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `create`
--

LOCK TABLES `create` WRITE;
/*!40000 ALTER TABLE `create` DISABLE KEYS */;
INSERT INTO `create` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `create` ENABLE KEYS */;
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
  `landlord_id` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `max_headcount` int NOT NULL,
  `booking_status` tinyint NOT NULL,
  PRIMARY KEY (`listing_id`),
  KEY `landlord_id_idx` (`landlord_id`),
  CONSTRAINT `landlord_id` FOREIGN KEY (`landlord_id`) REFERENCES `users` (`landlord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
INSERT INTO `listings` VALUES (1,1,'L4','2023-11-23','2023-11-25',4,0),(2,9,'L2','2023-08-10','2023-08-15',2,0),(3,5,'L3','2023-08-11','2023-08-13',1,0),(4,4,'L5','2023-11-05','2023-11-09',4,0),(5,10,'L1','2023-09-18','2023-09-19',4,0),(6,8,'L1','2023-08-03','2023-08-06',2,0),(7,5,'L3','2023-10-10','2023-10-11',1,0),(8,3,'L6','2023-11-16','2023-11-19',2,0),(9,7,'L2','2023-09-26','2023-09-27',1,0),(10,6,'L1','2023-09-08','2023-09-09',2,0);
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
INSERT INTO `orders` VALUES (1,1,'T1'),(2,2,'T2'),(3,3,'T6');
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
INSERT INTO `own` VALUES (1,'L1'),(4,'L1'),(8,'L1'),(2,'L2'),(5,'L2'),(6,'L3'),(7,'L3'),(10,'L4'),(9,'L5'),(3,'L6');
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
INSERT INTO `property` VALUES (1,1,2,2,'apartment',1000),(2,2,1,1,'room',400),(3,3,2,1,'house',600),(4,4,2,2,'house',800),(5,5,1,1,'room',250),(6,6,1,1,'room',400),(7,7,1,1,'apartment',300),(8,8,2,2,'house',550),(9,9,1,1,'apartment',300),(10,10,2,2,'house',650);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release`
--

DROP TABLE IF EXISTS `release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `release` (
  `user_id` int NOT NULL,
  `listing_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`listing_id`),
  KEY `listing_fkid_idx` (`listing_id`),
  CONSTRAINT `listing_fkid` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`listing_id`),
  CONSTRAINT `user_fkid` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release`
--

LOCK TABLES `release` WRITE;
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
/*!40000 ALTER TABLE `release` ENABLE KEYS */;
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
  PRIMARY KEY (`admin_id`,`listing_id`),
  KEY `list_id_idx` (`listing_id`),
  CONSTRAINT `admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `list_id` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`listing_id`)
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

-- Dump completed on 2023-07-19 16:49:06
