CREATE DATABASE  IF NOT EXISTS `assignment` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `assignment`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `ChatId` bigint(20) NOT NULL AUTO_INCREMENT,
  `FromProfileId` bigint(20) NOT NULL,
  `ToProfileId` bigint(20) NOT NULL,
  `Message` text NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '[1 - Not Yet Viewed, 2 - Viewed]',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ChatId`),
  UNIQUE KEY `ChatId_UNIQUE` (`ChatId`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coursestudent`
--

DROP TABLE IF EXISTS `coursestudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursestudent` (
  `CourseStudentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `RegId` varchar(45) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `TeamName` varchar(100) DEFAULT NULL,
  `Member1` varchar(100) DEFAULT NULL,
  `Name1` varchar(100) DEFAULT NULL,
  `Member2` varchar(100) DEFAULT NULL,
  `Name2` varchar(100) DEFAULT NULL,
  `Member3` varchar(100) DEFAULT NULL,
  `Name3` varchar(100) DEFAULT NULL,
  `Member4` varchar(100) DEFAULT NULL,
  `Name4` varchar(100) DEFAULT NULL,
  `IsActive` smallint(4) NOT NULL DEFAULT '1',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CourseStudentId`),
  UNIQUE KEY `CourseStudentId_UNIQUE` (`CourseStudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `ForumId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProfileId` varchar(50) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Message` text,
  `FileName` varchar(500) DEFAULT '0',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '[1 - Post Not yet Approved, 2 - Approved]',
  `IsActive` tinyint(4) NOT NULL DEFAULT '1' COMMENT '[1 - Active, 0 - In Active]',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ForumId`),
  UNIQUE KEY `ForumId_UNIQUE` (`ForumId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import`
--

DROP TABLE IF EXISTS `import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import` (
  `ImportId` bigint(20) NOT NULL AUTO_INCREMENT,
  `RegId` varchar(45) DEFAULT NULL,
  `Fullname` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ImportId`),
  UNIQUE KEY `ImportId_UNIQUE` (`ImportId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `master`
--

DROP TABLE IF EXISTS `master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master` (
  `MasterId` bigint(20) NOT NULL AUTO_INCREMENT,
  `RegId` varchar(45) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `IsActive` smallint(4) NOT NULL DEFAULT '1',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MasterId`),
  UNIQUE KEY `MasterId_UNIQUE` (`MasterId`),
  UNIQUE KEY `RegId_UNIQUE` (`RegId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `ProfileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `RegId` varchar(45) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Mobile` bigint(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Course` varchar(100) DEFAULT NULL,
  `Year` varchar(100) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `TeamName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '3' COMMENT '[1 - Master, 2 - Research Student, 3 - Course Student]',
  `IsActive` tinyint(4) NOT NULL DEFAULT '1' COMMENT '[1 - Active, 0 - In Active]',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProfileId`),
  UNIQUE KEY `ProfileId_UNIQUE` (`ProfileId`),
  UNIQUE KEY `RegId_UNIQUE` (`RegId`),
  UNIQUE KEY `Mobile_UNIQUE` (`Mobile`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `researchstudent`
--

DROP TABLE IF EXISTS `researchstudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `researchstudent` (
  `ResearchStudentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `RegId` varchar(45) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Course` varchar(500) DEFAULT NULL,
  `Year` varchar(10) DEFAULT NULL,
  `IsActive` smallint(4) NOT NULL DEFAULT '1',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ResearchStudentId`),
  UNIQUE KEY `ResearchStudentId_UNIQUE` (`ResearchStudentId`),
  UNIQUE KEY `RegId_UNIQUE` (`RegId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-25 14:17:14

ALTER TABLE `assignment`.`chat` 
ADD COLUMN `Image` VARCHAR(250) NULL AFTER `Message`;

INSERT INTO 
assignment.master 
VALUES(12345,1234,'master','admin','','master@usq.com','master',1,now(),null)
