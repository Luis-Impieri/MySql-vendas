CREATE DATABASE  IF NOT EXISTS `vendas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vendas`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: vendas
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `lojas`
--

DROP TABLE IF EXISTS `lojas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lojas` (
  `sede` varchar(2) NOT NULL,
  `produto_id` int NOT NULL,
  `produto` varchar(40) DEFAULT NULL,
  `preco` mediumtext,
  `vendas` int DEFAULT NULL,
  `lucro` mediumtext,
  PRIMARY KEY (`sede`,`produto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lojas`
--

LOCK TABLES `lojas` WRITE;
/*!40000 ALTER TABLE `lojas` DISABLE KEYS */;
INSERT INTO `lojas` VALUES ('SP',1,'iPhone 13','7000',210,'1470000'),('RJ',1,'iPhone 13','7000',150,'1050000'),('MG',1,'iPhone 13','7000',180,'1260000'),('BH',1,'iPhone 13','7000',210,'1470000'),('SP',2,'Samsung Galaxy S21','5000',220,'1100000'),('RJ',2,'Samsung Galaxy S21','5000',240,'1200000'),('MG',2,'Samsung Galaxy S21','5000',230,'1150000'),('BH',2,'Samsung Galaxy S21','5000',210,'1050000'),('SP',3,'Xiaomi Mi 11','3000',250,'750000'),('RJ',3,'Xiaomi Mi 11','3000',260,'780000'),('MG',3,'Xiaomi Mi 11','3000',270,'810000'),('BH',3,'Xiaomi Mi 11','3000',280,'840000'),('SP',4,'Macbook Pro','12000',100,'1200000'),('RJ',4,'Macbook Pro','12000',120,'1440000'),('MG',4,'Macbook Pro','12000',110,'1320000'),('BH',4,'Macbook Pro','12000',105,'1260000'),('SP',5,'Dell XPS 13','8000',150,'1200000'),('RJ',5,'Dell XPS 13','8000',160,'1280000'),('MG',5,'Dell XPS 13','8000',155,'1240000'),('BH',5,'Dell XPS 13','8000',145,'1160000'),('SP',6,'iPad Pro','5000',300,'1500000'),('RJ',6,'iPad Pro','5000',310,'1550000'),('MG',6,'iPad Pro','5000',320,'1600000'),('BH',6,'iPad Pro','5000',315,'1575000'),('SP',7,'Samsung Galaxy Tab S7','4000',280,'1120000'),('RJ',7,'Samsung Galaxy Tab S7','4000',290,'1160000'),('MG',7,'Samsung Galaxy Tab S7','4000',295,'1180000'),('BH',7,'Samsung Galaxy Tab S7','4000',285,'1140000'),('SP',8,'Amazon Echo Dot','300',500,'150000'),('RJ',8,'Amazon Echo Dot','300',510,'153000'),('MG',8,'Amazon Echo Dot','300',520,'156000'),('BH',8,'Amazon Echo Dot','300',515,'154500'),('SP',9,'Google Nest Mini','250',480,'120000'),('RJ',9,'Google Nest Mini','250',490,'122500'),('MG',9,'Google Nest Mini','250',500,'125000'),('BH',9,'Google Nest Mini','250',495,'123750'),('SP',10,'Apple Watch Series 7','3500',400,'1400000'),('RJ',10,'Apple Watch Series 7','3500',410,'1435000'),('MG',10,'Apple Watch Series 7','3500',420,'1470000'),('BH',10,'Apple Watch Series 7','3500',415,'1452500');
/*!40000 ALTER TABLE `lojas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nova_venda` BEFORE UPDATE ON `lojas` FOR EACH ROW set new.lucro = (new.preco * new.vendas) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `novo_nome` AFTER UPDATE ON `lojas` FOR EACH ROW BEGIN
    IF OLD.produto != NEW.produto THEN
        UPDATE lojas
        SET produto = NEW.produto
        WHERE produto_id = NEW.produto_id AND sede != NEW.sede;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 13:35:13
