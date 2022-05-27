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

-- Exportiere Struktur von Tabelle testdb.nlp_list_plant
CREATE TABLE IF NOT EXISTS `nlp_list_plant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `alternativenames` text DEFAULT NULL,
  `typos` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `Cat_I` text DEFAULT NULL,
  `Cat_II` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle testdb.nlp_list_plant: ~32 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_plant` DISABLE KEYS */;
INSERT INTO `nlp_list_plant` (`id`, `name`, `description`, `alternativenames`, `typos`, `link`, `Cat_I`, `Cat_II`) VALUES
	(1, 'apple', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/apple_plant', 'Fruit', NULL),
	(2, 'barley', NULL, NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/barley_plant', 'Cereal-Grain', NULL),
	(3, 'berry', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/berry_plant', 'Fruit', NULL),
	(4, 'branch', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/branch_plant', 'Branches', 'PlantsParts'),
	(5, 'cloverleaf', NULL, 'cloverleaves', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/cloverleaf_plant', 'Herb', 'Leaves'),
	(6, 'conifer', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/conifer_plant', 'Tree', NULL),
	(7, 'corn', NULL, NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/corn_plant', 'Cereal-Grain', NULL),
	(8, 'ear', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ear_plant', 'Cereal-Grain', NULL),
	(9, 'flower', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/flower_plant', 'Flower', NULL),
	(10, 'fruit', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/fruit_plant', 'Fruit', 'PlantsParts'),
	(11, 'grain', NULL, NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/grain_plant', 'Cereal-Grain', NULL),
	(12, 'grape', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/grape_plant', 'Fruit', NULL),
	(13, 'ivy', NULL, NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ivy_plant', 'Bush', NULL),
	(14, 'laurel', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/laurel_plant', 'Tree', NULL),
	(15, 'leaf', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/leaf_plant', 'Leaves', 'PlantsParts'),
	(16, 'lotus', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/lotus_plant', 'Flower', NULL),
	(17, 'oak', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/oak_plant', 'Tree', NULL),
	(18, 'olive', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/olive_plant', 'Tree', NULL),
	(19, 'palm', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/palm_plant', 'Tree', NULL),
	(20, 'palmette', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/palmette_plant', 'Tree', NULL),
	(21, 'plant', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/plant_plant', NULL, NULL),
	(22, 'poppy', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/poppy_plant', 'Cereal-Grain', NULL),
	(23, 'reed', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/reed_plant', 'Grass', NULL),
	(24, 'rose', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/rose_plant', 'Flower', NULL),
	(25, 'thorn', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/thorn_plant', NULL, 'PlantsParts'),
	(26, 'tree', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/tree_plant', 'Tree', NULL),
	(27, 'vine', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/vine_plant', 'Bush', NULL),
	(29, 'starflower', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/starflower', 'Flower', NULL),
	(35, 'grain ear', NULL, '', NULL, NULL, NULL, NULL),
	(36, 'wheat ear', NULL, '', NULL, NULL, NULL, NULL),
	(37, 'ears of corn', NULL, '', NULL, NULL, NULL, NULL),
	(38, 'palm tree', NULL, '', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `nlp_list_plant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
