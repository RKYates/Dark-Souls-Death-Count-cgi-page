CREATE DATABASE  IF NOT EXISTS `darksoulsdeaths` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `darksoulsdeaths`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: darksoulsdeaths
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Temporary table structure for view `adppcounts`
--

DROP TABLE IF EXISTS `adppcounts`;
/*!50001 DROP VIEW IF EXISTS `adppcounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `adppcounts` (
  `adppRange` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `playerid` varchar(36) NOT NULL,
  `charactername` varchar(13) NOT NULL,
  `deaths` int(11) DEFAULT NULL,
  `playthrough` int(11) DEFAULT NULL,
  `progress` decimal(3,2) DEFAULT NULL,
  `shitholes` bit(1) DEFAULT NULL,
  `dragonbros` bit(1) DEFAULT NULL,
  `asylum` bit(1) DEFAULT NULL,
  `paintedworld` bit(1) DEFAULT NULL,
  `manus` bit(1) DEFAULT NULL,
  `smornstein` int(11) DEFAULT NULL,
  `adpp` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerid`,`charactername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES ('06d1263a-9872-4bb7-93bf-eafbcd411ae1','Axe',75,1,0.60,'','\0','','\0','\0',15,47),('285c4440-c331-411e-bf66-52efd0bde453','Axe',75,1,0.60,'','\0','','\0','\0',15,47),('2c2edf3b-4e4f-43ae-8c1f-aa8c20e7c7ad','Sandy',68,0,0.40,'','\0','','\0','\0',8,170),('3a777ecf-8781-4067-8de4-480aaaca32f4','Gordon',150,1,0.00,'','\0','','','',2,150),('482e0e65-5c50-4eaa-ab9a-eefd95138fa2','Axe',75,0,0.90,'','','','','',14,79),('526ba292-c95c-4952-99d3-60c4ea268713','Jimbo',22,0,0.50,'','\0','','\0','\0',15,44),('57bd1a10-9534-42fa-98e7-b0d18ce2100d','Plink',20,0,0.40,'','\0','\0','\0','\0',17,50),('6966daaf-1aad-48c9-b862-5671daf685ee','Gordon',150,0,0.90,'','\0','','','',2,158),('79f95981-8f2e-4987-8475-2bc53e4940d3','Axe',75,0,0.90,'','','','','',14,79),('8a4280ef-706b-4de7-b720-93ad1974ba5e','Sandy',82,0,0.50,'','\0','','\0','\0',7,164),('9ddafe21-a869-4026-9e05-63b7fe48f811','Plink',20,0,0.40,'','\0','\0','\0','\0',8,50),('a0ec0718-8ef1-4d4f-89a1-4e614d1004d3','Jimbo',10,0,0.10,'\0','\0','\0','\0','\0',8,200),('b51f5246-edc3-4fb5-aa2d-137b87075328','Axe',75,1,0.60,'','\0','','\0','\0',1,47),('dummychar0','dum0',250,1,0.90,'','','','','',1,129),('dummychar1','dum1',164,4,0.10,'\0','\0','\0','\0','\0',1,40),('dummychar10','dum10',86,0,0.70,'','\0','\0','\0','\0',2,119),('dummychar11','dum11',212,3,0.30,'','\0','\0','\0','\0',3,63),('dummychar12','dum12',315,2,0.60,'','\0','\0','\0','\0',3,120),('dummychar13','dum13',122,1,0.70,'','\0','\0','\0','\0',3,71),('dummychar14','dum14',224,5,0.80,'','','','','\0',3,38),('dummychar15','dum15',229,2,0.00,'\0','\0','\0','\0','\0',3,112),('dummychar16','dum16',147,1,0.60,'','\0','\0','\0','\0',4,90),('dummychar17','dum17',198,2,0.20,'\0','\0','\0','\0','\0',4,90),('dummychar18','dum18',206,3,0.30,'\0','\0','\0','\0','\0',4,63),('dummychar19','dum19',86,0,0.50,'','\0','\0','\0','\0',4,157),('dummychar2','dum2',174,1,0.50,'','\0','\0','\0','\0',1,114),('dummychar20','dum20',131,0,0.80,'','','','','',4,139),('dummychar21','dum21',221,1,0.50,'','\0','\0','\0','\0',4,145),('dummychar22','dum22',260,1,0.40,'','\0','\0','\0','\0',4,185),('dummychar23','dum23',161,1,0.30,'','\0','\0','\0','\0',4,122),('dummychar24','dum24',305,1,0.60,'','\0','\0','\0','\0',4,186),('dummychar25','dum25',261,9,0.30,'','\0','\0','\0','\0',4,28),('dummychar26','dum26',182,2,0.20,'\0','\0','\0','\0','\0',4,82),('dummychar27','dum27',103,1,0.10,'\0','\0','\0','\0','\0',4,91),('dummychar28','dum28',225,2,0.00,'\0','\0','\0','\0','\0',4,111),('dummychar29','dum29',86,1,0.80,'','','','','\0',5,46),('dummychar3','dum3',67,0,0.80,'','','','\0','\0',1,81),('dummychar30','dum30',121,1,0.20,'\0','\0','\0','\0','\0',5,103),('dummychar31','dum31',84,0,0.90,'','','','','',5,86),('dummychar32','dum32',168,1,0.20,'\0','\0','\0','\0','\0',6,130),('dummychar33','dum33',82,0,0.70,'','\0','\0','\0','\0',6,123),('dummychar34','dum34',156,1,0.10,'\0','\0','\0','\0','\0',6,140),('dummychar35','dum35',151,1,0.20,'\0','\0','\0','\0','\0',6,129),('dummychar36','dum36',265,3,0.20,'\0','\0','\0','\0','\0',6,83),('dummychar37','dum37',232,1,0.90,'','','','','',6,118),('dummychar38','dum38',208,1,0.40,'','\0','\0','\0','\0',6,141),('dummychar39','dum39',253,2,0.30,'','\0','\0','\0','\0',6,108),('dummychar4','dum4',300,3,0.20,'\0','\0','\0','\0','\0',1,91),('dummychar40','dum40',99,0,0.80,'','\0','','\0','\0',7,130),('dummychar41','dum41',124,0,0.70,'','\0','\0','\0','\0',7,184),('dummychar42','dum42',194,1,0.90,'','','','','',7,98),('dummychar43','dum43',229,1,0.70,'','\0','\0','\0','\0',7,137),('dummychar44','dum44',211,2,0.30,'','\0','\0','\0','\0',7,88),('dummychar45','dum45',115,0,0.70,'','\0','\0','\0','\0',7,155),('dummychar46','dum46',153,1,0.10,'\0','\0','\0','\0','\0',7,139),('dummychar47','dum47',137,0,0.90,'','','','','',7,147),('dummychar48','dum48',197,1,0.60,'','\0','\0','\0','\0',7,124),('dummychar49','dum49',252,1,0.80,'','','','','\0',8,134),('dummychar5','dum5',126,1,0.80,'','','','\0','\0',1,69),('dummychar50','dum50',233,1,0.80,'','\0','','\0','\0',8,131),('dummychar51','dum51',168,0,0.80,'','','','','',8,179),('dummychar52','dum52',50,0,0.20,'\0','\0','\0','\0','\0',8,167),('dummychar53','dum53',103,1,0.10,'\0','\0','\0','\0','\0',8,97),('dummychar54','dum54',276,2,0.20,'\0','\0','\0','\0','\0',9,127),('dummychar55','dum55',231,1,0.80,'','','','','\0',9,124),('dummychar56','dum56',45,0,0.30,'','\0','\0','\0','\0',10,135),('dummychar57','dum57',228,1,0.80,'','','','','\0',10,123),('dummychar58','dum58',194,1,0.80,'','','','','\0',10,103),('dummychar59','dum59',156,1,0.40,'','\0','\0','\0','\0',10,113),('dummychar6','dum6',334,2,0.80,'','','','','',1,115),('dummychar60','dum60',208,1,0.80,'','','','\0','\0',11,115),('dummychar61','dum61',293,2,0.40,'','\0','\0','\0','\0',13,120),('dummychar62','dum62',164,1,0.60,'','\0','\0','\0','\0',13,101),('dummychar63','dum63',157,2,0.80,'','','','','\0',14,55),('dummychar64','dum64',135,0,0.80,'','','','','\0',14,155),('dummychar65','dum65',256,2,0.30,'','\0','\0','\0','\0',14,111),('dummychar66','dum66',132,1,0.20,'\0','\0','\0','\0','\0',14,111),('dummychar67','dum67',250,2,0.00,'\0','\0','\0','\0','\0',14,124),('dummychar68','dum68',126,0,0.80,'','','','\0','\0',14,151),('dummychar69','dum69',31,0,0.40,'','\0','\0','\0','\0',14,84),('dummychar7','dum7',134,1,0.30,'\0','\0','\0','\0','\0',1,107),('dummychar70','dum70',208,1,0.60,'','\0','\0','\0','\0',14,132),('dummychar71','dum71',102,1,0.10,'\0','\0','\0','\0','\0',14,92),('dummychar72','dum72',92,0,0.70,'','\0','\0','\0','\0',14,136),('dummychar73','dum73',191,1,0.80,'','\0','','\0','\0',14,108),('dummychar74','dum74',144,1,0.80,'','','','','',14,75),('dummychar75','dum75',314,2,0.90,'','','','','',14,105),('dummychar76','dum76',199,1,0.30,'','\0','\0','\0','\0',14,147),('dummychar77','dum77',319,3,0.20,'\0','\0','\0','\0','\0',14,98),('dummychar78','dum78',115,1,0.60,'','\0','\0','\0','\0',14,70),('dummychar79','dum79',134,1,0.10,'\0','\0','\0','\0','\0',14,122),('dummychar8','dum8',284,2,0.00,'\0','\0','\0','\0','\0',1,142),('dummychar80','dum80',76,0,0.40,'','\0','\0','\0','\0',14,204),('dummychar81','dum81',188,4,0.80,'','','','\0','\0',14,39),('dummychar82','dum82',42,0,0.50,'','\0','\0','\0','\0',14,78),('dummychar83','dum83',214,2,0.30,'\0','\0','\0','\0','\0',15,94),('dummychar84','dum84',274,1,0.20,'\0','\0','\0','\0','\0',15,223),('dummychar85','dum85',216,2,0.10,'\0','\0','\0','\0','\0',15,105),('dummychar86','dum86',176,1,0.70,'','\0','','\0','\0',17,99),('dummychar87','dum87',277,2,0.70,'','\0','\0','\0','\0',17,104),('dummychar88','dum88',371,4,0.20,'\0','\0','\0','\0','\0',17,88),('dummychar89','dum89',129,1,0.80,'','','','\0','\0',17,71),('dummychar9','dum9',191,1,0.80,'','','','\0','\0',2,106),('dummychar90','dum90',111,0,0.70,'','\0','\0','\0','\0',17,156),('dummychar91','dum91',39,0,0.20,'\0','\0','\0','\0','\0',18,175),('dummychar92','dum92',170,1,0.50,'','\0','\0','\0','\0',19,110),('dummychar93','dum93',139,1,0.20,'\0','\0','\0','\0','\0',19,112),('dummychar94','dum94',68,0,0.80,'','','','','\0',19,76),('dummychar95','dum95',213,1,0.70,'','\0','\0','\0','\0',19,125),('dummychar96','dum96',196,1,0.70,'','\0','','\0','\0',19,112),('dummychar97','dum97',207,1,0.80,'','','','','\0',19,111),('dummychar98','dum98',213,2,0.70,'','\0','\0','\0','\0',19,79),('dummychar99','dum99',6,0,0.10,'\0','\0','\0','\0','\0',19,92),('e036682a-567a-4db1-a66f-f8a83d850eef','Axe',75,1,0.60,'','\0','','\0','\0',15,47),('e1de323b-e7f7-47cd-bf7f-53f5234689c3','Jimbo',18,0,0.30,'','\0','','\0','\0',15,60),('f22565dd-094d-4229-9d35-2d4c43df0d7c','Jimbo',10,0,0.10,'\0','\0','\0','\0','\0',8,200),('fb07d343-7809-45e4-93a5-4e669d3f5b9d','Axe',75,1,0.60,'','\0','','\0','\0',15,47);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `deathcounts`
--

DROP TABLE IF EXISTS `deathcounts`;
/*!50001 DROP VIEW IF EXISTS `deathcounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `deathcounts` (
  `deathRange` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `optionalareas`
--

DROP TABLE IF EXISTS `optionalareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optionalareas` (
  `optionalareasid` int(11) NOT NULL,
  `optionalareasname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`optionalareasid`),
  UNIQUE KEY `optionalareasid_UNIQUE` (`optionalareasid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionalareas`
--

LOCK TABLES `optionalareas` WRITE;
/*!40000 ALTER TABLE `optionalareas` DISABLE KEYS */;
INSERT INTO `optionalareas` VALUES (0,'Lower Undead Burg/Depths'),(1,'Great Hollow/Ash Lake'),(2,'Undead Asylum (2nd visit)'),(3,'Painted World of Ariamis'),(4,'Additional Content (beat Manus)');
/*!40000 ALTER TABLE `optionalareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `optionalcounts`
--

DROP TABLE IF EXISTS `optionalcounts`;
/*!50001 DROP VIEW IF EXISTS `optionalcounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `optionalcounts` (
  `optionalareasname` tinyint NOT NULL,
  `percentage` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `playthrough`
--

DROP TABLE IF EXISTS `playthrough`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playthrough` (
  `playthroughid` int(11) NOT NULL,
  `playthroughstring` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`playthroughid`),
  UNIQUE KEY `playthroughid_UNIQUE` (`playthroughid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playthrough`
--

LOCK TABLES `playthrough` WRITE;
/*!40000 ALTER TABLE `playthrough` DISABLE KEYS */;
INSERT INTO `playthrough` VALUES (0,'None'),(1,'New game'),(2,'New game +'),(3,'New game +2'),(4,'New game +3'),(5,'New game +4'),(6,'New game +5'),(7,'New game +6'),(8,'I have beaten NG+7 or higher.  Please send help.');
/*!40000 ALTER TABLE `playthrough` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `playthroughcounts`
--

DROP TABLE IF EXISTS `playthroughcounts`;
/*!50001 DROP VIEW IF EXISTS `playthroughcounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `playthroughcounts` (
  `playthrough beaten` tinyint NOT NULL,
  `percentage` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progress` (
  `progressid` int(11) NOT NULL,
  `progressname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`progressid`),
  UNIQUE KEY `progressid_UNIQUE` (`progressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (0,'None'),(1,'Undead Asylum'),(2,'1st Bell (Undead Parish)'),(3,'2nd Bell (Quelaag\'s Domain)'),(4,'Sen\'s Fortress'),(5,'Anor Londo'),(6,'1/4 Lord Souls (Seath/Nito/etc.)'),(7,'2/4 Lord Souls'),(8,'3/4 Lord Souls'),(9,'4/4 Lord Souls');
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `progresscounts`
--

DROP TABLE IF EXISTS `progresscounts`;
/*!50001 DROP VIEW IF EXISTS `progresscounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `progresscounts` (
  `progress` tinyint NOT NULL,
  `percentage` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `smornstein`
--

DROP TABLE IF EXISTS `smornstein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smornstein` (
  `smornsteinid` int(11) NOT NULL,
  `smornsteinname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`smornsteinid`),
  UNIQUE KEY `smornsteinid_UNIQUE` (`smornsteinid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smornstein`
--

LOCK TABLES `smornstein` WRITE;
/*!40000 ALTER TABLE `smornstein` DISABLE KEYS */;
INSERT INTO `smornstein` VALUES (0,'None'),(1,'Anor Londo Attorneys'),(2,'Asterix & Obelix'),(3,'Atlas & P-body'),(4,'Biggie Smalls'),(5,'Fatboy Slim'),(6,'Fatman & Robin'),(7,'Fuck This I Quit'),(8,'James and the Giant Peach'),(9,'Jay & Silent Bob'),(10,'Jonah and the Whale'),(11,'Knight and the Round Table'),(12,'Laurel & Hardy'),(13,'Penn & Teller'),(14,'Pikachu & Snorlax'),(15,'Ren & Stimpy'),(16,'Spade & Farley'),(17,'Super Londo Bros'),(18,'Thunder & Thighs'),(19,'Timon & Pumba');
/*!40000 ALTER TABLE `smornstein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `smornsteincounts`
--

DROP TABLE IF EXISTS `smornsteincounts`;
/*!50001 DROP VIEW IF EXISTS `smornsteincounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `smornsteincounts` (
  `smornsteinname` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `adppcounts`
--

/*!50001 DROP TABLE IF EXISTS `adppcounts`*/;
/*!50001 DROP VIEW IF EXISTS `adppcounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adppcounts` AS select (case when (`characters`.`adpp` between 0 and 25) then '000-025' when (`characters`.`adpp` between 26 and 50) then '026-050' when (`characters`.`adpp` between 51 and 75) then '051-075' when (`characters`.`adpp` between 76 and 100) then '076-100' when (`characters`.`adpp` between 101 and 125) then '101-125' when (`characters`.`adpp` between 126 and 150) then '126-150' when (`characters`.`adpp` between 151 and 175) then '151-175' when (`characters`.`adpp` between 176 and 200) then '176-200' when (`characters`.`adpp` between 201 and 225) then '201-225' when (`characters`.`adpp` between 226 and 250) then '226-250' when (`characters`.`adpp` between 251 and 275) then '251-275' when (`characters`.`adpp` between 276 and 300) then '276-300' when (`characters`.`adpp` between 301 and 325) then '301-325' when (`characters`.`adpp` between 326 and 350) then '326-350' when (`characters`.`adpp` between 351 and 375) then '351-375' when (`characters`.`adpp` between 376 and 400) then '376-400' when (`characters`.`adpp` between 401 and 425) then '401-425' when (`characters`.`adpp` between 426 and 450) then '426-450' when (`characters`.`adpp` between 451 and 475) then '451-475' when (`characters`.`adpp` between 476 and 499) then '476-499' when (`characters`.`adpp` >= 500) then '500+' end) AS `adppRange`,count(0) AS `count` from `characters` group by 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `deathcounts`
--

/*!50001 DROP TABLE IF EXISTS `deathcounts`*/;
/*!50001 DROP VIEW IF EXISTS `deathcounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `deathcounts` AS select (case when (`characters`.`deaths` between 0 and 25) then '000-025' when (`characters`.`deaths` between 26 and 50) then '026-050' when (`characters`.`deaths` between 51 and 75) then '051-075' when (`characters`.`deaths` between 76 and 100) then '076-100' when (`characters`.`deaths` between 101 and 125) then '101-125' when (`characters`.`deaths` between 126 and 150) then '126-150' when (`characters`.`deaths` between 151 and 175) then '151-175' when (`characters`.`deaths` between 176 and 200) then '176-200' when (`characters`.`deaths` between 201 and 225) then '201-225' when (`characters`.`deaths` between 226 and 250) then '226-250' when (`characters`.`deaths` between 251 and 275) then '251-275' when (`characters`.`deaths` between 276 and 300) then '276-300' when (`characters`.`deaths` between 301 and 325) then '301-325' when (`characters`.`deaths` between 326 and 350) then '326-350' when (`characters`.`deaths` between 351 and 375) then '351-375' when (`characters`.`deaths` between 376 and 400) then '376-400' when (`characters`.`deaths` between 401 and 425) then '401-425' when (`characters`.`deaths` between 426 and 450) then '426-450' when (`characters`.`deaths` between 451 and 475) then '451-475' when (`characters`.`deaths` between 476 and 499) then '476-499' when (`characters`.`deaths` >= 500) then '500+' end) AS `deathRange`,count(0) AS `count` from `characters` group by 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `optionalcounts`
--

/*!50001 DROP TABLE IF EXISTS `optionalcounts`*/;
/*!50001 DROP VIEW IF EXISTS `optionalcounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `optionalcounts` AS select `o`.`optionalareasname` AS `optionalareasname`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from (`characters` `c` join `optionalareas` `o` on(((`c`.`shitholes` = 1) and (`o`.`optionalareasid` = 0)))) union select `o`.`optionalareasname` AS `optionalareasname`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from (`characters` `c` join `optionalareas` `o` on(((`c`.`dragonbros` = 1) and (`o`.`optionalareasid` = 1)))) union select `o`.`optionalareasname` AS `optionalareasname`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from (`characters` `c` join `optionalareas` `o` on(((`c`.`asylum` = 1) and (`o`.`optionalareasid` = 2)))) union select `o`.`optionalareasname` AS `optionalareasname`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from (`characters` `c` join `optionalareas` `o` on(((`c`.`paintedworld` = 1) and (`o`.`optionalareasid` = 3)))) union select `o`.`optionalareasname` AS `optionalareasname`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from (`characters` `c` join `optionalareas` `o` on(((`c`.`manus` = 1) and (`o`.`optionalareasid` = 4)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `playthroughcounts`
--

/*!50001 DROP TABLE IF EXISTS `playthroughcounts`*/;
/*!50001 DROP VIEW IF EXISTS `playthroughcounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `playthroughcounts` AS select 0 AS `playthrough beaten`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`playthrough` >= 1) union select 1 AS `playthrough beaten`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`playthrough` >= 2) union select 2 AS `playthrough beaten`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`playthrough` >= 3) union select 3 AS `playthrough beaten`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`playthrough` >= 4) union select 4 AS `playthrough beaten`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`playthrough` >= 5) union select 5 AS `playthrough beaten`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`playthrough` >= 6) union select 6 AS `playthrough beaten`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`playthrough` >= 7) union select 7 AS `playthrough beaten`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`playthrough` = 8) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `progresscounts`
--

/*!50001 DROP TABLE IF EXISTS `progresscounts`*/;
/*!50001 DROP VIEW IF EXISTS `progresscounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `progresscounts` AS select 0 AS `progress`,100 AS `percentage` union select 1 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` >= 0.1) union select 2 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` >= 0.2) union select 3 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` >= 0.3) union select 4 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` >= 0.4) union select 5 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` >= 0.5) union select 6 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` >= 0.6) union select 7 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` >= 0.7) union select 8 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` >= 0.8) union select 9 AS `progress`,round(((count(0) / (select count(0) from `characters`)) * 100),0) AS `percentage` from `characters` `c` where (`c`.`progress` = 0.9) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `smornsteincounts`
--

/*!50001 DROP TABLE IF EXISTS `smornsteincounts`*/;
/*!50001 DROP VIEW IF EXISTS `smornsteincounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `smornsteincounts` AS select `s`.`smornsteinname` AS `smornsteinname`,count(0) AS `count` from (`characters` `c` join `smornstein` `s` on((`c`.`smornstein` = `s`.`smornsteinid`))) group by `c`.`smornstein` order by count(0) desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-23 23:07:02
