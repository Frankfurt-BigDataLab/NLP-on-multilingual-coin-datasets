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

-- Exportiere Struktur von Tabelle testdb.nlp_list_verb
DROP TABLE IF EXISTS `nlp_list_verb`;
CREATE TABLE IF NOT EXISTS `nlp_list_verb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_en` text DEFAULT NULL,
  `name_ger` text DEFAULT NULL,
  `alternativenames_en` text DEFAULT NULL,
  `alternativenames_ger` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle testdb.nlp_list_verb: ~23 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_verb` DISABLE KEYS */;
INSERT INTO `nlp_list_verb` (`id`, `name_en`, `name_ger`, `alternativenames_en`, `alternativenames_ger`) VALUES
	(1, 'holding', 'halten', ' ploughing,  removing, covering,  containing,  brandishing,  carrying,  forming,  raising,  cradling,  touching,  drawing', ' erhebend,  fassend,  ausgießend,  festhalten,  ausgestreckt,  würgend,  ziehend,  spannend,  hängt,  drückend,  stemmend,  schwingend,  ausholend,  entfernend,  herführend,  schleudernd,  spielend, tragend, schulternd'),
	(2, 'seated_on', 'sitzen', ' seated,  throning,  galloping,  riding_on,  sitting,  galopping, riding', ' thronend,  galopierend,  reitend,  setzend,  gallopierend'),
	(3, 'resting_on', 'stützen', 'reclining,  reclining_on,  setting,  leaning,  leaning_on,  resting', ' lagernd,  aufgestützt,  liegend,  lehnend,  abstützend'),
	(4, 'feeding', 'füttern', '', ''),
	(5, 'standing', 'stehen', '', ' fahrend,  tretend'),
	(6, 'coiling', 'winden', ' curling, creeping', ' ringelnd,  umwunden,  emporringelnd, umschlingen, umschlingend'),
	(7, 'lying', 'liegen', '', ''),
	(8, 'advancing', 'schreiten', ' walking,  passing, running', ' laufen'),
	(9, 'swimming', 'schwimmen', '', ''),
	(10, 'extending', 'strecken', '', ' vorstrecken,  hervorstreckend,  hervorgestreckt'),
	(11, 'receiving', 'empfangen', '', ''),
	(12, 'prancing', 'springen', 'leaping, jumping', ''),
	(13, 'flying', 'fliegen', '', ''),
	(14, 'releasing', 'befreit', '', 'befreien?'),
	(15, 'crowning', 'bekränzen', '', ''),
	(16, 'grasping', 'packen', 'clasping, pushing', ' fassen,  würgen'),
	(17, 'kneeling', 'knien', 'scooping', ' geduckt'),
	(18, 'crossing', 'kreuzen', '', ''),
	(19, 'breaking', 'brechen', '', ''),
	(20, 'turning', 'drehen', '', ''),
	(21, 'sailing', '', '', ''),
	(22, 'escorted by', '', '', ''),
	(23, 'wearing', '', '', '');
/*!40000 ALTER TABLE `nlp_list_verb` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
