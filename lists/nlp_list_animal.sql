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

-- Exportiere Struktur von Tabelle thrakien_d4n4.nlp_list_animal
CREATE TABLE IF NOT EXISTS `nlp_list_animal` (
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle thrakien_d4n4.nlp_list_animal: ~73 rows (ungefähr)
INSERT INTO `nlp_list_animal` (`id`, `name_en`, `name_ger`, `description`, `alternativenames_en`, `alternativenames_ger`, `typos_en`, `typos_ger`, `link`, `Cat_I`, `Cat_II`) VALUES
	(1, 'Apis bull', 'Apis-Stier', NULL, NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q208150', 'Mammal', NULL),
	(2, 'bear', 'Bär', NULL, 'bears', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q30090244', 'Mammal', NULL),
	(3, 'bee', 'Biene', NULL, 'bees', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q7391', 'Insect', NULL),
	(4, 'bird', 'Vogel', NULL, 'birds', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q5113', 'Bird', NULL),
	(5, 'boar', 'Eber', NULL, 'boars', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q58697', 'Mammal', NULL),
	(6, 'bull', 'Stier', NULL, 'bulls', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q693690', 'Mammal', NULL),
	(7, 'capricorn', 'Capricornus', NULL, 'capricorns', 'Steinbock', NULL, NULL, 'https://www.wikidata.org/wiki/Q164272', 'Mammal-Fish', 'MythicalCreature'),
	(8, 'cattle', 'Rind', NULL, 'cattles', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q830', 'Mammal', NULL),
	(9, 'Cerberus', 'Kerberos', 'Mehrköpfiger Hund, Wächter im Hades', NULL, 'Cerberus', NULL, NULL, 'https://www.wikidata.org/wiki/Q83496', 'Mammal', 'MythicalCreature'),
	(10, 'Ceryneian Hind', 'Kerynitische Hirschkuh', 'Ungeheuer aus der Heraklesmythologie', NULL, 'Keryneiische Hindin,  Hirschkuh von Keryneia, Keryneische Hindin', 'Cerynean Hind', NULL, 'https://www.wikidata.org/wiki/Q466882', 'Mammal', 'MythicalCreature'),
	(11, 'Cetus', 'Keto', 'Meeresungeheuer', NULL, ' Cetus', NULL, NULL, 'https://www.wikidata.org/wiki/Q3269950', 'Fish', 'MythicalCreature'),
	(12, 'cicada', 'Zikade', NULL, 'cicadas', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q18347690', 'Insect', NULL),
	(13, 'cock', 'Hahn', NULL, 'cocks', ' Haushun', NULL, NULL, 'https://www.wikidata.org/wiki/Q2216236', 'Bird', NULL),
	(14, 'crab', 'Krabbe', NULL, 'crabs', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q16033394', 'Shellfish', NULL),
	(15, 'crayfish', 'Flusskrebs', NULL, NULL, ' Krebs', NULL, NULL, 'https://www.wikidata.org/wiki/Q1211742', 'Shellfish', NULL),
	(16, 'Cretan Bull', 'Kretischer Stier', 'Ungeheuer aus der Heraklesmythologie', NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q746198', 'Mammal', 'MythicalCreature'),
	(17, 'deer', 'Hirsch', NULL, NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q23390', 'Mammal', NULL),
	(18, 'doe', 'Hirschkuh', NULL, 'does', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q29838920', 'Mammal', NULL),
	(19, 'dog', 'Hund', NULL, 'dogs', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q144', 'Mammal', NULL),
	(20, 'dolphin', 'Delfin', NULL, 'dolphins', 'Delphin', 'Dolphis', 'Delfine', 'https://www.wikidata.org/wiki/Q7369', 'Mammal', NULL),
	(21, 'donkey', 'Esel', NULL, NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q3537778', 'Mammal', NULL),
	(22, 'eagle', 'Adler', NULL, 'eagles', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q2092297', 'Bird', NULL),
	(23, 'elephant', 'Elefant', NULL, 'elephants', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q7378', 'Mammal', NULL),
	(24, 'Erymanthian Boar', 'Erymanthischer Eber', 'Ungeheuer aus der Heraklesmythologie', NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q334456', 'Mammal', 'MythicalCreature'),
	(25, 'fish', 'Fisch', NULL, 'fishes', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q152', 'Fish', NULL),
	(26, 'fly', 'Fliege', NULL, 'flies', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q859257', 'Insect', NULL),
	(27, 'fox', 'Fuchs', NULL, 'foxes', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q8331', 'Mammal', NULL),
	(28, 'goat', 'Ziege', NULL, 'goats', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2934', 'Mammal', NULL),
	(29, 'griffin', 'Greif', 'mythisches Mischwesen', 'griffins', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q130223', 'Bird', 'MythicalCreature'),
	(30, 'he-goat', 'Ziegenbock', NULL, 'he-goats', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2934', 'Mammal', NULL),
	(31, 'hind', 'Hirschkuh', NULL, 'hinds', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q29838920', 'Mammal', NULL),
	(32, 'hippocampus', 'Seepferdchen', 'Seepferdchen', 'hippocampi, hippocamp', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q74363', 'Mammal', 'MythicalCreature'),
	(33, 'hippopotamus', 'Flusspferd', NULL, 'hippopotami', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q34505', 'Mammal', NULL),
	(34, 'horse', 'Pferd', NULL, 'horses, horseback', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q726', 'Mammal', NULL),
	(35, 'hound', 'Jagdhund', NULL, 'hounds', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q38923', 'Mammal', NULL),
	(36, 'hydra', 'Hydra', NULL, 'hydrai', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q170379', 'Reptile', 'MythicalCreature'),
	(37, 'Hydra', 'Hydra', 'Ungeheuer aus der Heraklesmythologie', NULL, 'Wasserschlange', NULL, NULL, 'https://www.wikidata.org/wiki/Q170379', 'Reptile', 'MythicalCreature'),
	(38, 'ibis', 'Ibis', NULL, 'ibises', 'Ibisse,  Sichler', NULL, NULL, 'https://www.wikidata.org/wiki/Q193833', 'Bird', NULL),
	(39, 'Ladon', 'Ladon', 'Ungeheuer aus der Heraklesmythologie', NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q274600', 'Reptile', 'MythicalCreature'),
	(40, 'lion', 'Löwe', NULL, 'lions', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q140', 'Mammal', NULL),
	(41, 'Nemean Lion', 'Nemeischer Löwe', 'Ungeheuer aus der Heraklesmythologie', NULL, '', NULL, NULL, 'https://www.wikidata.org/wiki/Q199438', 'Mammal', 'MythicalCreature'),
	(42, 'ostrich', 'Strauß', NULL, 'ostriches', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q17592', 'Bird', NULL),
	(43, 'owl', 'Eule', NULL, 'owls', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q8021345', 'Bird', NULL),
	(44, 'ox', 'Ochse', NULL, 'oxes', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q473194', 'Mammal', NULL),
	(45, 'panther', 'Panther', NULL, 'panthers', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q659549', 'Mammal', NULL),
	(46, 'peacock', 'Pfau', NULL, 'peacocks', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q201251', 'Bird', NULL),
	(47, 'Pegasus', 'Pegasos', 'mythsches Pferd mit Flügeln', 'Pegasos', 'Pegasus', NULL, NULL, 'https://www.britishmuseum.org/collection/term/BIOG59743', 'Mammal', 'MythicalCreature'),
	(48, 'ram', 'Bock', NULL, 'rams', 'widder', NULL, NULL, 'https://www.wikidata.org/wiki/Q2929800', 'Mammal', NULL),
	(49, 'raven', 'Rabe', NULL, 'ravens', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q8335', 'Bird', NULL),
	(50, 'roe', 'Reh', NULL, 'roes', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q122069', 'Mammal', NULL),
	(51, 'rooster', 'Hahn', NULL, 'roosters, cockerel, cockerels', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2216236', 'Bird', NULL),
	(52, 'scallop', 'Kammmuschel', NULL, 'scallops, scallop shell', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q7360490', 'Shellfish', 'Shell'),
	(53, 'scorpion', 'Skorpion', NULL, 'scorpions', 'scropion', 'scropion', NULL, 'https://www.wikidata.org/wiki/Q19125', 'Insect', NULL),
	(54, 'serpent', 'Schlange', NULL, 'serpents', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2102', 'Reptile', NULL),
	(55, 'she-wolf', 'Wölfin', NULL, 'she-wolves', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q28136294', 'Mammal', NULL),
	(56, 'shell', 'Muschel', NULL, 'shells', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q213096', 'Shellfish', NULL),
	(57, 'snake', 'Schlange', NULL, 'snakes', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q2102', 'Reptile', NULL),
	(58, 'sphinx', 'Sphinx', 'mythisches Mischwesen', 'sphinges, sphinxes', ' Sphingen', NULL, NULL, 'https://www.wikidata.org/wiki/Q9335858', 'Mammal', 'MythicalCreature'),
	(59, 'squid', 'Tintenfisch', NULL, 'cuttlefish, squids', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q81900', 'Mollusca', NULL),
	(60, 'stag', 'Hirschbock', NULL, 'stags', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q29838881', 'Mammal', NULL),
	(61, 'swan', 'Schwan', NULL, NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q34384', 'Bird', NULL),
	(62, 'tortoise', 'Landschildkröte', NULL, 'tortoises', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q46360', 'Reptile', NULL),
	(63, 'tunny', 'Thunfisch', NULL, 'tunnies, tuna', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q6146274', 'Fish', NULL),
	(64, 'turtle', 'Schildkröte', NULL, 'turtles', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q223044', 'Reptile', NULL),
	(65, 'wolf', 'Wolf', NULL, 'wolves', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q3711329', 'Mammal', NULL),
	(66, 'worm', 'Wurm', NULL, 'woms', '', NULL, NULL, 'https://www.wikidata.org/wiki/Q47253', 'Worm', NULL),
	(67, 'allis shad', 'Maifisch', NULL, NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q300997', 'Fish', NULL),
	(69, 'lizard', 'Eidechse', NULL, 'lizards', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q15629245', 'Reptile', NULL),
	(70, 'animal', 'Tier', NULL, 'animals', NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q729', NULL, NULL),
	(71, 'tarpon', 'Tarpune', NULL, NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q1759766', 'Fish', NULL),
	(72, 'duck', 'Ente', NULL, NULL, NULL, NULL, NULL, 'https://www.wikidata.org/wiki/Q3736439', 'Bird', NULL),
	(73, 'pig', 'Schwein', NULL, 'pigs, piglet, piglets', 'Ferkel', NULL, NULL, 'https://www.wikidata.org/wiki/Q787', 'Mammal', NULL),
	(74, 'octopus', 'Oktopus', NULL, NULL, 'Krake', NULL, NULL, 'https://www.wikidata.org/wiki/Q611843', 'Mollusca', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
