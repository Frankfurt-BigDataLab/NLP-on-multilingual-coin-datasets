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
DROP TABLE IF EXISTS `nlp_list_animal`;
CREATE TABLE IF NOT EXISTS `nlp_list_animal` (
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle testdb.nlp_list_animal: ~62 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_animal` DISABLE KEYS */;
INSERT INTO `nlp_list_animal` (`id`, `name_en`, `name_ger`, `description`, `alternativenames_en`, `alternativenames_ger`, `typos_en`, `typos_ger`, `link`, `Cat_I`, `Cat_II`) VALUES
	(1, 'Apis bull', 'Apis-Stier', NULL, '', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q208150', NULL, NULL),
	(2, 'Cerberus', 'Kerberos', 'Mehrköpfiger Hund, Wächter im Hades', NULL, 'Cerberus', NULL, NULL, 'https://www.wikidata.org/wiki/Q83496', 'Mamal', 'MythicalCreature'),
	(3, 'Ceryneian Hind', 'Kerynitische Hirschkuh', 'Ungeheuer aus der Heraklesmythologie', '', ' \'Keryneiische Hindin oder Hirschkuh von Keryneia, Keryneische Hindin\'', 'Cerynean Hind', NULL, 'https://www.wikidata.org/wiki/Q466882', 'Mamal', 'MythicalCreature'),
	(4, 'Cetus', 'Keto', 'Meeresungeheuer', NULL, ' Cetus', NULL, NULL, 'https://www.wikidata.org/wiki/Q3269950', 'Fish', 'MythicalCreature'),
	(5, 'Cretan Bull', 'Kretischer Stier', 'Ungeheuer aus der Heraklesmythologie', '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q746198', 'Mamal', 'MythicalCreature'),
	(6, 'Erymanthian Boar', 'Erymanthischer Eber', 'Ungeheuer aus der Heraklesmythologie', '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q334456', 'Mamal', 'MythicalCreature'),
	(7, 'Hydra', 'Hydr', 'Ungeheuer aus der Heraklesmythologie', NULL, 'Wasserschlange', NULL, NULL, 'https://www.wikidata.org/wiki/Q170379', 'Reptile', 'MythicalCreature'),
	(8, 'Ladon', 'Ladon', 'Ungeheuer aus der Heraklesmythologie', NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q274600', 'Reptile', 'MythicalCreature'),
	(9, 'Nemean Lion', 'Nemeischer Löwe', 'Ungeheuer aus der Heraklesmythologie', '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q199438#', 'Mamal', 'MythicalCreature'),
	(10, 'Pegasus', 'Pegasos', 'mythsches Pferd mit Flügeln', 'Pegasos', 'Pegasus', NULL, NULL, 'https://www.britishmuseum.org/collection/term/BIOG59743', 'Mamal', 'MythicalCreature'),
	(11, 'bear', 'Bär', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q30090244', 'Mamal', NULL),
	(12, 'bee', 'Biene', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q7391', 'Insect', NULL),
	(13, 'beehive', 'Bienenstock', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q165107', 'Insect', NULL),
	(14, 'bird', 'Vogel', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q5113', 'Bird', NULL),
	(15, 'boar', 'Eber', NULL, '', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q58697', 'Mamal', NULL),
	(16, 'bull', 'Stier', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q693690', 'Mamal', NULL),
	(17, 'cicada', 'Zikade', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q18347690', 'Insect', NULL),
	(18, 'crab', 'Krabbe', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q16033394', 'Shellfish', NULL),
	(19, 'crayfish', 'Flusskrebs', NULL, '', ' Krebs', NULL, NULL, 'https://www.wikidata.org/wiki/Q1211742', 'Shellfish', NULL),
	(20, 'deer', 'Hirsch', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q23390', 'Mamal', NULL),
	(21, 'dog', 'Hund', NULL, ' hound', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q144', 'Mamal', NULL),
	(22, 'dolphin', 'Delfin', NULL, '', 'Delphin', 'Dolphis', 'Delfine', 'https://www.wikidata.org/wiki/Q7369', 'Mamal', NULL),
	(23, 'eagle', 'Adler', NULL, '', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q2092297', 'Bird', NULL),
	(24, 'fish', 'Fisch', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q152', 'Fish', NULL),
	(25, 'fly', 'Fliege', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q859257', 'Insect', NULL),
	(26, 'fox', 'Fuchs', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q8331', 'Mamal', NULL),
	(27, 'goat', 'Ziege', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2934', 'Mamal', NULL),
	(28, 'griffin', 'Greif', 'mythisches Mischwesen', '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q130223', 'Bird', 'MythicalCreature'),
	(29, 'he-goat', 'Ziegenbock', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2934', 'Mamal', NULL),
	(30, 'hind', 'Hirschkuh', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q29838920', 'Mamal', NULL),
	(31, 'hippocampus', 'Seepferdchen', 'Seepferdchen', 'hippocampi', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q74363', 'Mamal', 'MythicalCreature'),
	(32, 'horse', 'Pferd', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q726', 'Mamal', NULL),
	(33, 'hound', 'Jagdhund', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q38923', 'Mamal', NULL),
	(34, 'ibis', 'Ibis', NULL, 'ibises', 'Ibisse,  Sichler', NULL, NULL, 'https://www.wikidata.org/wiki/Q193833', 'Bird', NULL),
	(35, 'lion', 'Löwe', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q140', 'Mamal', NULL),
	(36, 'ostrich', 'Strauß', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q17592', 'Bird', NULL),
	(37, 'owl', 'Eule', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q8021345', 'Bird', NULL),
	(38, 'panther', 'Panther', NULL, '', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q659549', 'Mamal', NULL),
	(39, 'peacock', 'Pfau', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q201251', 'Bird', NULL),
	(40, 'ram', 'Bock', NULL, '', 'widder', NULL, NULL, 'https://www.wikidata.org/wiki/Q2929800', 'Mamal', NULL),
	(41, 'rooster', 'Hahn', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2216236', 'Bird', NULL),
	(42, 'scallop', 'Kammmuschel', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q7360490', 'Shellfish', 'Shell'),
	(43, 'scorpion', 'Skorpion', NULL, '', 'scropion', 'scropion', NULL, 'https://www.wikidata.org/wiki/Q19125', 'Insect', NULL),
	(44, 'serpent', 'Schlange', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2102', 'Reptile', NULL),
	(45, 'she-wolf', 'Wölfin', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q28136294', 'Mamal', NULL),
	(46, 'shell', 'Muschel', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q213096', 'Shellfish', NULL),
	(47, 'snake', 'Schlange', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2102', 'Reptile', NULL),
	(48, 'sphinx', 'Sphinx', 'mythisches Mischwesen', NULL, ' Sphingen', NULL, NULL, 'https://www.wikidata.org/wiki/Q9335858', 'Mamal', 'MythicalCreature'),
	(49, 'stag', 'Hirschbock', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q29838881', 'Mamal', NULL),
	(50, 'tortoise', 'Landschildkröte', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q46360', 'Reptile', NULL),
	(51, 'tunny', 'Thunfisch', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q6146274', 'Fish', NULL),
	(52, 'turtle', 'Schildkröte', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q223044', 'Reptile', NULL),
	(53, 'wolf', 'Wolf', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q3711329', 'Mamal', NULL),
	(54, 'worm', 'Wurm', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q47253', 'Worm', NULL),
	(55, 'raven', 'Rabe', NULL, '', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q8335', 'Bird', NULL),
	(56, 'hydra', 'Hydra', NULL, '', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q170379', 'Reptile', 'MythicalCreature'),
	(57, 'cock', 'Hahn', NULL, '', ' Haushun', NULL, NULL, 'https://www.wikidata.org/wiki/Q2216236', 'Bird', NULL),
	(58, 'cattle', 'Rind', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q830', NULL, NULL),
	(59, 'ox', 'Ochse', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q473194', NULL, NULL),
	(60, 'squid', 'Tintenfisch', NULL, 'cuttlefish', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q81900', NULL, NULL),
	(61, 'elephant', 'Elefant', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q7378', NULL, NULL),
	(62, 'capricorn', 'Capricornus', NULL, NULL, 'Steinbock', NULL, NULL, 'https://www.wikidata.org/wiki/Q164272', NULL, NULL);
/*!40000 ALTER TABLE `nlp_list_animal` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
