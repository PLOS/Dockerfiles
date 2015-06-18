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
-- Table structure for table `annotation`
--

DROP TABLE IF EXISTS `annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annotation` (
  `annotationID` bigint(20) NOT NULL AUTO_INCREMENT,
  `annotationURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `articleID` bigint(20) DEFAULT NULL,
  `parentID` bigint(20) DEFAULT NULL,
  `userProfileID` bigint(20) NOT NULL,
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin,
  `body` text CHARACTER SET utf8 COLLATE utf8_bin,
  `competingInterestBody` text CHARACTER SET utf8 COLLATE utf8_bin,
  `highlightedText` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`annotationID`),
  UNIQUE KEY `annotationURI` (`annotationURI`),
  KEY `articleID` (`articleID`),
  KEY `parentID` (`parentID`),
  KEY `userProfileID` (`userProfileID`),
  CONSTRAINT `annotation_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`),
  CONSTRAINT `annotation_ibfk_3` FOREIGN KEY (`parentID`) REFERENCES `annotation` (`annotationID`),
  CONSTRAINT `annotation_ibfk_4` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=80085 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `annotationFlag`
--

DROP TABLE IF EXISTS `annotationFlag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annotationFlag` (
  `annotationFlagID` bigint(20) NOT NULL AUTO_INCREMENT,
  `annotationID` bigint(20) NOT NULL,
  `userProfileID` bigint(20) NOT NULL,
  `reason` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`annotationFlagID`),
  KEY `annotationID` (`annotationID`),
  KEY `userProfileID` (`userProfileID`),
  CONSTRAINT `annotationFlag_ibfk_1` FOREIGN KEY (`annotationID`) REFERENCES `annotation` (`annotationID`),
  CONSTRAINT `annotationFlag_ibfk_2` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=12739 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `articleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `doi` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `eIssn` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` int(11) NOT NULL,
  `archiveName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `rights` text CHARACTER SET utf8 COLLATE utf8_bin,
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `format` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date` datetime NOT NULL,
  `volume` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `issue` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `journal` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `publisherLocation` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `publisherName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pages` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `eLocationID` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `strkImgURI` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`articleID`),
  KEY `doi` (`doi`)
) ENGINE=InnoDB AUTO_INCREMENT=243977 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articleAsset`
--

DROP TABLE IF EXISTS `articleAsset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleAsset` (
  `articleAssetID` bigint(20) NOT NULL AUTO_INCREMENT,
  `articleID` bigint(20) DEFAULT NULL,
  `doi` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `contextElement` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `contentType` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `extension` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `size` bigint(20) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`articleAssetID`),
  UNIQUE KEY `doi_2` (`doi`,`extension`),
  KEY `articleID` (`articleID`),
  KEY `doi` (`doi`),
  CONSTRAINT `articleAsset_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB AUTO_INCREMENT=14485664 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articleCategoryFlagged`
--

DROP TABLE IF EXISTS `articleCategoryFlagged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleCategoryFlagged` (
  `articleID` bigint(20) NOT NULL,
  `categoryID` bigint(20) NOT NULL,
  `userProfileID` bigint(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  UNIQUE KEY `articleID` (`articleID`,`categoryID`,`userProfileID`),
  KEY `categoryID` (`categoryID`),
  KEY `userProfileID` (`userProfileID`),
  CONSTRAINT `articleCategoryFlagged_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`),
  CONSTRAINT `articleCategoryFlagged_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`),
  CONSTRAINT `articleCategoryFlagged_ibfk_3` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articleCategoryJoinTable`
--

DROP TABLE IF EXISTS `articleCategoryJoinTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleCategoryJoinTable` (
  `articleID` bigint(20) NOT NULL,
  `categoryID` bigint(20) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`articleID`,`categoryID`),
  KEY `articleID` (`articleID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `articleCategoryJoinTable_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`),
  CONSTRAINT `articleCategoryJoinTable_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articleCollaborativeAuthors`
--

DROP TABLE IF EXISTS `articleCollaborativeAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleCollaborativeAuthors` (
  `articleID` bigint(20) NOT NULL,
  `sortOrder` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`articleID`,`sortOrder`),
  KEY `articleID` (`articleID`),
  CONSTRAINT `articleCollaborativeAuthors_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articleList`
--

DROP TABLE IF EXISTS `articleList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleList` (
  `articleListID` bigint(20) NOT NULL AUTO_INCREMENT,
  `listCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `displayName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `journalID` bigint(20) DEFAULT NULL,
  `journalSortOrder` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`articleListID`),
  UNIQUE KEY `listCode` (`listCode`),
  KEY `journalID` (`journalID`),
  CONSTRAINT `articleList_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`journalID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articleListJoinTable`
--

DROP TABLE IF EXISTS `articleListJoinTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleListJoinTable` (
  `articleListID` bigint(20) NOT NULL,
  `sortOrder` int(11) NOT NULL,
  `doi` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`articleListID`,`sortOrder`),
  CONSTRAINT `articleListJoinTable_ibfk_1` FOREIGN KEY (`articleListID`) REFERENCES `articleList` (`articleListID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articlePerson`
--

DROP TABLE IF EXISTS `articlePerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlePerson` (
  `articlePersonID` bigint(20) NOT NULL AUTO_INCREMENT,
  `articleID` bigint(20) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fullName` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `givenNames` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `surnames` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `suffix` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`articlePersonID`),
  KEY `articleID` (`articleID`),
  CONSTRAINT `articlePerson_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB AUTO_INCREMENT=1925643 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articlePublishedJournals`
--

DROP TABLE IF EXISTS `articlePublishedJournals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlePublishedJournals` (
  `articleID` bigint(20) NOT NULL,
  `journalID` bigint(20) NOT NULL,
  PRIMARY KEY (`articleID`,`journalID`),
  KEY `journalID` (`journalID`),
  CONSTRAINT `articlePublishedJournals_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`),
  CONSTRAINT `articlePublishedJournals_ibfk_2` FOREIGN KEY (`journalID`) REFERENCES `journal` (`journalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articleRelationship`
--

DROP TABLE IF EXISTS `articleRelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleRelationship` (
  `articleRelationshipID` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentArticleID` bigint(20) NOT NULL,
  `otherArticleDoi` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `otherArticleID` bigint(20) DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sortOrder` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`articleRelationshipID`),
  KEY `parentArticleID` (`parentArticleID`),
  KEY `otherArticleID` (`otherArticleID`),
  CONSTRAINT `articleRelationship_ibfk_1` FOREIGN KEY (`parentArticleID`) REFERENCES `article` (`articleID`),
  CONSTRAINT `articleRelationship_ibfk_2` FOREIGN KEY (`otherArticleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB AUTO_INCREMENT=27866 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articleType`
--

DROP TABLE IF EXISTS `articleType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articleType` (
  `articleID` bigint(20) NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  KEY `articleID` (`articleID`),
  CONSTRAINT `articleType_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=54157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoryFeaturedArticle`
--

DROP TABLE IF EXISTS `categoryFeaturedArticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoryFeaturedArticle` (
  `categoryFeaturedArticleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `journalID` bigint(20) NOT NULL,
  `articleID` bigint(20) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`categoryFeaturedArticleID`),
  UNIQUE KEY `journalID` (`journalID`,`category`),
  KEY `articleID` (`articleID`),
  CONSTRAINT `categoryFeaturedArticle_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`journalID`),
  CONSTRAINT `categoryFeaturedArticle_ibfk_2` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citedArticle`
--

DROP TABLE IF EXISTS `citedArticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citedArticle` (
  `citedArticleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `articleID` bigint(20) DEFAULT NULL,
  `keyColumn` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `displayYear` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `month` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `day` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `volumeNumber` int(11) DEFAULT NULL,
  `volume` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `issue` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_bin,
  `publisherLocation` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `publisherName` text CHARACTER SET utf8 COLLATE utf8_bin,
  `pages` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `eLocationID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `journal` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_bin,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `doi` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pmid` varchar(9) DEFAULT NULL,
  `citationType` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `summary` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`citedArticleID`),
  KEY `articleID` (`articleID`),
  CONSTRAINT `citedArticle_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11994974 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citedArticleCollaborativeAuthors`
--

DROP TABLE IF EXISTS `citedArticleCollaborativeAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citedArticleCollaborativeAuthors` (
  `citedArticleID` bigint(20) NOT NULL,
  `sortOrder` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`citedArticleID`,`sortOrder`),
  KEY `citedArticleID` (`citedArticleID`),
  CONSTRAINT `citedArticleCollaborativeAuthors_ibfk_1` FOREIGN KEY (`citedArticleID`) REFERENCES `citedArticle` (`citedArticleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citedPerson`
--

DROP TABLE IF EXISTS `citedPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citedPerson` (
  `citedPersonID` bigint(20) NOT NULL AUTO_INCREMENT,
  `citedArticleID` bigint(20) DEFAULT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fullName` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `givenNames` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `surnames` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`citedPersonID`),
  KEY `citedArticleID` (`citedArticleID`),
  CONSTRAINT `citedPerson_ibfk_1` FOREIGN KEY (`citedArticleID`) REFERENCES `citedArticle` (`citedArticleID`)
) ENGINE=InnoDB AUTO_INCREMENT=26082240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `issueID` bigint(20) NOT NULL AUTO_INCREMENT,
  `issueUri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `volumeID` bigint(20) DEFAULT NULL,
  `volumeSortOrder` int(11) DEFAULT NULL,
  `displayName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `respectOrder` bit(1) DEFAULT NULL,
  `imageUri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`issueID`),
  UNIQUE KEY `issueUri` (`issueUri`),
  KEY `volumeID` (`volumeID`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`volumeID`) REFERENCES `volume` (`volumeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2471 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issueArticleList`
--

DROP TABLE IF EXISTS `issueArticleList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issueArticleList` (
  `issueID` bigint(20) NOT NULL DEFAULT '0',
  `sortOrder` int(11) NOT NULL DEFAULT '0',
  `doi` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`issueID`,`sortOrder`),
  CONSTRAINT `issueArticleList_ibfk_1` FOREIGN KEY (`issueID`) REFERENCES `issue` (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `pingback`
--

DROP TABLE IF EXISTS `pingback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingback` (
  `pingbackID` bigint(20) NOT NULL AUTO_INCREMENT,
  `articleID` bigint(20) NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`pingbackID`),
  UNIQUE KEY `articleID` (`articleID`,`url`)
) ENGINE=InnoDB AUTO_INCREMENT=20095 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `savedSearch`
--

DROP TABLE IF EXISTS `savedSearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savedSearch` (
  `savedSearchID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userProfileID` bigint(20) NOT NULL,
  `savedSearchQueryID` bigint(20) NOT NULL,
  `searchName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `searchType` varchar(16) NOT NULL,
  `lastWeeklySearchTime` datetime NOT NULL,
  `lastMonthlySearchTime` datetime NOT NULL,
  `monthly` bit(1) DEFAULT b'0',
  `weekly` bit(1) DEFAULT b'0',
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`savedSearchID`),
  UNIQUE KEY `userProfileID` (`userProfileID`,`searchName`),
  KEY `savedSearchQueryID` (`savedSearchQueryID`),
  CONSTRAINT `savedSearch_ibfk_1` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`),
  CONSTRAINT `savedSearch_ibfk_2` FOREIGN KEY (`savedSearchQueryID`) REFERENCES `savedSearchQuery` (`savedSearchQueryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11555 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `savedSearchQuery`
--

DROP TABLE IF EXISTS `savedSearchQuery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savedSearchQuery` (
  `savedSearchQueryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `searchParams` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hash` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `lastmodified` datetime NOT NULL,
  PRIMARY KEY (`savedSearchQueryID`),
  UNIQUE KEY `hash_2` (`hash`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=12601 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syndication`
--

DROP TABLE IF EXISTS `syndication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syndication` (
  `syndicationID` bigint(20) NOT NULL AUTO_INCREMENT,
  `doi` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `target` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `submissionCount` int(11) DEFAULT NULL,
  `errorMessage` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `created` datetime NOT NULL,
  `lastSubmitTimestamp` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`syndicationID`),
  UNIQUE KEY `doi` (`doi`,`target`)
) ENGINE=InnoDB AUTO_INCREMENT=956197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trackback`
--

DROP TABLE IF EXISTS `trackback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackback` (
  `trackbackID` bigint(20) NOT NULL AUTO_INCREMENT,
  `articleID` bigint(20) NOT NULL,
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `blogname` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `excerpt` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`trackbackID`),
  KEY `articleID` (`articleID`),
  CONSTRAINT `trackback_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4462 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userArticleView`
--

DROP TABLE IF EXISTS `userArticleView`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userArticleView` (
  `userArticleViewID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userProfileID` bigint(20) NOT NULL,
  `articleID` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`userArticleViewID`),
  KEY `userProfileID` (`userProfileID`),
  KEY `articleID` (`articleID`),
  CONSTRAINT `userArticleView_ibfk_1` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`),
  CONSTRAINT `userArticleView_ibfk_2` FOREIGN KEY (`articleID`) REFERENCES `article` (`articleID`)
) ENGINE=InnoDB AUTO_INCREMENT=270783 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userLogin`
--

DROP TABLE IF EXISTS `userLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userLogin` (
  `userLoginID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userProfileID` bigint(20) NOT NULL,
  `sessionID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `userAgent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`userLoginID`),
  KEY `userProfileID` (`userProfileID`),
  CONSTRAINT `userLogin_ibfk_1` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=292167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userOrcid`
--

DROP TABLE IF EXISTS `userOrcid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userOrcid` (
  `userProfileID` bigint(20) NOT NULL,
  `orcid` varchar(25) COLLATE utf8_bin NOT NULL,
  `accessToken` varchar(50) COLLATE utf8_bin NOT NULL,
  `refreshToken` varchar(50) COLLATE utf8_bin NOT NULL,
  `tokenScope` varchar(100) COLLATE utf8_bin NOT NULL,
  `tokenExpires` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`userProfileID`),
  UNIQUE KEY `orcid` (`orcid`),
  CONSTRAINT `userOrcid_ibfk_1` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userProfile`
--

DROP TABLE IF EXISTS `userProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userProfile` (
  `userProfileID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userProfileURI` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `authId` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `realName` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `givenNames` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `surName` varchar(65) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `homePage` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `weblog` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `publications` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `positionType` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `organizationName` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `organizationType` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `organizationVisibility` tinyint(1) NOT NULL DEFAULT '0',
  `postalAddress` text CHARACTER SET utf8 COLLATE utf8_bin,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `biography` text CHARACTER SET utf8 COLLATE utf8_bin,
  `interests` text CHARACTER SET utf8 COLLATE utf8_bin,
  `researchAreas` text CHARACTER SET utf8 COLLATE utf8_bin,
  `alertsJournals` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `passwordReset` bit(1) NOT NULL DEFAULT b'0',
  `verificationToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `verified` bit(1) NOT NULL DEFAULT b'1',
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`userProfileID`),
  UNIQUE KEY `userProfileURI` (`userProfileURI`),
  UNIQUE KEY `authId` (`authId`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `displayName` (`displayName`)
) ENGINE=InnoDB AUTO_INCREMENT=432577 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userProfileMetaData`
--

DROP TABLE IF EXISTS `userProfileMetaData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userProfileMetaData` (
  `userProfileMetaDataID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userProfileID` bigint(20) NOT NULL,
  `metaKey` varchar(50) COLLATE utf8_bin NOT NULL,
  `metaValue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastModified` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`userProfileMetaDataID`),
  UNIQUE KEY `userProfileID` (`userProfileID`,`metaKey`),
  KEY `metaKey` (`metaKey`),
  CONSTRAINT `userProfileMetaData_ibfk_1` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=53209 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userProfileRoleJoinTable`
--

DROP TABLE IF EXISTS `userProfileRoleJoinTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userProfileRoleJoinTable` (
  `userRoleID` bigint(20) NOT NULL,
  `userProfileID` bigint(20) NOT NULL,
  PRIMARY KEY (`userRoleID`,`userProfileID`),
  KEY `userProfileID` (`userProfileID`),
  CONSTRAINT `userProfileRoleJoinTable_ibfk_1` FOREIGN KEY (`userRoleID`) REFERENCES `userRole` (`userRoleID`),
  CONSTRAINT `userProfileRoleJoinTable_ibfk_2` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userRole`
--

DROP TABLE IF EXISTS `userRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRole` (
  `userRoleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`userRoleID`),
  UNIQUE KEY `roleName` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userRolePermission`
--

DROP TABLE IF EXISTS `userRolePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRolePermission` (
  `userRoleID` bigint(20) NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`userRoleID`,`permission`),
  CONSTRAINT `userRolePermission_ibfk_1` FOREIGN KEY (`userRoleID`) REFERENCES `userRole` (`userRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userSearch`
--

DROP TABLE IF EXISTS `userSearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSearch` (
  `userSearchID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userProfileID` bigint(20) NOT NULL,
  `searchTerms` text CHARACTER SET utf8 COLLATE utf8_bin,
  `searchString` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created` datetime NOT NULL,
  PRIMARY KEY (`userSearchID`),
  KEY `userProfileID` (`userProfileID`),
  CONSTRAINT `userSearch_ibfk_1` FOREIGN KEY (`userProfileID`) REFERENCES `userProfile` (`userProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=195384 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `volume`
--

DROP TABLE IF EXISTS `volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume` (
  `volumeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `volumeUri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `journalID` bigint(20) DEFAULT NULL,
  `journalSortOrder` int(11) DEFAULT NULL,
  `displayName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `imageUri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`volumeID`),
  UNIQUE KEY `volumeUri` (`volumeUri`),
  KEY `journalID` (`journalID`),
  CONSTRAINT `volume_ibfk_1` FOREIGN KEY (`journalID`) REFERENCES `journal` (`journalID`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-09 11:48:26
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-09 11:48:26
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
-- Table structure for table `userRole`
--

DROP TABLE IF EXISTS `userRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRole` (
  `userRoleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`userRoleID`),
  UNIQUE KEY `roleName` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userRole`
--

LOCK TABLES `userRole` WRITE;
/*!40000 ALTER TABLE `userRole` DISABLE KEYS */;
INSERT INTO `userRole` VALUES (1,'Admin','2012-03-08 18:21:48','2013-06-12 11:21:39'),(3,'Production','2012-07-17 18:37:26','2012-07-17 18:37:26'),(5,'Editorial','2012-07-17 18:37:26','2013-09-18 12:52:01'),(7,'Beta tester','2013-06-12 11:21:16','2013-06-12 11:21:24'),(9,'AE-PLOSONE','2014-04-01 22:33:21','2014-04-01 22:33:21'),(11,'Manage Users','2014-04-02 13:41:58','2014-04-18 15:12:46'),(12,'TEST_THESAURUS','2014-08-13 14:02:44','2014-08-13 15:01:44');
/*!40000 ALTER TABLE `userRole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-09 11:48:26
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
-- Table structure for table `userRolePermission`
--

DROP TABLE IF EXISTS `userRolePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRolePermission` (
  `userRoleID` bigint(20) NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`userRoleID`,`permission`),
  CONSTRAINT `userRolePermission_ibfk_1` FOREIGN KEY (`userRoleID`) REFERENCES `userRole` (`userRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userRolePermission`
--

LOCK TABLES `userRolePermission` WRITE;
/*!40000 ALTER TABLE `userRolePermission` DISABLE KEYS */;
INSERT INTO `userRolePermission` VALUES (1,'ACCESS_ADMIN'),(1,'BETA_FEATURES'),(1,'CROSS_PUB_ARTICLES'),(1,'DELETE_ARTICLES'),(1,'INGEST_ARTICLE'),(1,'MANAGE_ANNOTATIONS'),(1,'MANAGE_ARTICLE_LISTS'),(1,'MANAGE_CACHES'),(1,'MANAGE_CORRECTIONS'),(1,'MANAGE_FEATURED_ARTICLES'),(1,'MANAGE_FLAGS'),(1,'MANAGE_JOURNALS'),(1,'MANAGE_ROLES'),(1,'MANAGE_SEARCH'),(1,'MANAGE_USERS'),(1,'RESEND_EMAIL_ALERTS'),(1,'VIEW_UNPUBBED_ARTICLES'),(3,'ACCESS_ADMIN'),(3,'CROSS_PUB_ARTICLES'),(3,'DELETE_ARTICLES'),(3,'INGEST_ARTICLE'),(3,'MANAGE_ANNOTATIONS'),(3,'MANAGE_CACHES'),(3,'MANAGE_FLAGS'),(3,'MANAGE_JOURNALS'),(3,'MANAGE_SEARCH'),(3,'MANAGE_USERS'),(3,'VIEW_UNPUBBED_ARTICLES'),(5,'ACCESS_ADMIN'),(5,'MANAGE_ARTICLE_LISTS'),(5,'MANAGE_FEATURED_ARTICLES'),(5,'VIEW_UNPUBBED_ARTICLES'),(7,'BETA_FEATURES'),(11,'ACCESS_ADMIN'),(11,'MANAGE_ROLES'),(11,'MANAGE_USERS'),(12,'TEST_THESAURUS');
/*!40000 ALTER TABLE `userRolePermission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-09 11:48:26
