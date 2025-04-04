-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               8.0.33-0ubuntu0.22.10.2 - (Ubuntu)
-- Server Betriebssystem:        Linux
-- HeidiSQL Version:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Exportiere Struktur von Tabelle thrakien_d4n4.nlp_list_plant
CREATE TABLE IF NOT EXISTS `nlp_list_plant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alternativenames_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alternativenames_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `typos_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `typos_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Cat_I` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Cat_II` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle thrakien_d4n4.nlp_list_plant: ~34 rows (ungefähr)
INSERT INTO `nlp_list_plant` (`id`, `name_en`, `name_ger`, `description`, `alternativenames_en`, `alternativenames_ger`, `typos_en`, `typos_ger`, `link`, `Cat_I`, `Cat_II`) VALUES
	(1, 'apple', 'Apfel', NULL, 'apples', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q89', 'Fruit', NULL),
	(2, 'apple tree', 'Apfelbaum', NULL, 'apple trees', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q60458657', 'Tree', NULL),
	(3, 'barley', 'Gerste', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q61665121', 'Cereal-Grain', NULL),
	(4, 'berry', 'Beere', NULL, 'berries', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q13184', 'Fruit', NULL),
	(5, 'branch', 'Ast', NULL, 'branches, tree branch, tree branches, palm branch, palm branches', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2923673', 'Branches', 'PlantsParts'),
	(6, 'cloverleaf', 'Kleeblatt', NULL, 'cloverleaves', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q101538', 'Herb', 'PlantsParts'),
	(7, 'conifer', 'Nadelbaum', NULL, 'confers', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q132825', 'Tree', NULL),
	(8, 'corn', 'Mais', NULL, 'ears of corn', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q11575', 'Cereal-Grain', NULL),
	(9, 'ear', 'Ähre', NULL, 'ears', 'Kornähre, Kornpflanze', NULL, NULL, 'https://www.wikidata.org/wiki/Q147398', 'Cereal-Grain', NULL),
	(10, 'flower', 'Blume', NULL, 'flowers', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q886167', 'Flower', NULL),
	(11, 'fruit', 'Obst', NULL, 'fruits', 'Frucht', NULL, NULL, 'https://www.wikidata.org/wiki/Q3314483', 'Fruit', 'PlantsParts'),
	(12, 'grain', 'Korn', NULL, 'grain ear, grains, grain wreath', 'Getreide', NULL, NULL, 'https://www.wikidata.org/wiki/Q2995529', 'Cereal-Grain', NULL),
	(13, 'grape', 'Traube', NULL, 'grapes', 'Weintraube', NULL, NULL, 'https://www.wikidata.org/wiki/Q10978', 'Fruit', NULL),
	(14, 'ivy', 'Efeu', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q26771', 'Bush', NULL),
	(15, 'laurel', 'Lorbeer', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q26006', 'Tree', NULL),
	(16, 'laurel tree', 'Lorbeerbaum', NULL, 'laurel trees', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q26006', 'Tree', NULL),
	(17, 'leaf', 'Blatt', NULL, 'leaves', '', 'leafs', NULL, 'https://www.wikidata.org/wiki/Q33971', 'Leaves', 'PlantsParts'),
	(18, 'lotus', 'Lotus', NULL, 'loti', 'Lotusblüte', NULL, 'Lotosblüte, Lotos', 'https://www.wikidata.org/wiki/Q3645698', 'Flower', NULL),
	(19, 'oak', 'Eiche', NULL, 'oaks', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q12004', 'Tree', NULL),
	(20, 'olive', 'Olive', NULL, 'olives', 'Olivenbaum', NULL, NULL, 'https://www.wikidata.org/wiki/Q37083', 'Tree', NULL),
	(21, 'palm', 'Palme', NULL, 'palm tree, palms, palm trees, palm leaf', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2709536', 'Tree', NULL),
	(22, 'palmette', 'palmette', NULL, 'palmettes', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q677655', 'Tree', NULL),
	(23, 'plant', 'Pflanze', NULL, 'plants', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q756', 'cnt:Plant', NULL),
	(24, 'poppy', 'Mohn', NULL, 'poppies', 'Mohnblumen, Mohnkopf', NULL, NULL, 'https://www.wikidata.org/wiki/Q967457', 'Cereal-Grain', NULL),
	(25, 'reed', 'Schilf', NULL, 'reed branch, reed branches', 'Schilfrohr', NULL, NULL, 'https://www.wikidata.org/wiki/Q2734060', 'Grass', NULL),
	(26, 'rose', 'Rose', NULL, 'roses', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q34687', 'Flower', NULL),
	(27, 'stalk', 'Halm', NULL, 'stalks', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q10289985', 'cnt:Plant', NULL),
	(28, 'starflower', 'Sternblume', NULL, 'starflowers', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q147075', 'Flower', NULL),
	(29, 'stump of tree', 'Baumstumpf', NULL, 'stumps of trees, trunk, trunks', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q811646', 'Tree', NULL),
	(30, 'thorn', 'Dorn', NULL, 'thorns', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q201851', 'Branches', 'PlantsParts'),
	(31, 'tree', 'Baum', NULL, 'trees', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q10884', 'Tree', NULL),
	(32, 'vine', 'Ranke', NULL, 'grapevine, vines, grapevines', 'Weinrebe', NULL, NULL, 'https://www.wikidata.org/wiki/Q917284', 'Bush', NULL),
	(33, 'wheat ear', 'Weizenähre', NULL, 'wheat ears, wheat', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q3966720', 'Cereal-Grain', NULL),
	(34, 'acorn', 'Eichel', NULL, NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q3914781', 'Fruit', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
