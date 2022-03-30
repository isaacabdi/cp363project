CREATE DATABASE  IF NOT EXISTS `recipe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipe`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: recipe
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `r_category_id` int NOT NULL AUTO_INCREMENT,
  `r_category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`r_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'favourites'),(2,'low-calories'),(3,'vegan'),(4,'other'),(13,'dessert'),(14,'breakfast'),(15,'lunchg'),(16,'dinner');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredient_id` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(45) NOT NULL,
  `ingredient_unitcost` varchar(45) NOT NULL,
  `ingredient_category_id` int NOT NULL,
  PRIMARY KEY (`ingredient_id`),
  KEY `ingredient_category_id_idx` (`ingredient_category_id`),
  CONSTRAINT `ingredient_category_id` FOREIGN KEY (`ingredient_category_id`) REFERENCES `ingredient_category` (`ingredient_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'soap','$10/pound',1),(2,'grass','$7/pound',2),(3,'sawdust','$5/pound',3),(4,'sawdust','$6/pound',3);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_category`
--

DROP TABLE IF EXISTS `ingredient_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_category` (
  `ingredient_category_id` int NOT NULL AUTO_INCREMENT,
  `ingredient_category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ingredient_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_category`
--

LOCK TABLES `ingredient_category` WRITE;
/*!40000 ALTER TABLE `ingredient_category` DISABLE KEYS */;
INSERT INTO `ingredient_category` VALUES (1,'vegetables'),(2,'spices'),(3,'meats');
/*!40000 ALTER TABLE `ingredient_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `r_name` varchar(45) NOT NULL,
  `r_description` varchar(45) NOT NULL,
  `r_cooktime` int NOT NULL,
  `r_vegan` tinyint NOT NULL,
  `r_user_id` int NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `r_user_id_idx` (`r_user_id`),
  CONSTRAINT `r_user_id` FOREIGN KEY (`r_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'stew','this is stew',10,0,2),(2,'salad','this is salad',5,1,1),(3,'pasta','this is pasta',20,1,2),(4,'sandwich','this is a sandwich',100,0,1);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_category`
--

DROP TABLE IF EXISTS `recipe_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_category` (
  `recipe_category_id` int NOT NULL AUTO_INCREMENT,
  `r_id` int NOT NULL,
  `r_category_id` int NOT NULL,
  PRIMARY KEY (`recipe_category_id`),
  KEY `r_category_id_idx` (`r_category_id`),
  KEY `r_id_idx` (`r_id`),
  CONSTRAINT `r_category_id` FOREIGN KEY (`r_category_id`) REFERENCES `category` (`r_category_id`),
  CONSTRAINT `r_id_alt` FOREIGN KEY (`r_id`) REFERENCES `recipe` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_category`
--

LOCK TABLES `recipe_category` WRITE;
/*!40000 ALTER TABLE `recipe_category` DISABLE KEYS */;
INSERT INTO `recipe_category` VALUES (1,1,2),(2,2,1),(3,3,1),(4,4,2);
/*!40000 ALTER TABLE `recipe_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `step_id` int NOT NULL AUTO_INCREMENT,
  `r_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `ingredient_amount` varchar(45) NOT NULL,
  `step_num` int NOT NULL,
  `step_description` varchar(45) NOT NULL,
  PRIMARY KEY (`step_id`),
  KEY `ingredient_id_idx` (`ingredient_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`),
  CONSTRAINT `r_id` FOREIGN KEY (`r_id`) REFERENCES `recipe` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,1,2,'55g',1,'isdad'),(2,1,3,'10g',2,'text'),(3,2,1,'532g',1,'sadasd');
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(45) NOT NULL,
  `user_lastname` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'','','',''),(2,'','','',''),(3,'','','','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-30  1:59:45
