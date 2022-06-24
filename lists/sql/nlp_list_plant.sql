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
DROP TABLE IF EXISTS `nlp_list_plant`;
CREATE TABLE IF NOT EXISTS `nlp_list_plant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_en` text DEFAULT NULL,
  `name_ger` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `alternativenames_en` text DEFAULT NULL,
  `alternativenames_ger` text DEFAULT NULL,
  `typos_en` text DEFAULT NULL,
  `typos_ger` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `Cat_I` text DEFAULT NULL,
  `Cat_II` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle testdb.nlp_list_plant: ~32 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_plant` DISABLE KEYS */;
INSERT INTO `nlp_list_plant` (`id`, `name_en`, `name_ger`, `description`, `alternativenames_en`, `alternativenames_ger`, `typos_en`, `typos_ger`, `link`, `Cat_I`, `Cat_II`) VALUES
	(1, 'apple', 'Apfel', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q89', 'Fruit', NULL),
	(2, 'barley', 'Gerste', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q61665121', 'Cereal-Grain', NULL),
	(3, 'berry', 'Beere', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q13184', 'Fruit', NULL),
	(4, 'branch', 'Ast', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2923673', 'Branches', 'PlantsParts'),
	(5, 'cloverleaf', 'Kleeblatt', NULL, 'cloverleaves', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q101538', 'Herb', 'Leaves'),
	(6, 'conifer', 'Nadelbaum', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q132825', 'Tree', NULL),
	(7, 'corn', 'Mais', NULL, 'ears of corn', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q11575', 'Cereal-Grain', NULL),
	(8, 'ear', 'Ähre', NULL, '', 'Kornähre', NULL, NULL, 'https://www.wikidata.org/wiki/Q147398', 'Cereal-Grain', NULL),
	(9, 'flower', 'Blume', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q886167', 'Flower', NULL),
	(10, 'fruit', 'Obst', NULL, '', 'Frucht', NULL, NULL, 'https://www.wikidata.org/wiki/Q3314483', 'Fruit', 'PlantsParts'),
	(11, 'grain', 'Korn', NULL, NULL, 'Getreide', NULL, NULL, 'https://www.wikidata.org/wiki/Q2995529', 'Cereal-Grain', NULL),
	(12, 'grape', 'Traube', NULL, '', 'Weintraube', NULL, NULL, 'https://www.wikidata.org/wiki/Q10978', 'Fruit', NULL),
	(13, 'ivy', 'Efeu', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q26771', 'Bush', NULL),
	(14, 'laurel', 'Lorbeer', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q26006', 'Tree', NULL),
	(15, 'leaf', 'Blatt', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q33971', 'Leaves', 'PlantsParts'),
	(16, 'lotus', 'Lotus', NULL, '', 'Lotusblüte', NULL, 'Lotosblüte, Lotos', 'https://www.wikidata.org/wiki/Q3645698', 'Flower', NULL),
	(17, 'oak', 'Eiche', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q12004', 'Tree', NULL),
	(18, 'olive', 'Olive', NULL, '', 'Olivenbaum', NULL, NULL, 'https://www.wikidata.org/wiki/Q37083', 'Tree', NULL),
	(19, 'palm', 'Palme', NULL, 'palm tree', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2709536', 'Tree', NULL),
	(20, 'palmette', 'palmette', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q677655', 'Tree', NULL),
	(21, 'plant', 'Pflanze', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q756', NULL, NULL),
	(22, 'poppy', 'Mohn', NULL, '', 'Mohnblumen, Mohnkopf', NULL, NULL, 'https://www.wikidata.org/wiki/Q967457', 'Cereal-Grain', NULL),
	(23, 'reed', 'Schilf', NULL, '', 'Schilfrohr', NULL, NULL, 'https://www.wikidata.org/wiki/Q2734060', 'Grass', NULL),
	(24, 'rose', 'Rose', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q34687', 'Flower', NULL),
	(25, 'thorn', 'Dorn', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q201851', NULL, 'PlantsParts'),
	(26, 'tree', 'Baum', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q10884', 'Tree', NULL),
	(27, 'vine', 'Ranke', NULL, 'grapevine', 'Weinrebe', NULL, NULL, 'https://www.wikidata.org/wiki/Q917284', 'Bush', NULL),
	(28, 'wheat ear', 'Weizenähre', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q3966720', NULL, NULL),
	(29, 'starflower', 'Sternblume', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q147075', 'Flower', NULL),
	(30, 'grain ear', 'Kornpflanze', NULL, '', 'Kornpflanzen', NULL, NULL, 'https://www.wikidata.org/wiki/Q2995529', NULL, NULL),
	(31, 'stump of tree', 'Baumstumpf', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q811646', NULL, NULL),
	(32, 'apple tree', 'Apfelbaum', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q60458657', NULL, NULL);
/*!40000 ALTER TABLE `nlp_list_plant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
