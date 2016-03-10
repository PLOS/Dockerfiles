-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: stage-haproxy.sfo.plos.org    Database: link_curation_stage
-- ------------------------------------------------------
-- Server version	5.6.22-72.0-log

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `articleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `doi` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `journalID` bigint(20) DEFAULT NULL,
  `publishedOn` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`articleID`),
  KEY `doi` (`doi`),
  KEY `journalID` (`journalID`)
) ENGINE=InnoDB AUTO_INCREMENT=17634 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `blacklistID` bigint(20) NOT NULL AUTO_INCREMENT,
  `regex` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`blacklistID`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `httpRefersConfirmed`
--

DROP TABLE IF EXISTS `httpRefersConfirmed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpRefersConfirmed` (
  `httpRefersConfirmedID` bigint(20) NOT NULL AUTO_INCREMENT,
  `articleID` bigint(20) DEFAULT NULL,
  `referTypeID` bigint(20) DEFAULT NULL,
  `doi` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `refer` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  `publication` varchar(250) DEFAULT NULL,
  `publishedOn` datetime DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `linkState` int(11) DEFAULT '0',
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`httpRefersConfirmedID`),
  KEY `doi` (`doi`),
  KEY `refer` (`refer`(250)),
  KEY `articleID` (`articleID`),
  KEY `referTypeID` (`referTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=46338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `httpRefersConfirmedHits`
--

DROP TABLE IF EXISTS `httpRefersConfirmedHits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpRefersConfirmedHits` (
  `httpRefersConfirmedHitID` bigint(20) NOT NULL AUTO_INCREMENT,
  `httpRefersConfirmedID` bigint(20) NOT NULL,
  `hits` bigint(20) DEFAULT NULL,
  `date` datetime NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`httpRefersConfirmedHitID`),
  UNIQUE KEY `httpRefersConfirmedID` (`httpRefersConfirmedID`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1396865 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `httpRefersUnconfirmed`
--

DROP TABLE IF EXISTS `httpRefersUnconfirmed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpRefersUnconfirmed` (
  `httpRefersUnconfirmedID` bigint(20) NOT NULL AUTO_INCREMENT,
  `doi` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `refer` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `canonicalRefer` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date` datetime NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`httpRefersUnconfirmedID`),
  KEY `doi` (`doi`),
  KEY `refer` (`refer`(250)),
  KEY `canonicalRefer` (`canonicalRefer`(250))
) ENGINE=InnoDB AUTO_INCREMENT=15559106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `journalID` bigint(20) NOT NULL AUTO_INCREMENT,
  `journalKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `eIssn` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`journalID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referType`
--

DROP TABLE IF EXISTS `referType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referType` (
  `referTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`referTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userJournal`
--

DROP TABLE IF EXISTS `userJournal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userJournal` (
  `userJournalID` bigint(20) NOT NULL AUTO_INCREMENT,
  `journalID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`userJournalID`),
  KEY `journalID` (`journalID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `authId` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sendreport` bit(1) NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `whitelistID` bigint(20) NOT NULL AUTO_INCREMENT,
  `regex` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`whitelistID`)
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-10 15:28:02
