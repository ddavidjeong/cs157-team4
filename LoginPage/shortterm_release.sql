-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shortterm_release
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
INSERT INTO `address` VALUES (1,'California','91467'),(2,'Alaska','99505'),(3,'California','95235'),(4,'California','95125'),(5,'California','94782'),(6,'New York','10475'),(7,'Florida','32768'),(8,'Florida','32756'),(9,'Idaho','83201'),(10,'California','93461');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
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
  `number_people` int NOT NULL,
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
INSERT INTO `listings` VALUES (1,1,'L4','2023-11-23','2023-11-25',4),(2,9,'L2','2023-08-10','2023-08-15',2),(3,5,'L3','2023-08-11','2023-08-13',1),(4,4,'L5','2023-11-05','2023-11-09',4),(5,10,'L1','2023-09-18','2023-09-19',4),(6,8,'L1','2023-08-03','2023-08-06',2),(7,5,'L3','2023-10-10','2023-10-11',1),(8,3,'L6','2023-11-16','2023-11-19',2),(9,7,'L2','2023-09-26','2023-09-27',1),(10,6,'L1','2023-09-08','2023-09-09',2);
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
  PRIMARY KEY (`order_id`),
  KEY `listing_id_idx` (`listing_id`),
  CONSTRAINT `listing_id` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'T1'),(2,9,'T2'),(3,3,'T6'),(4,1,'T4'),(5,5,'T1'),(6,8,'T3'),(7,10,'T3'),(8,6,'T1'),(9,7,'T2'),(10,8,'T4');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `property_id` int NOT NULL,
  `bd_count` int DEFAULT NULL,
  `br_count` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `address_id` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,2,2,'double','2',1000),(2,1,1,'double','3',400),(3,2,1,'single','6',600),(4,2,2,'double','1',800),(5,1,1,'single','1',250),(6,1,1,'double','7',400),(7,1,1,'single','4',300),(8,2,2,'single','9',550),(9,1,1,'double','8',300),(10,2,2,'double','3',650);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
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
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Tenant_id_UNIQUE` (`tenant_id`),
  UNIQUE KEY `landlord_id_UNIQUE` (`landlord_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abc@gmail.com','Tina','Smith',NULL,'L1','T1'),(2,'def@gmail.com','Mike','Lee',1,'L2','T2'),(3,'ghi@gmail.com','Jake','Brown',NULL,'L3','T3'),(4,'jkl@gmail.com','Jeniffer','Potter',NULL,'L4','T4'),(5,'mno@gmail.com','Kevin','Taylor',2,'L5','T5'),(6,'pqr@gmail.com','John','Anderson',3,'L6','T6');
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

-- Dump completed on 2023-07-13 11:07:08
