-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `biography` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `publisher_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`id`),
  CONSTRAINT `Book_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_copies`
--

DROP TABLE IF EXISTS `Book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_copies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `library_branch_id` int NOT NULL,
  `no_of_copies` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `library_branch_id` (`library_branch_id`),
  CONSTRAINT `Book_copies_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`),
  CONSTRAINT `Book_copies_ibfk_2` FOREIGN KEY (`library_branch_id`) REFERENCES `Library_branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_copies`
--

LOCK TABLES `Book_copies` WRITE;
/*!40000 ALTER TABLE `Book_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_loans`
--

DROP TABLE IF EXISTS `Book_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_loans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `library_branch_id` int NOT NULL,
  `borrower_cardNo` varchar(16) NOT NULL,
  `book_id` int NOT NULL,
  `date_out` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `library_branch_id` (`library_branch_id`),
  KEY `borrower_cardNo` (`borrower_cardNo`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `Book_loans_ibfk_1` FOREIGN KEY (`library_branch_id`) REFERENCES `Library_branch` (`id`),
  CONSTRAINT `Book_loans_ibfk_2` FOREIGN KEY (`borrower_cardNo`) REFERENCES `borrower` (`cardNo`),
  CONSTRAINT `Book_loans_ibfk_3` FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_loans`
--

LOCK TABLES `Book_loans` WRITE;
/*!40000 ALTER TABLE `Book_loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library_branch`
--

DROP TABLE IF EXISTS `Library_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library_branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `adress` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library_branch`
--

LOCK TABLES `Library_branch` WRITE;
/*!40000 ALTER TABLE `Library_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publisher`
--

DROP TABLE IF EXISTS `Publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Publisher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publisher`
--

LOCK TABLES `Publisher` WRITE;
/*!40000 ALTER TABLE `Publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `Publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrower` (
  `cardNo` varchar(16) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cardNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES ('002DAC699','Kelvin','Firth'),('012EE817D','Kenya','Gaines'),('01C954C4F','Ayra','Lynn'),('01CD7D577','Alesha','Wang'),('01DE2266A','Dionne','Montgomery'),('01F3F72E9','Norman','Vaughn'),('0202DEA1D','Arran','Vazquez'),('022D91F27','Fiza','Pollard'),('023527162','Huw','Nichols'),('023DB9285','Louis','Trujillo'),('024F3987C','Forrest','Stark'),('027941488','Roberto','Vargas'),('02E81BC1F','Jan','Thorne'),('033FC78BD','Jobe','Underwood'),('039A7D38D','Maddox','Ramirez'),('039D88C84','Marcos','Hinton'),('03E06D482','Carlton','Beard'),('03E0CE676','Rhia','Spooner'),('042F16F16','Aairah','Knowles'),('043A949E7','Dora','Thornton'),('0443A5D40','Rhiana','Lake'),('0483930FB','Evalyn','Ahmed'),('0501112B6','Veronika','Case'),('051023FBE','Ashlee','Markham'),('0540D26A6','Syed','Merrill'),('05520BF5B','Marta','Schofield'),('055DF7F9C','Vihaan','Tapia'),('0562D4FFB','Menaal','Stokes'),('0563F8798','Damien','Whitworth'),('05C4790B8','Selena','Corrigan'),('05E09B822','Aine','Berg'),('05F4894B0','Rowan','Connor'),('05F71A9F4','Kajol','Ewing'),('060A40107','Meghan','Walsh'),('063D57755','Herman','Glass'),('065A49B32','Hattie','Enriquez'),('0660F365B','Fintan','Bowes'),('0663C77DA','Davey','O Neill'),('0668808F3','Allan','Mccann'),('06A8BA4D8','Colby','Alvarado'),('06ACA28A8','Karl','Reeve'),('06E533974','Jake','Rosales'),('06FE4365F','Farhan','Owen'),('07085C79D','Giorgio','Harrington'),('071ECC7B0','Karter','Molloy'),('07401A97A','Steffan','Dejesus'),('0767C700C','Reef','Stephens'),('077A7BBCA','Pharrell','Norman'),('07BB12394','Brad','Herrera'),('07D524F02','Kinga','Barrow'),('080D2E4F3','Connie','Conley'),('083622A5E','Alyce','Ochoa'),('08BE76240','Ada','White'),('08DFE521E','Kallum','Davey'),('08FE047C3','Rosalind','Pritchard'),('092B5697B','Jenson','Young'),('09364D452','Graeme','Mcculloch'),('094FF30A8','Cruz','Jimenez'),('09E7036E4','Camille','North'),('0A1CB0324','Marcia','Clay'),('0A3FD2C7F','Umar','Trejo'),('0A448EDCF','Heidi','Haynes'),('0A6FE3F21','Larry','Wiggins'),('0A9D88963','Vicky','Graham'),('0A9FBBE93','Chiara','Broughton'),('0AB6E5B62','Asif','Wormald'),('0AE76A230','Theodora','Torres'),('0B0A29BED','Alessandra','Newman'),('0B16DE805','Cadence','Fulton'),('0B29D2189','Dexter','Hill'),('0B334FF78','Seb','Roche'),('0B3925ED7','Haiden','Dale'),('0B475FD92','Sade','Davison'),('0B660E4F4','Virginia','Rush'),('0B7DA564C','Aliesha','Conroy'),('0BD3F3D2A','Karam','Nash'),('0BDF999CC','Inez','Key'),('0C27BAF38','Aditi','Mccartney'),('0C326CBB7','Geraldine','Hess'),('0C3A2D445','Valerie','Rogers'),('0C74F6BDD','Aqsa','Hibbert'),('0C8147B37','Amrita','Harrison'),('0CC7710D9','Gerrard','House'),('0D0C9B220','Catriona','Bradley'),('0D2601A21','Matthias','Giles'),('0DA337CB5','Avi','Cowan'),('0DB9EFDE6','Roxanne','Langley'),('0E1F05538','Callie','Herring'),('0E3512025','Emilija','Levine'),('0E3AC4253','Storm','Woodcock'),('0E3BEDCDF','Lacie','Person'),('0E5D1681E','Keane','Sims'),('0EB278ED2','Teejay','Nolan'),('0EEA4CCB5','Kamal','Power'),('0EFA0CBEF','Emilee','Reeves'),('0F23C01B1','Valentino','Maynard'),('0F7BC3B98','Arfa','Wu'),('0FD6646E2','Saoirse','Lynch'),('0FE9D8A08','Tai','Nielsen'),('0FF8E3879','Boris','Rawlings');
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-14 19:22:27
