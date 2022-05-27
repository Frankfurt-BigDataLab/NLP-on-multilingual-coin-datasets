-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.12-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Exportiere Struktur von Tabelle testdb.nlp_list_plant_ger
CREATE TABLE IF NOT EXISTS `nlp_list_plant_ger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `alternativenames` text DEFAULT NULL,
  `typos` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `Cat_I` text DEFAULT NULL,
  `Cat_II` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle testdb.nlp_list_plant_ger: ~36 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_plant_ger` DISABLE KEYS */;
INSERT INTO `nlp_list_plant_ger` (`id`, `name`, `description`, `alternativenames`, `typos`, `link`, `Cat_I`, `Cat_II`) VALUES
	(1, 'Apfel', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/apple_plant', 'Obst', NULL),
	(2, 'Gerste', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/barley_plant', 'Cereal-Grain', NULL),
	(3, 'Beere', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/berry_plant', 'Fruit', NULL),
	(4, 'Ast', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/branch_plant', 'Branches', 'PlantsParts'),
	(5, 'Kleeblatt', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/cloverleaf_plant', 'Herb', 'Leaves'),
	(6, 'Nadelbaum', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/conifer_plant', 'Tree', NULL),
	(7, 'Mais', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/corn_plant', 'Cereal-Grain', NULL),
	(8, 'Ähre', NULL, ' Kornähre', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ear_plant', 'Cereal-Grain', NULL),
	(9, 'Blume', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/flower_plant', 'Flower', NULL),
	(10, 'Obst', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/fruit_plant', 'Fruit', 'PlantsParts'),
	(11, 'Korn', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/grain_plant', 'Cereal-Grain', NULL),
	(12, 'Traube', NULL, ' Weintraube', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/grape_plant', 'Fruit', NULL),
	(13, 'Efeu', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ivy_plant', 'Bush', NULL),
	(14, 'Lorbeer', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/laurel_plant', 'Tree', NULL),
	(15, 'Blatt', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/leaf_plant', 'Leaves', 'PlantsParts'),
	(16, 'Lotus', NULL, NULL, 'Lotosblüte, Lotos', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/lotus_plant', 'Flower', NULL),
	(17, 'Eiche', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/oak_plant', 'Tree', NULL),
	(18, 'Olive', NULL, ' Olivenbaum', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/olive_plant', 'Tree', NULL),
	(19, 'Palme', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/palm_plant', 'Tree', NULL),
	(20, 'palmette', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/palmette_plant', 'Tree', NULL),
	(21, 'Pflanze', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/plant_plant', NULL, NULL),
	(22, 'poppy', NULL, 'Mohnblumen', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/poppy_plant', 'Cereal-Grain', NULL),
	(23, 'Schilf', NULL, 'Schilfrohr', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/reed_plant', 'Grass', NULL),
	(24, 'Rose', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/rose_plant', 'Flower', NULL),
	(25, 'Dorn', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/thorn_plant', NULL, 'PlantsParts'),
	(26, 'Baum', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/tree_plant', 'Tree', NULL),
	(27, 'Ranke', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/vine_plant', 'Bush', NULL),
	(28, 'Weizenähre', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/wheat_ear_plant', 'Cereal-Grain', NULL),
	(29, 'Sternblume', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/starflower', 'Flower', NULL),
	(30, 'Mohnkopf', NULL, '', NULL, NULL, NULL, NULL),
	(31, 'Kornpflanze', NULL, 'Kornplfanzen', NULL, NULL, NULL, NULL),
	(32, 'Weinrebe', NULL, '', NULL, NULL, NULL, NULL),
	(33, 'Getreide', NULL, 'Getreidekorn', NULL, NULL, NULL, NULL),
	(34, 'Baumstumpf', NULL, '', NULL, NULL, NULL, NULL),
	(35, 'Frucht', NULL, '', NULL, NULL, NULL, NULL),
	(36, 'Apfelbaum', NULL, '', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `nlp_list_plant_ger` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
