-- MySQL dump 10.13  Distrib 5.1.69, for redhat-linux-gnu (x86_64)
--
-- Host: 127.4.141.1    Database: ruby_class
-- ------------------------------------------------------
-- Server version	5.1.69

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `age` int(3) NOT NULL,
  `dob` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Steven','Arsena',24,'1988-12-19','2013-07-31 01:06:57'),(2,'Aaron','Kirby',23,'1989-08-01','2013-07-31 01:06:57'),(3,'Patrick','Nolan',24,'1989-03-26','2013-07-31 01:06:57');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Logs`
--

DROP TABLE IF EXISTS `Logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Logs` (
  `script_name` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` varchar(60) DEFAULT NULL,
  `load_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Logs`
--

LOCK TABLES `Logs` WRITE;
/*!40000 ALTER TABLE `Logs` DISABLE KEYS */;
INSERT INTO `Logs` VALUES ('Customers Load','','success','2013-07-18 01:59:06'),('Customers Load','','success','2013-07-18 01:59:17'),('Customers Load','You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'on\', \'Kirby\', \'23\', \'1989-08-01\', \'2013-07-17 22:31:45\')\' at line 1','failed','2013-07-18 02:31:45'),('Customers Load','You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'on\', \'Kirby\', \'23\', \'1989-08-01\', \'2013-07-17 22:32:59\')\' at line 1','failed','2013-07-18 02:32:59'),('Customers Load','','success','2013-07-18 02:33:30'),('Customers Load','','success','2013-07-18 02:52:49'),('Customers Load','','success','2013-07-18 02:54:25'),('Customers Load','You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'n\', \'Kirby\', \'23\', \'1989-08-01\', \'2013-07-17 22:56:07\')\' at line 1','failed','2013-07-18 02:56:07'),('Customers Load','You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'n\', \'Kirby\', \'23\', \'1989-08-01\', \'2013-07-17 23:01:59\')\' at line 1','failed','2013-07-18 03:01:59'),('Customers Load','','success','2013-07-18 03:16:56'),('Customers Load','','success','2013-07-18 03:19:11'),('Customers Load','','success','2013-07-31 01:06:57');
/*!40000 ALTER TABLE `Logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_products`
--

DROP TABLE IF EXISTS `Order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_products` (
  `orderid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  `product_cost` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_products`
--

LOCK TABLES `Order_products` WRITE;
/*!40000 ALTER TABLE `Order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `orderid` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_placed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_total` float NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-30 21:42:43
