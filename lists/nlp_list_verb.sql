-- MySQL dump 10.13  Distrib 5.7.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thrakien_d_202305
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.7-MariaDB

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
-- Table structure for table `nlp_list_verb`
--

DROP TABLE IF EXISTS `nlp_list_verb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlp_list_verb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternativenames_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternativenames_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlp_list_verb`
--

LOCK TABLES `nlp_list_verb` WRITE;
/*!40000 ALTER TABLE `nlp_list_verb` DISABLE KEYS */;
INSERT INTO `nlp_list_verb` VALUES (1,'holding','halten',' ploughing,  removing, covering,  containing,  brandishing,  carrying,  forming,  raising,  cradling,  touching,  drawing',' erhebend,  fassend,  ausgießend,  festhalten,  ausgestreckt,  würgend,  ziehend,  spannend,  hängt,  drückend,  stemmend,  schwingend,  ausholend,  entfernend,  herführend,  schleudernd,  spielend, tragend, schulternd','https://www.wikidata.org/wiki/Q108951109'),(2,'seated_on','sitzen',' seated,  throning,  galloping,  riding_on,  sitting,  galopping, riding',' thronend,  galopierend,  reitend,  setzend,  gallopierend','https://www.wikidata.org/wiki/Q1144593'),(3,'resting_on','stützen','reclining,  reclining_on,  setting,  leaning,  leaning_on,  resting',' lagernd,  aufgestützt,  liegend,  lehnend,  abstützend','https://www.wikidata.org/wiki/Q17554390'),(4,'feeding','füttern',NULL,NULL,'https://www.wikidata.org/wiki/Q17550579'),(5,'standing','stehen',NULL,' fahrend,  tretend','https://www.wikidata.org/wiki/Q1986098'),(6,'coiling','winden',' curling, creeping',' ringelnd,  umwunden,  emporringelnd, umschlingen, umschlingend','https://www.wikidata.org/wiki/Q770007'),(7,'lying','liegen',NULL,NULL,'https://www.wikidata.org/wiki/Q2268776'),(8,'advancing','schreiten',' walking,  passing, running',' laufen','http://www.dbis.cs.uni-frankfurt.de/cnt/id/advancing'),(9,'swimming','schwimmen',NULL,NULL,'https://www.wikidata.org/wiki/Q6388'),(10,'extending','strecken',NULL,' vorstrecken,  hervorstreckend,  hervorgestreckt','http://www.dbis.cs.uni-frankfurt.de/cnt/id/extending'),(11,'receiving','empfangen',NULL,NULL,'https://www.wikidata.org/wiki/Q115088817'),(12,'prancing','springen','leaping, jumping',NULL,'https://www.wikidata.org/wiki/Q97331354'),(13,'flying','fliegen',NULL,NULL,'https://www.wikidata.org/wiki/Q206021'),(14,'releasing','befreit',NULL,'befreien?','https://www.wikidata.org/wiki/Q110560444'),(15,'crowning','bekränzen',NULL,NULL,'http://www.dbis.cs.uni-frankfurt.de/cnt/id/crowning'),(16,'grasping','packen','clasping, pushing',' fassen,  würgen','https://www.wikidata.org/wiki/Q5597405'),(17,'kneeling','knien','scooping',' geduckt','https://www.wikidata.org/wiki/Q8866546'),(18,'crossing','kreuzen',NULL,NULL,'http://www.dbis.cs.uni-frankfurt.de/cnt/id/crossing'),(19,'breaking','brechen',NULL,NULL,'https://www.wikidata.org/wiki/Q992067'),(20,'turning','drehen',NULL,NULL,'http://www.dbis.cs.uni-frankfurt.de/cnt/id/turning'),(21,'sailing',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q192520'),(22,'escorted by',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q3821546'),(23,'wearing',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q13128864');
/*!40000 ALTER TABLE `nlp_list_verb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-04 11:08:07
