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
-- Table structure for table `nlp_list_animal`
--

DROP TABLE IF EXISTS `nlp_list_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlp_list_animal` (
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlp_list_animal`
--

LOCK TABLES `nlp_list_animal` WRITE;
/*!40000 ALTER TABLE `nlp_list_animal` DISABLE KEYS */;
INSERT INTO `nlp_list_animal` VALUES (1,'Apis bull','Apis-Stier',NULL,NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q208150','Mammal',NULL),(2,'Cerberus','Kerberos','Mehrköpfiger Hund, Wächter im Hades',NULL,'Cerberus',NULL,NULL,'https://www.wikidata.org/wiki/Q83496','Mammal','MythicalCreature'),(3,'Ceryneian Hind','Kerynitische Hirschkuh','Ungeheuer aus der Heraklesmythologie',NULL,' \'Keryneiische Hindin oder Hirschkuh von Keryneia, Keryneische Hindin\'','Cerynean Hind',NULL,'https://www.wikidata.org/wiki/Q466882','Mammal','MythicalCreature'),(4,'Cetus','Keto','Meeresungeheuer',NULL,' Cetus',NULL,NULL,'https://www.wikidata.org/wiki/Q3269950','Fish','MythicalCreature'),(5,'Cretan Bull','Kretischer Stier','Ungeheuer aus der Heraklesmythologie',NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q746198','Mammal','MythicalCreature'),(6,'Erymanthian Boar','Erymanthischer Eber','Ungeheuer aus der Heraklesmythologie',NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q334456','Mammal','MythicalCreature'),(7,'Hydra','Hydr','Ungeheuer aus der Heraklesmythologie',NULL,'Wasserschlange',NULL,NULL,'https://www.wikidata.org/wiki/Q170379','Reptile','MythicalCreature'),(8,'Ladon','Ladon','Ungeheuer aus der Heraklesmythologie',NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q274600','Reptile','MythicalCreature'),(9,'Nemean Lion','Nemeischer Löwe','Ungeheuer aus der Heraklesmythologie',NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q199438','Mammal','MythicalCreature'),(10,'Pegasus','Pegasos','mythsches Pferd mit Flügeln','Pegasos','Pegasus',NULL,NULL,'https://www.britishmuseum.org/collection/term/BIOG59743','Mammal','MythicalCreature'),(11,'bear','Bär',NULL,'bears',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q30090244','Mammal',NULL),(12,'bee','Biene',NULL,'bees',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q7391','Insect',NULL),(14,'bird','Vogel',NULL,'birds',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q5113','Bird',NULL),(15,'boar','Eber',NULL,'boars',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q58697','Mammal',NULL),(16,'bull','Stier',NULL,'bulls',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q693690','Mammal',NULL),(17,'cicada','Zikade',NULL,'cicadas',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q18347690','Insect',NULL),(18,'crab','Krabbe',NULL,'crabs',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q16033394','Shellfish',NULL),(19,'crayfish','Flusskrebs',NULL,NULL,' Krebs',NULL,NULL,'https://www.wikidata.org/wiki/Q1211742','Shellfish',NULL),(20,'deer','Hirsch',NULL,NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q23390','Mammal',NULL),(21,'dog','Hund',NULL,'dogs',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q144','Mammal',NULL),(22,'dolphin','Delfin',NULL,'dolphins','Delphin','Dolphis','Delfine','https://www.wikidata.org/wiki/Q7369','Mammal',NULL),(23,'eagle','Adler',NULL,'eagles',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q2092297','Bird',NULL),(24,'fish','Fisch',NULL,'fishes',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q152','Fish',NULL),(25,'fly','Fliege',NULL,'flies',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q859257','Insect',NULL),(26,'fox','Fuchs',NULL,'foxes',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q8331','Mammal',NULL),(27,'goat','Ziege',NULL,'goats',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q2934','Mammal',NULL),(28,'griffin','Greif','mythisches Mischwesen','griffins',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q130223','Bird','MythicalCreature'),(29,'he-goat','Ziegenbock',NULL,'he-goats',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q2934','Mammal',NULL),(30,'hind','Hirschkuh',NULL,'hinds',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q29838920','Mammal',NULL),(31,'hippocampus','Seepferdchen','Seepferdchen','hippocampi, hippocamp',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q74363','Mammal','MythicalCreature'),(32,'horse','Pferd',NULL,'horses, horseback',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q726','Mammal',NULL),(33,'hound','Jagdhund',NULL,'hounds',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q38923','Mammal',NULL),(34,'ibis','Ibis',NULL,'ibises','Ibisse,  Sichler',NULL,NULL,'https://www.wikidata.org/wiki/Q193833','Bird',NULL),(35,'lion','Löwe',NULL,'lions',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q140','Mammal',NULL),(36,'ostrich','Strauß',NULL,'ostriches',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q17592','Bird',NULL),(37,'owl','Eule',NULL,'owls',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q8021345','Bird',NULL),(38,'panther','Panther',NULL,'panthers',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q659549','Mammal',NULL),(39,'peacock','Pfau',NULL,'peacocks',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q201251','Bird',NULL),(40,'ram','Bock',NULL,'rams','widder',NULL,NULL,'https://www.wikidata.org/wiki/Q2929800','Mammal',NULL),(41,'rooster','Hahn',NULL,'roosters',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q2216236','Bird',NULL),(42,'scallop','Kammmuschel',NULL,'scallops, scallop shell',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q7360490','Shellfish','Shell'),(43,'scorpion','Skorpion',NULL,'scorpions','scropion','scropion',NULL,'https://www.wikidata.org/wiki/Q19125','Insect',NULL),(44,'serpent','Schlange',NULL,'serpents',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q2102','Reptile',NULL),(45,'she-wolf','Wölfin',NULL,'she-wolves',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q28136294','Mammal',NULL),(46,'shell','Muschel',NULL,'shells',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q213096','Shellfish',NULL),(47,'snake','Schlange',NULL,'snakes',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q2102','Reptile',NULL),(48,'sphinx','Sphinx','mythisches Mischwesen','sphinges, sphinxes',' Sphingen',NULL,NULL,'https://www.wikidata.org/wiki/Q9335858','Mammal','MythicalCreature'),(49,'stag','Hirschbock',NULL,'stags',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q29838881','Mammal',NULL),(50,'tortoise','Landschildkröte',NULL,'tortoises',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q46360','Reptile',NULL),(51,'tunny','Thunfisch',NULL,'tunnies',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q6146274','Fish',NULL),(52,'turtle','Schildkröte',NULL,'turtles',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q223044','Reptile',NULL),(53,'wolf','Wolf',NULL,'wolves',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q3711329','Mammal',NULL),(54,'worm','Wurm',NULL,'woms',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q47253','Worm',NULL),(55,'raven','Rabe',NULL,'ravens',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q8335','Bird',NULL),(56,'hydra','Hydra',NULL,'hydrai',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q170379','Reptile','MythicalCreature'),(57,'cock','Hahn',NULL,'cocks',' Haushun',NULL,NULL,'https://www.wikidata.org/wiki/Q2216236','Bird',NULL),(58,'cattle','Rind',NULL,'cattles',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q830','Mammal',NULL),(59,'ox','Ochse',NULL,'oxes',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q473194','Mammal',NULL),(60,'squid','Tintenfisch',NULL,'cuttlefish, squids',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q81900','Mollusca',NULL),(61,'elephant','Elefant',NULL,'elephants',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q7378','Mammal',NULL),(62,'capricorn','Capricornus',NULL,'capricorns','Steinbock',NULL,NULL,'https://www.wikidata.org/wiki/Q164272','Mammal-Fish','MythicalCreature'),(63,'hippopotamus','Flusspferd',NULL,'hippopotami',NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q34505','Mammal',NULL),(64,'donkey','Esel',NULL,NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q3537778','Mammal',NULL),(65,'swan','Schwan',NULL,NULL,NULL,NULL,NULL,'https://www.wikidata.org/wiki/Q34384','Bird',NULL);
/*!40000 ALTER TABLE `nlp_list_animal` ENABLE KEYS */;
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
