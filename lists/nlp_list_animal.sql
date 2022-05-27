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

-- Exportiere Struktur von Tabelle testdb.nlp_list_animal
CREATE TABLE IF NOT EXISTS `nlp_list_animal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `alternativenames` text DEFAULT NULL,
  `typos` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `Cat_I` text DEFAULT NULL,
  `Cat_II` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle testdb.nlp_list_animal: ~10 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_animal` DISABLE KEYS */;
INSERT INTO `nlp_list_animal` (`id`, `name`, `description`, `alternativenames`, `typos`, `link`, `Cat_I`, `Cat_II`) VALUES
	(2, 'Cerberus', 'Mehrköpfiger Hund, Wächter im Hades', NULL, NULL, 'http://collection.britishmuseum.org/id/person-institution/57603', 'Mamal', 'MythicalCreature'),
	(3, 'Ceryneian Hind', 'Ungeheuer aus der Heraklesmythologie', '', 'Cerynean Hind', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Ceryneian_Hind_animal', 'Mamal', 'MythicalCreature'),
	(4, 'Cetus', 'Meeresungeheuer', NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Cetus_animal', 'Fish', 'MythicalCreature'),
	(5, 'Cretan Bull', 'Ungeheuer aus der Heraklesmythologie', '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Cretan_Bull_animal', 'Mamal', 'MythicalCreature'),
	(6, 'Erymanthian Boar', 'Ungeheuer aus der Heraklesmythologie', '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Erymanthian_Boar_animal', 'Mamal', 'MythicalCreature'),
	(7, 'Hydra', 'Ungeheuer aus der Heraklesmythologie', NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Hydra_animal', 'Reptile', 'MythicalCreature'),
	(8, 'Ladon', 'Ungeheuer aus der Heraklesmythologie', NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Ladon_animal', 'Reptile', 'MythicalCreature'),
	(9, 'Nemean Lion', 'Ungeheuer aus der Heraklesmythologie', '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Nemean_Lion_animal', 'Mamal', 'MythicalCreature'),
	(10, 'Pegasus', 'mythsches Pferd mit Flügeln', 'Pegasos', NULL, 'http://collection.britishmuseum.org/id/person-institution/59743', 'Mamal', 'MythicalCreature'),
	(11, 'bear', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bear_animal', 'Mamal', NULL),
	(12, 'bee', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bee_animal', 'Insect', NULL),
	(13, 'beehive', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/beehive_animal', 'Insect', NULL),
	(14, 'bird', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bird_animal', 'Bird', NULL),
	(15, 'boar', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/boar_animal', 'Mamal', NULL),
	(16, 'bull', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bull_animal', 'Mamal', NULL),
	(17, 'cicada', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/cicada_animal', 'Insect', NULL),
	(18, 'crab', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/crab_animal', 'Shellfish', NULL),
	(19, 'crayfish', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/crayfish_animal', 'Shellfish', NULL),
	(20, 'deer', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/deer_animal', 'Mamal', NULL),
	(21, 'dog', NULL, ' hound', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/dog_animal', 'Mamal', NULL),
	(22, 'dolphin', NULL, '', 'Dolphis', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/dolphin_animal', 'Mamal', NULL),
	(23, 'eagle', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/eagle_animal', 'Bird', NULL),
	(24, 'fish', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/fish_animal', 'Fish', NULL),
	(25, 'fly', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/fly_animal', 'Insect', NULL),
	(26, 'fox', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/fox_animal', 'Mamal', NULL),
	(27, 'goat', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/goat_animal', 'Mamal', NULL),
	(28, 'griffin', 'mythisches Mischwesen', '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/griffin_animal', 'Bird', 'MythicalCreature'),
	(29, 'he-goat', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/he_goat_animal', 'Mamal', NULL),
	(30, 'hind', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/hind_animal', 'Mamal', NULL),
	(31, 'hippocampus', 'Seepferdchen', 'hippocampi', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/hippocampus_animal', 'Mamal', 'MythicalCreature'),
	(32, 'horse', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/horse_animal', 'Mamal', NULL),
	(33, 'hound', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/hound_animal', 'Mamal', NULL),
	(34, 'ibis', NULL, 'ibises', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ibis_animal', 'Bird', NULL),
	(35, 'lion', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/lion_animal', 'Mamal', NULL),
	(36, 'ostrich', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ostrich_animal', 'Bird', NULL),
	(37, 'owl', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/owl_animal', 'Bird', NULL),
	(38, 'panther', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/panther_animal', 'Mamal', NULL),
	(39, 'peacock', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/peacock_animal', 'Bird', NULL),
	(40, 'ram', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ram_animal', 'Mamal', NULL),
	(41, 'rooster', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/rooster_animal', 'Bird', NULL),
	(42, 'scallop', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/scallop_animal', 'Shellfish', 'Shell'),
	(43, 'scorpion', NULL, '', 'scropion', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/scorpion_animal', 'Insect', NULL),
	(44, 'serpent', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/serpent_animal', 'Reptile', NULL),
	(45, 'she-wolf', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/she_wolf_animal', 'Mamal', NULL),
	(46, 'shell', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/shell_animal', 'Shellfish', NULL),
	(47, 'snake', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/snake_animal', 'Reptile', NULL),
	(48, 'sphinx', 'mythisches Mischwesen', NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/sphinx_animal', 'Mamal', 'MythicalCreature'),
	(49, 'stag', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/stag_animal', 'Mamal', NULL),
	(50, 'tortoise', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/tortoise_animal', 'Reptile', NULL),
	(51, 'tunny', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/tunny_animal', 'Fish', NULL),
	(52, 'turtle', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/turtle_animal', 'Reptile', NULL),
	(53, 'wolf', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/wolf_animal', 'Mamal', NULL),
	(54, 'worm', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/worm_animal', 'Worm', NULL),
	(55, 'raven', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/raven_animal', 'Bird', NULL),
	(56, 'hydra', NULL, '', NULL, NULL, 'Reptile', 'MythicalCreature'),
	(57, 'cock', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/cock', 'Bird', NULL),
	(58, 'Apis bull', NULL, '', NULL, NULL, NULL, NULL),
	(59, 'Brustbild', NULL, '', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `nlp_list_animal` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
