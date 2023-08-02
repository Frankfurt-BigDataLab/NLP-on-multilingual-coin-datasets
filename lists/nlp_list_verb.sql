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



-- Exportiere Struktur von Tabelle thrakien_d4n4.nlp_list_verb
CREATE TABLE IF NOT EXISTS `nlp_list_verb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alternativenames_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alternativenames_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- Exportiere Daten aus Tabelle thrakien_d4n4.nlp_list_verb: ~23 rows (ungefähr)
INSERT INTO `nlp_list_verb` (`id`, `name_en`, `name_ger`, `alternativenames_en`, `alternativenames_ger`, `link`) VALUES
	(1, 'holding', 'halten', ' ploughing,  removing, covering,  containing,  brandishing,  carrying,  forming,  raising,  cradling,  touching,  drawing', ' erhebend,  fassend,  ausgießend,  festhalten,  ausgestreckt,  würgend,  ziehend,  spannend,  hängt,  drückend,  stemmend,  schwingend,  ausholend,  entfernend,  herführend,  schleudernd,  spielend, tragend, schulternd', 'https://www.wikidata.org/wiki/Q108951109'),
	(2, 'seated_on', 'sitzen', ' seated,  throning,  galloping,  riding_on,  sitting,  galopping, riding', ' thronend,  galopierend,  reitend,  setzend,  gallopierend', 'https://www.wikidata.org/wiki/Q1144593'),
	(3, 'resting_on', 'stützen', 'reclining,  reclining_on,  setting,  leaning,  leaning_on,  resting', ' lagernd,  aufgestützt,  liegend,  lehnend,  abstützend', 'https://www.wikidata.org/wiki/Q17554390'),
	(4, 'feeding', 'füttern', NULL, '', 'https://www.wikidata.org/wiki/Q17550579'),
	(5, 'standing', 'stehen', NULL, ' fahrend,  tretend', 'https://www.wikidata.org/wiki/Q1986098'),
	(6, 'coiling', 'winden', ' curling, creeping', ' ringelnd,  umwunden,  emporringelnd, umschlingen, umschlingend', 'https://www.wikidata.org/wiki/Q770007'),
	(7, 'lying', 'liegen', NULL, '', 'https://www.wikidata.org/wiki/Q2268776'),
	(8, 'advancing', 'schreiten', ' walking,  passing, running', ' laufen', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/advancing'),
	(9, 'swimming', 'schwimmen', NULL, '', 'https://www.wikidata.org/wiki/Q6388'),
	(10, 'extending', 'strecken', NULL, ' vorstrecken,  hervorstreckend,  hervorgestreckt', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/extending'),
	(11, 'receiving', 'empfangen', NULL, '', 'https://www.wikidata.org/wiki/Q115088817'),
	(12, 'prancing', 'springen', 'leaping, jumping', '', 'https://www.wikidata.org/wiki/Q97331354'),
	(13, 'flying', 'fliegen', NULL, '', 'https://www.wikidata.org/wiki/Q206021'),
	(14, 'releasing', 'befreit', NULL, 'befreien?', 'https://www.wikidata.org/wiki/Q110560444'),
	(15, 'crowning', 'bekränzen', NULL, '', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/crowning'),
	(16, 'grasping', 'packen', 'clasping, pushing', ' fassen,  würgen', 'https://www.wikidata.org/wiki/Q5597405'),
	(17, 'kneeling', 'knien', 'scooping', ' geduckt', 'https://www.wikidata.org/wiki/Q8866546'),
	(18, 'crossing', 'kreuzen', NULL, '', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/crossing'),
	(19, 'breaking', 'brechen', NULL, '', 'https://www.wikidata.org/wiki/Q992067'),
	(20, 'turning', 'drehen', NULL, '', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/turning'),
	(21, 'sailing', NULL, NULL, '', 'https://www.wikidata.org/wiki/Q192520'),
	(22, 'escorted by', NULL, NULL, '', 'https://www.wikidata.org/wiki/Q3821546'),
	(23, 'wearing', NULL, NULL, '', 'https://www.wikidata.org/wiki/Q13128864');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
