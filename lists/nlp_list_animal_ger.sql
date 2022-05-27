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

-- Exportiere Struktur von Tabelle testdb.nlp_list_animal_ger
CREATE TABLE IF NOT EXISTS `nlp_list_animal_ger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `alternativenames` text DEFAULT NULL,
  `typos` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `Cat_I` text DEFAULT NULL,
  `Cat_II` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle testdb.nlp_list_animal_ger: ~63 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_animal_ger` DISABLE KEYS */;
INSERT INTO `nlp_list_animal_ger` (`id`, `name`, `description`, `alternativenames`, `typos`, `link`, `Cat_I`, `Cat_II`) VALUES
	(1, 'Apis-Stier', 'Heiliger Stier von Memphis', NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Apis_bull_animal', 'Mamal', 'MythicalCreature'),
	(2, 'Kerberos', 'Mehrköpfiger Hund, Wächter im Hades', 'Cerberus', NULL, 'http://collection.britishmuseum.org/id/person-institution/57603', 'Mamal', 'MythicalCreature'),
	(3, 'Kerynitische Hirschkuh', 'Ungeheuer aus der Heraklesmythologie', ' \'Keryneiische Hindin oder Hirschkuh von Keryneia, Keryneische Hindin\'', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Ceryneian_Hind_animal', 'Mamal', 'MythicalCreature'),
	(4, 'Keto', 'Meeresungeheuer', ' Cetus', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Cetus_animal', 'Fish', 'MythicalCreature'),
	(5, 'Kretischer Stier', 'Ungeheuer aus der Heraklesmythologie', '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Cretan_Bull_animal', 'Mamal', 'MythicalCreature'),
	(6, 'Erymanthischer Eber', 'Ungeheuer aus der Heraklesmythologie', '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Erymanthian_Boar_animal', 'Mamal', 'MythicalCreature'),
	(7, 'Hydr', 'Ungeheuer aus der Heraklesmythologie', 'Wasserschlange', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Hydra_animal', 'Reptile', 'MythicalCreature'),
	(8, 'Ladon', 'Ungeheuer aus der Heraklesmythologie', NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Ladon_animal', 'Reptile', 'MythicalCreature'),
	(9, 'Nemeischer Löwe', 'Ungeheuer aus der Heraklesmythologie', '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/Nemean_Lion_animal', 'Mamal', 'MythicalCreature'),
	(10, 'Pegasos', 'mythsches Pferd mit Flügeln', 'Pegasus', NULL, 'http://collection.britishmuseum.org/id/person-institution/59743', 'Mamal', 'MythicalCreature'),
	(11, 'Bär', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bear_animal', 'Mamal', NULL),
	(12, 'Biene', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bee_animal', 'Insect', NULL),
	(13, 'Bienenstock', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/beehive_animal', 'Insect', NULL),
	(14, 'Vogel', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bird_animal', 'Bird', NULL),
	(15, 'Eber', NULL, NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/boar_animal', 'Mamal', NULL),
	(16, 'Stier', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bull_animal', 'Mamal', NULL),
	(17, 'Zikade', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/cicada_animal', 'Insect', NULL),
	(18, 'Krabbe', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/crab_animal', 'Shellfish', NULL),
	(19, 'Flusskrebs', NULL, ' Krebs', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/crayfish_animal', 'Shellfish', NULL),
	(20, 'Hirsch', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/deer_animal', 'Mamal', NULL),
	(21, 'Hund', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/dog_animal', 'Mamal', NULL),
	(22, 'Delfin', NULL, 'Delphin', 'Delfine', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/dolphin_animal', 'Mamal', NULL),
	(23, 'Adler', NULL, NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/eagle_animal', 'Bird', NULL),
	(24, 'Fisch', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/fish_animal', 'Fish', NULL),
	(25, 'Fliege', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/fly_animal', 'Insect', NULL),
	(26, 'Fuchs', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/fox_animal', 'Mamal', NULL),
	(27, 'Ziege', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/goat_animal', 'Mamal', NULL),
	(28, 'Greif', 'mythisches Mischwesen', '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/griffin_animal', 'Bird', 'MythicalCreature'),
	(29, 'Ziegenbock', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/he_goat_animal', 'Mamal', NULL),
	(30, 'Hirschkuh', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/hind_animal', 'Mamal', NULL),
	(31, 'Seepferdchen', 'Seepferdchen', NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/hippocampus_animal', 'Mamal', 'MythicalCreature'),
	(32, 'Pferd', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/horse_animal', 'Mamal', NULL),
	(33, 'Jagdhund', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/hound_animal', 'Mamal', NULL),
	(34, 'Ibis', NULL, 'Ibisse,  Sichler', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ibis_animal', 'Bird', NULL),
	(35, 'Löwe', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/lion_animal', 'Mamal', NULL),
	(36, 'Strauß', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ostrich_animal', 'Bird', NULL),
	(37, 'Eule', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/owl_animal', 'Bird', NULL),
	(38, 'Panther', NULL, NULL, NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/panther_animal', 'Mamal', NULL),
	(39, 'Pfau', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/peacock_animal', 'Bird', NULL),
	(40, 'Bock', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ram_animal', 'Mamal', NULL),
	(41, 'Hahn', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/rooster_animal', 'Bird', NULL),
	(42, 'Kammmuschel', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/scallop_animal', 'Shellfish', 'Shell'),
	(43, 'Skorpion', NULL, 'scropion', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/scorpion_animal', 'Insect', NULL),
	(44, 'Schlange', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/serpent_animal', 'Reptile', NULL),
	(45, 'Wölfin', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/she_wolf_animal', 'Mamal', NULL),
	(46, 'Muschel', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/shell_animal', 'Shellfish', NULL),
	(47, 'Schlange', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/snake_animal', NULL, NULL),
	(48, 'Sphinx', 'mythisches Mischwesen', ' Sphingen', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/sphinx_animal', 'Mamal', 'MythicalCreature'),
	(49, 'Hirschbock', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/stag_animal', 'Mamal', NULL),
	(50, 'Landschildkröte', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/tortoise_animal', 'Reptile', NULL),
	(51, 'Thunfisch', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/tunny_animal', 'Fish', NULL),
	(52, 'Schildkröte', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/turtle_animal', 'Reptile', NULL),
	(53, 'Wolf', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/wolf_animal', 'Mamal', NULL),
	(54, 'Wurm', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/worm_animal', 'Worm', NULL),
	(55, 'Rabe', NULL, '', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/raven_animal', 'Bird', NULL),
	(56, 'Hydra', NULL, NULL, NULL, NULL, 'Reptile', 'MythicalCreature'),
	(57, 'Hahn', NULL, ' Haushun', NULL, 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/cock', 'Bird', NULL),
	(58, 'Rind', NULL, '', NULL, NULL, NULL, NULL),
	(59, 'Widder', NULL, '', NULL, NULL, NULL, NULL),
	(60, 'Ochse', NULL, '', NULL, NULL, NULL, NULL),
	(61, 'Tintenfisch', NULL, '', NULL, NULL, NULL, NULL),
	(62, 'Elefant', NULL, '', NULL, NULL, NULL, NULL),
	(63, 'Capricornus', NULL, 'Steinbock', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `nlp_list_animal_ger` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
