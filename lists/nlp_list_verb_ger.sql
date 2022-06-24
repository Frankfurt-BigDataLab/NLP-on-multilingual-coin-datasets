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

-- Exportiere Struktur von Tabelle testdb.nlp_list_verb_ger
CREATE TABLE IF NOT EXISTS `nlp_list_verb_ger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `alternativenames` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle testdb.nlp_list_verb_ger: ~21 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_verb_ger` DISABLE KEYS */;
INSERT INTO `nlp_list_verb_ger` (`id`, `name`, `alternativenames`) VALUES
	(1, 'halten', ' erhebend,  fassend,  ausgießend,  festhalten,  ausgestreckt,  würgend,  ziehend,  spannend,  hängt,  drückend,  stemmend,  schwingend,  ausholend,  entfernend,  herführend,  schleudernd,  spielend'),
	(2, 'tragend', ' schulternd'),
	(3, 'stützen', ' lagernd,  aufgestützt,  liegend,  lehnend,  abstützend'),
	(4, 'sitzen', ' thronend,  galopierend,  reitend,  setzend,  gallopierend'),
	(5, 'bekränzen', ''),
	(6, 'stehen', ' fahrend,  tretend'),
	(7, 'winden', ' ringelnd,  umwunden,  emporringelnd'),
	(8, 'füttern', ''),
	(9, 'packen', ' fassen,  würgen'),
	(10, 'empfangen', ''),
	(11, 'fliegen', ''),
	(12, 'schreiten', ' laufen'),
	(13, 'springen', ''),
	(14, 'strecken', ' vorstrecken,  hervorstreckend,  hervorgestreckt'),
	(15, 'drehen', ''),
	(16, 'umschlingeln', 'umschlingend'),
	(17, 'befreit', ''),
	(18, 'schwimmen', ''),
	(19, 'knien', ' geduckt'),
	(20, 'liegen', ''),
	(21, 'brechen', '');
/*!40000 ALTER TABLE `nlp_list_verb_ger` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
