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
CREATE TABLE IF NOT EXISTS `nlp_list_verb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `alternativenames` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Exportiere Daten aus Tabelle testdb.nlp_list_verb: ~22 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_list_verb` DISABLE KEYS */;
INSERT INTO `nlp_list_verb` (`id`, `name`, `alternativenames`) VALUES
	(1, 'holding', ' ploughing,  removing, covering,  containing,  brandishing,  carrying,  forming,  raising,  cradling,  touching,  drawing'),
	(2, 'wearing', ''),
	(3, 'seated_on', ' seated,  throning,  galloping,  riding_on,  sitting,  galopping, riding'),
	(4, 'resting_on', 'reclining,  reclining_on,  setting,  leaning,  leaning_on,  resting'),
	(5, 'feeding', ''),
	(6, 'standing', ''),
	(7, 'escorted_by', ''),
	(8, 'coiling', ' curling, creeping'),
	(9, 'lying', ''),
	(10, 'advancing', ' walking,  passing, running'),
	(11, 'swimming', ''),
	(12, 'extending', ''),
	(13, 'receiving', ''),
	(14, 'prancing', ''),
	(15, 'flying', ''),
	(16, 'leaping', 'jumping'),
	(17, 'crowning', ''),
	(18, 'grasping', 'clasping'),
	(19, 'kneeling', 'scooping'),
	(20, 'pushing', ''),
	(21, 'crossing', ''),
	(22, 'sailing', '');
/*!40000 ALTER TABLE `nlp_list_verb` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
