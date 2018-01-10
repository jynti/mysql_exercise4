-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: DVDRentals
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.04.1

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
-- Table structure for table `Cities`
--

DROP TABLE IF EXISTS `Cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cities` (
  `CityID` smallint(6) NOT NULL,
  `CityName` varchar(20) NOT NULL,
  PRIMARY KEY (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cities`
--

LOCK TABLES `Cities` WRITE;
/*!40000 ALTER TABLE `Cities` DISABLE KEYS */;
INSERT INTO `Cities` VALUES (101,'Seattle'),(102,'Redmond'),(103,'Bellevue'),(104,'Kent'),(105,'Kirkland');
/*!40000 ALTER TABLE `Cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustCity`
--

DROP TABLE IF EXISTS `CustCity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustCity` (
  `CustID` smallint(6) NOT NULL,
  `CityID` smallint(6) NOT NULL,
  PRIMARY KEY (`CustID`,`CityID`),
  KEY `CityID` (`CityID`),
  CONSTRAINT `CustCity_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `Customers` (`CustID`),
  CONSTRAINT `CustCity_ibfk_2` FOREIGN KEY (`CityID`) REFERENCES `Cities` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustCity`
--

LOCK TABLES `CustCity` WRITE;
/*!40000 ALTER TABLE `CustCity` DISABLE KEYS */;
INSERT INTO `CustCity` VALUES (2,101),(5,102),(4,103),(1,104),(3,104),(6,105);
/*!40000 ALTER TABLE `CustCity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `CustID` smallint(6) NOT NULL AUTO_INCREMENT,
  `CustFN` varchar(20) NOT NULL,
  `CustMN` varchar(20) DEFAULT NULL,
  `CustLN` varchar(20) NOT NULL,
  PRIMARY KEY (`CustID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Ralph','Frederick','Johnson'),(2,'Hubert','T.','Weatherby'),(3,'Anne',NULL,'Thomas'),(4,'Mona','J.','Cavenaugh'),(5,'Peter',NULL,'Taylor'),(6,'Ginger','Meagan','Delaney');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DVDParticipant`
--

DROP TABLE IF EXISTS `DVDParticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DVDParticipant` (
  `DVDID` smallint(6) NOT NULL,
  `PartID` smallint(6) NOT NULL,
  `RoleID` varchar(4) NOT NULL,
  PRIMARY KEY (`DVDID`,`PartID`,`RoleID`),
  KEY `PartID` (`PartID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `DVDParticipant_ibfk_1` FOREIGN KEY (`DVDID`) REFERENCES `DVDs` (`DVDID`),
  CONSTRAINT `DVDParticipant_ibfk_2` FOREIGN KEY (`PartID`) REFERENCES `Participants` (`PartID`),
  CONSTRAINT `DVDParticipant_ibfk_3` FOREIGN KEY (`RoleID`) REFERENCES `Roles` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DVDParticipant`
--

LOCK TABLES `DVDParticipant` WRITE;
/*!40000 ALTER TABLE `DVDParticipant` DISABLE KEYS */;
INSERT INTO `DVDParticipant` VALUES (3,1,'r102'),(3,1,'r103'),(3,2,'r101'),(3,3,'r101'),(3,4,'r108'),(2,5,'r107'),(4,6,'r101'),(1,7,'r101'),(1,8,'r101'),(1,9,'r108'),(1,10,'r102'),(1,11,'r101');
/*!40000 ALTER TABLE `DVDParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DVDs`
--

DROP TABLE IF EXISTS `DVDs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DVDs` (
  `DVDID` smallint(6) NOT NULL AUTO_INCREMENT,
  `DVDName` varchar(60) NOT NULL,
  `NumDisks` tinyint(4) NOT NULL DEFAULT '1',
  `YearRlsd` year(4) NOT NULL,
  `MTypeID` varchar(4) NOT NULL,
  `StudID` varchar(4) NOT NULL,
  `RatingID` varchar(4) NOT NULL,
  `FormID` char(2) NOT NULL,
  `StatID` char(3) NOT NULL,
  PRIMARY KEY (`DVDID`),
  KEY `MTypeID` (`MTypeID`),
  KEY `StudID` (`StudID`),
  KEY `RatingID` (`RatingID`),
  KEY `FormID` (`FormID`),
  KEY `StatID` (`StatID`),
  CONSTRAINT `DVDs_ibfk_1` FOREIGN KEY (`MTypeID`) REFERENCES `MovieTypes` (`MTypeID`),
  CONSTRAINT `DVDs_ibfk_2` FOREIGN KEY (`StudID`) REFERENCES `Studios` (`StudID`),
  CONSTRAINT `DVDs_ibfk_3` FOREIGN KEY (`RatingID`) REFERENCES `Ratings` (`RatingID`),
  CONSTRAINT `DVDs_ibfk_4` FOREIGN KEY (`FormID`) REFERENCES `Formats` (`FormID`),
  CONSTRAINT `DVDs_ibfk_5` FOREIGN KEY (`StatID`) REFERENCES `Status` (`StatID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DVDs`
--

LOCK TABLES `DVDs` WRITE;
/*!40000 ALTER TABLE `DVDs` DISABLE KEYS */;
INSERT INTO `DVDs` VALUES (1,'White Christmas',1,2000,'mt16','s105','NR','f1','s1'),(2,'What\'s Up, Doc?',1,2001,'mt12','s103','G','f1','s2'),(3,'Out of Africa',1,2000,'mt11','s101','PG','f1','s1'),(4,'The Maltese Falcon',1,2000,'mt11','s103','NR','f1','s2'),(5,'Amadeus',1,1997,'mt11','s103','PG','f1','s2'),(6,'The Rocky Horror Picture Show',2,2000,'mt12','s106','NR','f1','s2'),(7,'A Room with a View',1,2000,'mt11','s107','NR','f1','s1'),(8,'Mash',2,2001,'mt12','s106','R','f1','s2');
/*!40000 ALTER TABLE `DVDs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employees` (
  `EmpID` smallint(6) NOT NULL AUTO_INCREMENT,
  `EmpFN` varchar(20) NOT NULL,
  `EmpMN` varchar(20) DEFAULT NULL,
  `EmpLN` varchar(20) NOT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'John','P.','Smith'),(2,'Robert',NULL,'Schroader'),(3,'Mary','Marie','Michaels'),(4,'John',NULL,'Laguci'),(5,'Rita','C.','Carter'),(6,'George',NULL,'Brooks');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Formats`
--

DROP TABLE IF EXISTS `Formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Formats` (
  `FormID` char(2) NOT NULL,
  `FormDescrip` varchar(15) NOT NULL,
  PRIMARY KEY (`FormID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formats`
--

LOCK TABLES `Formats` WRITE;
/*!40000 ALTER TABLE `Formats` DISABLE KEYS */;
INSERT INTO `Formats` VALUES ('f1','Widescreen'),('f2','Fullscreen');
/*!40000 ALTER TABLE `Formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MovieTypes`
--

DROP TABLE IF EXISTS `MovieTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MovieTypes` (
  `MTypeID` varchar(4) NOT NULL,
  `MTypeDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`MTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MovieTypes`
--

LOCK TABLES `MovieTypes` WRITE;
/*!40000 ALTER TABLE `MovieTypes` DISABLE KEYS */;
INSERT INTO `MovieTypes` VALUES ('mt10','Action'),('mt11','Drama'),('mt12','Comedy'),('mt13','Romantic Comedy'),('mt14','Science Fiction/Fantasy'),('mt15','Documentary'),('mt16','Musical');
/*!40000 ALTER TABLE `MovieTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustID` smallint(6) NOT NULL,
  `EmpID` smallint(6) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustID` (`CustID`),
  KEY `EmpID` (`EmpID`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `Customers` (`CustID`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`EmpID`) REFERENCES `Employees` (`EmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,3),(2,1,2),(3,2,5),(4,3,6),(5,4,1),(6,3,3),(7,5,2),(8,6,4),(9,4,5),(10,6,2),(11,3,1),(12,1,6),(13,5,4);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Participants`
--

DROP TABLE IF EXISTS `Participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Participants` (
  `PartID` smallint(6) NOT NULL AUTO_INCREMENT,
  `PartFN` varchar(20) NOT NULL,
  `PartMN` varchar(20) DEFAULT NULL,
  `PartLN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participants`
--

LOCK TABLES `Participants` WRITE;
/*!40000 ALTER TABLE `Participants` DISABLE KEYS */;
INSERT INTO `Participants` VALUES (1,'Sydney',NULL,'Pollack'),(2,'Robert',NULL,'Redford'),(3,'Meryl',NULL,'Streep'),(4,'John',NULL,'Barry'),(5,'Henry',NULL,'Buck'),(6,'Humphrey',NULL,'Bogart'),(7,'Danny',NULL,'Kaye'),(8,'Rosemary',NULL,'Clooney'),(9,'Irving',NULL,'Berlin'),(10,'Michael',NULL,'Curtiz'),(11,'Bing',NULL,' Crosby');
/*!40000 ALTER TABLE `Participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ratings`
--

DROP TABLE IF EXISTS `Ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ratings` (
  `RatingID` varchar(4) NOT NULL,
  `RatingDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`RatingID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ratings`
--

LOCK TABLES `Ratings` WRITE;
/*!40000 ALTER TABLE `Ratings` DISABLE KEYS */;
INSERT INTO `Ratings` VALUES ('G','General audiences'),('NR','Not rated'),('PG','Parental guidance suggested'),('PG13','Parents strongly cautioned'),('R','Under 17 requires adult'),('X','No one 17 and under');
/*!40000 ALTER TABLE `Ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `RoleID` varchar(4) NOT NULL,
  `RoleDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES ('r101','Actor'),('r102','Director'),('r103','Producer'),('r104','Executive Producer'),('r105','Co-Producer'),('r106','Assistant Producer'),('r107','Screenwriter'),('r108','Composer');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Status` (
  `StatID` char(3) NOT NULL,
  `StatDescrip` varchar(20) NOT NULL,
  PRIMARY KEY (`StatID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES ('s1','Checked out'),('s2','Available'),('s3','Damaged'),('s4','Lost');
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Studios`
--

DROP TABLE IF EXISTS `Studios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Studios` (
  `StudID` varchar(4) NOT NULL,
  `StudDescrip` varchar(40) NOT NULL,
  PRIMARY KEY (`StudID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Studios`
--

LOCK TABLES `Studios` WRITE;
/*!40000 ALTER TABLE `Studios` DISABLE KEYS */;
INSERT INTO `Studios` VALUES ('s101','Universal Studios'),('s102','Warner Brothers'),('s103','Time Warmer'),('s104','Columbia Pictures'),('s105','Paramount Pictures'),('s106','Twentieth Century Fox'),('s107','Merchant Ivory Production');
/*!40000 ALTER TABLE `Studios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transactions` (
  `TransID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `DVDID` smallint(6) NOT NULL,
  `DateOut` date NOT NULL,
  `DateDue` date NOT NULL,
  `DateIn` date NOT NULL,
  PRIMARY KEY (`TransID`),
  KEY `OrderID` (`OrderID`),
  KEY `DVDID` (`DVDID`),
  CONSTRAINT `Transactions_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  CONSTRAINT `Transactions_ibfk_2` FOREIGN KEY (`DVDID`) REFERENCES `DVDs` (`DVDID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,1,1,'2018-01-04','2018-01-07','0000-00-00'),(2,1,4,'2018-01-04','2018-01-07','0000-00-00'),(3,1,8,'2018-01-04','2018-01-07','0000-00-00'),(4,2,3,'2018-01-04','2018-01-07','0000-00-00'),(5,3,4,'2018-01-04','2018-01-07','0000-00-00'),(6,3,1,'2018-01-04','2018-01-07','0000-00-00'),(7,3,7,'2018-01-04','2018-01-07','0000-00-00'),(8,4,4,'2018-01-04','2018-01-07','0000-00-00'),(9,5,3,'2018-01-04','2018-01-07','0000-00-00'),(10,6,2,'2018-01-04','2018-01-07','0000-00-00'),(11,6,1,'2018-01-04','2018-01-07','0000-00-00'),(12,7,4,'2018-01-04','2018-01-07','0000-00-00'),(13,8,2,'2018-01-04','2018-01-07','0000-00-00'),(14,8,1,'2018-01-04','2018-01-07','0000-00-00'),(15,8,3,'2018-01-04','2018-01-07','0000-00-00'),(16,9,7,'2018-01-04','2018-01-07','0000-00-00'),(17,9,1,'2018-01-04','2018-01-07','0000-00-00'),(18,10,5,'2018-01-04','2018-01-07','0000-00-00'),(19,11,6,'2018-01-04','2018-01-07','0000-00-00'),(20,11,2,'2018-01-04','2018-01-07','0000-00-00'),(21,11,8,'2018-01-04','2018-01-07','0000-00-00'),(22,12,5,'2018-01-04','2018-01-07','0000-00-00'),(23,13,7,'2018-01-04','2018-01-07','0000-00-00');
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-10 11:50:08
