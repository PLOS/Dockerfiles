-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: namedEntities
-- ------------------------------------------------------
-- Server version	5.6.30-76.3

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
-- Dumping data for table `authCas`
--

LOCK TABLES `authCas` WRITE;
/*!40000 ALTER TABLE `authCas` DISABLE KEYS */;
INSERT INTO `authCas` VALUES (1,1,1,'8eb87d70-32c6-405c-a385-f504352dbc90','3feba5329a45c0469388b33098e9d36c77beb127b7599350304b0cd938d1b42703d0d9e811ecec76168618b76fc0ae5f484817db26170165de2b2ff9213721bf',0,NULL,0,1,'2016-10-13 23:16:12',5,'2016-10-13 23:16:48',5),(2,2,2,'f69e1eac-33c1-4b6d-a744-f47333c14073','bb8e1de1fa2d6a3782332f493b7b432bc96f37cb37d86bf2838d235c63f97efbb28592cb51426f1f352a55b0a57939c49e4853f1a02c33c644da70155ea82164',0,NULL,0,1,'2016-10-13 23:26:13',5,'2016-10-13 23:26:42',5);
/*!40000 ALTER TABLE `authCas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consumers`
--

LOCK TABLES `consumers` WRITE;
/*!40000 ALTER TABLE `consumers` DISABLE KEYS */;
INSERT INTO `consumers` VALUES (3,'akita','$2a$04$nXND2XviQM2L5BCoSY7gO.LgW/RwilBCJAPY7N0b1L8ZEEdE2GRFO','2016-10-13 20:58:43','2016-10-13 20:58:43'),(5,'dev','$2a$04$ngPAL3DjegCrSW8r57ZJ3e3tKPA9HIvmYyB.9gZSuPgK76wvHi3Tq','2016-10-13 21:06:44','2016-10-13 21:06:44');
/*!40000 ALTER TABLE `consumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
/*!40000 ALTER TABLE `degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,1,NULL,'devreader@mailinator.com',7,1,1,'2016-10-13 23:16:12',5,'2016-10-13 23:16:48',5),(2,2,NULL,'devadmin@mailinator.com',7,1,1,'2016-10-13 23:26:13',5,'2016-10-13 23:26:42',5);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `globalTypes`
--

--
-- Dumping data for table `individualProfiles`
--

LOCK TABLES `individualProfiles` WRITE;
/*!40000 ALTER TABLE `individualProfiles` DISABLE KEYS */;
INSERT INTO `individualProfiles` VALUES (1,1,'John',NULL,'Reader',NULL,NULL,NULL,'jreader',NULL,7,1,'2016-10-13 23:16:12',5,'2016-10-13 23:16:12',5),(2,2,'Jane',NULL,'Admin',NULL,NULL,NULL,'jadmin',NULL,7,1,'2016-10-13 23:26:13',5,'2016-10-13 23:26:13',5);
/*!40000 ALTER TABLE `individualProfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `namedEntityIdentifiers`
--

LOCK TABLES `namedEntityIdentifiers` WRITE;
/*!40000 ALTER TABLE `namedEntityIdentifiers` DISABLE KEYS */;
INSERT INTO `namedEntityIdentifiers` VALUES (1,1,'2016-10-13 23:16:12','2016-10-13 23:16:12',1,1),(2,1,'2016-10-13 23:26:13','2016-10-13 23:26:13',1,1);
/*!40000 ALTER TABLE `namedEntityIdentifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `phoneNumbers`
--

LOCK TABLES `phoneNumbers` WRITE;
/*!40000 ALTER TABLE `phoneNumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `phoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` VALUES (1,1,'1','ned schema','SQL','V1__ned_schema.sql',-692235999,'ned','2016-10-13 20:40:44',1300,1),(10,10,'10','ps1275','SQL','V10__ps1275.sql',1845917043,'ned','2016-10-13 20:40:45',89,1),(11,11,'11','ps1519','SQL','V11__ps1519.sql',1965988514,'ned','2016-10-13 20:40:45',118,1),(12,12,'12','plt360','SQL','V12__plt360.sql',-1017444574,'ned','2016-10-13 20:40:45',14,1),(2,2,'2','ned data','SQL','V2__ned_data.sql',-454181802,'ned','2016-10-13 20:40:45',123,1),(3,3,'3','ps1105','SQL','V3__ps1105.sql',-1706064455,'ned','2016-10-13 20:40:45',33,1),(4,4,'4','ps1135','SQL','V4__ps1135.sql',-1160871242,'ned','2016-10-13 20:40:45',83,1),(5,5,'5','ps1129','SQL','V5__ps1129.sql',-1047195701,'ned','2016-10-13 20:40:45',15,1),(6,6,'6','ps1146','SQL','V6__ps1146.sql',-277589770,'ned','2016-10-13 20:40:45',130,1),(7,7,'7','ps1166','SQL','V7__ps1166.sql',908913464,'ned','2016-10-13 20:40:45',6,1),(8,8,'8','ps1131','SQL','V8__ps1131.sql',-1190343386,'ned','2016-10-13 20:40:45',177,1),(9,9,'9','ps1255','SQL','V9__ps1255.sql',-573200181,'ned','2016-10-13 20:40:45',6,1);
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sourceFields`
--

LOCK TABLES `sourceFields` WRITE;
/*!40000 ALTER TABLE `sourceFields` DISABLE KEYS */;
/*!40000 ALTER TABLE `sourceFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subjectAreas`
--

LOCK TABLES `subjectAreas` WRITE;
/*!40000 ALTER TABLE `subjectAreas` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjectAreas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `typeDescriptions`
--

LOCK TABLES `typeDescriptions` WRITE;
/*!40000 ALTER TABLE `typeDescriptions` DISABLE KEYS */;
INSERT INTO `typeDescriptions` VALUES (1,'Named Party Types','Individual, Organization','2016-10-13 20:40:44','2016-10-13 20:40:44'),(2,'User Applications','Editorial Manager, Ambra, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(3,'Source Applications','Editorial Manager, Ambra, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(4,'Organization Types','University, Department, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(6,'Named Party Prefixes','Ms, Dr, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(7,'Named Party Suffixes','II, III, Jr, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(8,'Languages','English, Mandarin, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(9,'Communication Methods','Phone, Email, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(10,'Telephone Number Types','Home, Mobile, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(11,'Email Address Types','Home, Work, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(12,'Physical Address Types','Home, Work, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(13,'Relationship Types','AE/Author, Manager/Subordinate, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(14,'Country Codes for Phone Numbers','01, 44, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(15,'Subject Areas','Cancer, Urology, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(16,'Journal Types','PLOSOne, PLOS Biology, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(17,'Country Types','United States, Canada, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(18,'UID Individual Types','ORCID, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(19,'UID Organization Types','ORCID, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(20,'State and Province Codes','CA, ONT, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(21,'Degrees','MD, PhD, etc','2016-10-13 20:40:45','2016-10-13 20:40:45'),(22,'Groups','Roles, Membership, ...','2016-10-13 20:40:45','2016-10-13 20:40:45'),(23,'Alert Frequency','Weekly, Monthly, etc','2016-10-13 20:40:45','2016-10-13 20:40:45');
/*!40000 ALTER TABLE `typeDescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `uniqueIdentifiers`
--

LOCK TABLES `uniqueIdentifiers` WRITE;
/*!40000 ALTER TABLE `uniqueIdentifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `uniqueIdentifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `urls`
--

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `urls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-13 16:26:50
