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
-- Table structure for table `nlp_list_plant`
--

DROP TABLE IF EXISTS `nlp_list_plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlp_list_plant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternativenames_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternativenames_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typos_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typos_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cat_I` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cat_II` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlp_list_plant`
--

LOCK TABLES `nlp_list_plant` WRITE;
/*!40000 ALTER TABLE `nlp_list_plant` DISABLE KEYS */;
INSERT INTO `nlp_list_plant` VALUES (1,'apple','Apfel',NULL,'apples',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q89','Fruit',NULL),(2,'barley','Gerste',NULL,NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q61665121','Cereal-Grain',NULL),(3,'berry','Beere',NULL,'berries',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q13184','Fruit',NULL),(4,'branch','Ast',NULL,'branches',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q2923673','Branches','PlantsParts'),(5,'cloverleaf','Kleeblatt',NULL,'cloverleaves',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q101538','Herb','PlantsParts'),(6,'conifer','Nadelbaum',NULL,'confers',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q132825','Tree',NULL),(7,'corn','Mais',NULL,'ears of corn',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q11575','Cereal-Grain',NULL),(8,'ear','Ähre',NULL,'ears','Kornähre, Kornpflanze',NULL,NULL,'https://www.wikidata.org/wiki/Q147398','Cereal-Grain',NULL),(9,'flower','Blume',NULL,'flowers',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q886167','Flower',NULL),(10,'fruit','Obst',NULL,'fruits','Frucht',NULL,NULL,'https://www.wikidata.org/wiki/Q3314483','Fruit','PlantsParts'),(11,'grain','Korn',NULL,'grain ear, grains','Getreide',NULL,NULL,'https://www.wikidata.org/wiki/Q2995529','Cereal-Grain',NULL),(12,'grape','Traube',NULL,'grapes','Weintraube',NULL,NULL,'https://www.wikidata.org/wiki/Q10978','Fruit',NULL),(13,'ivy','Efeu',NULL,NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q26771','Bush',NULL),(14,'laurel','Lorbeer',NULL,NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q26006','Tree',NULL),(15,'leaf','Blatt',NULL,'leaves',NULL,'leafs',NULL,'https://www.wikidata.org/wiki/Q33971','Leaves','PlantsParts'),(16,'lotus','Lotus',NULL,'loti','Lotusblüte',NULL,'Lotosblüte, Lotos','https://www.wikidata.org/wiki/Q3645698','Flower',NULL),(17,'oak','Eiche',NULL,'oaks',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q12004','Tree',NULL),(18,'olive','Olive',NULL,'olives','Olivenbaum',NULL,NULL,'https://www.wikidata.org/wiki/Q37083','Tree',NULL),(19,'palm','Palme',NULL,'palm tree, palms, palm trees',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q2709536','Tree',NULL),(20,'palmette','palmette',NULL,'palmettes',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q677655','Tree',NULL),(21,'plant','Pflanze',NULL,'plants',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q756','cnt:Plant',NULL),(22,'poppy','Mohn',NULL,'poppies','Mohnblumen, Mohnkopf',NULL,NULL,'https://www.wikidata.org/wiki/Q967457','Cereal-Grain',NULL),(23,'reed','Schilf',NULL,'reed branch, reed branches','Schilfrohr',NULL,NULL,'https://www.wikidata.org/wiki/Q2734060','Grass',NULL),(24,'rose','Rose',NULL,'roses',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q34687','Flower',NULL),(25,'thorn','Dorn',NULL,'thorns',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q201851','Branches','PlantsParts'),(26,'tree','Baum',NULL,'trees',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q10884','Tree',NULL),(27,'vine','Ranke',NULL,'grapevine, vines, grapevines','Weinrebe',NULL,NULL,'https://www.wikidata.org/wiki/Q917284','Bush',NULL),(28,'wheat ear','Weizenähre',NULL,'wheat ears',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q3966720','Cereal-Grain',NULL),(29,'starflower','Sternblume',NULL,'starflowers',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q147075','Flower',NULL),(30,'stump of tree','Baumstumpf',NULL,'stumps of trees',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q811646','Tree',NULL),(31,'apple tree','Apfelbaum',NULL,'apple trees',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q60458657','Tree',NULL),(37,'stalk','Halm',NULL,'stalks',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q10289985','cnt:Plant',NULL);
/*!40000 ALTER TABLE `nlp_list_plant` ENABLE KEYS */;
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
