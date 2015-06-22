-- MySQL dump 10.13  Distrib 5.6.21-70.1, for Linux (x86_64)
--
-- Host: localhost    Database: ambra
-- ------------------------------------------------------
-- Server version	5.6.21-70.1-log

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
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `versionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `version` int(11) NOT NULL,
  `updateInProcess` bit(1) NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`versionID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (2,'Ambra 2.20',220,'\0','2012-01-30 20:44:35','2012-01-30 20:44:35'),(3,'Ambra 2.30',230,'\0','2012-03-08 18:21:26','2012-03-08 18:22:54'),(5,'Ambra 2.32',232,'\0','2012-05-01 20:28:38','2012-05-01 20:28:55'),(7,'Ambra 2.34',234,'\0','2012-05-22 21:49:49','2012-05-22 21:50:03'),(9,'Ambra 2.37',237,'\0','2012-07-17 18:37:25','2012-07-17 18:37:26'),(11,'Ambra 2.40',240,'\0','2012-08-07 20:25:42','2012-08-07 20:25:42'),(13,'Ambra 2.43',243,'\0','2012-09-25 17:35:44','2012-09-25 17:35:52'),(15,'Ambra 2.46',246,'\0','2012-10-23 18:02:17','2012-10-23 18:02:17'),(17,'Ambra 2.48',248,'\0','2012-11-13 18:23:32','2012-11-13 18:23:32'),(19,'Ambra 2.49',249,'\0','2012-11-27 21:49:33','2012-11-27 21:49:52'),(21,'Ambra 2.50',250,'\0','2013-01-04 18:21:28','2013-01-04 18:23:08'),(23,'Ambra 2.55',255,'\0','2013-04-23 21:53:41','2013-04-23 21:53:53'),(25,'Ambra 2.80',280,'\0','2013-09-17 16:46:08','2013-09-17 16:46:08'),(27,'Ambra 2.82',282,'\0','2013-10-29 22:05:28','2013-10-29 22:05:28'),(28,'Schema 1001',1001,'\0','2014-02-18 12:55:18','2014-02-18 13:01:19'),(30,'Schema 1002',1002,'\0','2014-02-25 21:09:08','2014-02-25 21:09:08'),(31,'Schema 1003',1003,'\0','2014-04-01 22:54:58','2014-04-01 22:54:59'),(32,'Schema 1004',1004,'\0','2014-07-16 17:01:03','2014-07-16 17:01:19'),(33,'Schema 1005',1005,'\0','2014-08-06 17:32:40','2014-08-06 17:33:13');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `journalID` bigint(20) NOT NULL AUTO_INCREMENT,
  `currentIssueID` bigint(20) DEFAULT NULL,
  `journalKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `eIssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `imageUri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`journalID`),
  KEY `currentIssueID` (`currentIssueID`),
  CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`currentIssueID`) REFERENCES `issue` (`issueID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (1,2465,'PLoSMedicine','1549-1676',NULL,'PLOS Medicine',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(3,NULL,'PLoSONE','1932-6203',NULL,'PLOS ONE',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(5,2457,'PLoSGenetics','1553-7404',NULL,'PLOS Genetics',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(7,2451,'PLoSCompBiol','1553-7358',NULL,'PLOS Computational Biology',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(9,NULL,'PLoSCollections','3333-3333',NULL,'PLOS Collections',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(11,NULL,'PLoSDefault','0000-0000',NULL,'Default Journals',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(13,2453,'PLoSNTD','1935-2735',NULL,'PLOS Neglected Tropical Diseases',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(15,2467,'PLoSBiology','1545-7885',NULL,'PLOS Biology',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(17,NULL,'PLoSClinicalTrials','1555-5887',NULL,'PLOS Clinical Trials',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08'),(19,2455,'PLoSPathogens','1553-7374',NULL,'PLOS Pathogens',NULL,'2012-05-22 21:49:52','2015-06-10 11:11:08');
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-10 13:46:04
