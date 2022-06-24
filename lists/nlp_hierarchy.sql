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

-- Exportiere Struktur von Tabelle testdb.nlp_hierarchy
DROP TABLE IF EXISTS `nlp_hierarchy`;
CREATE TABLE IF NOT EXISTS `nlp_hierarchy` (
  `class` varchar(50) NOT NULL,
  `superclass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle testdb.nlp_hierarchy: ~82 rows (ungefähr)
/*!40000 ALTER TABLE `nlp_hierarchy` DISABLE KEYS */;
INSERT INTO `nlp_hierarchy` (`class`, `superclass`) VALUES
	('AdoptiveEmperors', 'Emperor'),
	('AnimalRestraints', 'Tools'),
	('AntonineDynasty', 'Emperor'),
	('ArchitecturalElements', 'Architecture'),
	('ArchitecturalOrnaments', 'ArchitecturalElements'),
	('Architecture', 'cnt:Object'),
	('ArgeadDynasty', 'Hellenistic'),
	('Armour', 'Clothing'),
	('Arms', 'cnt:Object'),
	('Astrological', 'cnt:Object'),
	('Ax', 'Arms'),
	('Bar', 'cnt:Object'),
	('Barbarian', 'Human'),
	('BarracksEmperors', 'Emperor'),
	('BodyParts', 'cnt:Object'),
	('CanianDynasty', 'King'),
	('CityFounder', 'Heroes'),
	('CivicInstitutions', 'foaf:Person'),
	('Clothing', 'cnt:Object'),
	('ConstantinianDynasty', 'Emperor'),
	('Crown', 'Ornaments'),
	('Deities', 'foaf:Person'),
	('Egyptian', 'foaf:Person'),
	('Emperor', 'Human'),
	('EmperorsFamily', 'Human'),
	('Female', 'foaf:Person'),
	('FlavianDynasty', 'Emperor'),
	('GameObjects', 'cnt:Object'),
	('Gate', 'Architecture'),
	('General', 'Human'),
	('GordianDynasty', 'BarracksEmperors'),
	('Greek', 'foaf:Person'),
	('Greek-Roman', 'foaf:Person'),
	('Harness', 'AnimalRestraints'),
	('Head', 'BodyParts'),
	('Headdress', 'Clothing'),
	('Hellenistic', 'King'),
	('Heroes', 'foaf:Person'),
	('Human', 'foaf:Person'),
	('Interieur-Furniture', 'cnt:Object'),
	('Jewelery', 'Ornaments'),
	('Julio-ClaudianDynasty', 'Emperor'),
	('King', 'Human'),
	('LeonidDynasty', 'Emperor'),
	('Male', 'foaf:Person'),
	('Metal', 'cnt:Object'),
	('Mural', 'Architecture'),
	('MusicalInstruments', 'cnt:Object'),
	('MythologicalFigures', 'foaf:Person'),
	('NauticalObject', 'cnt:Object'),
	('Ocre_object', 'cnt:Object'),
	('Ocre_subject', 'foaf:Person'),
	('OdrysianDynasty', 'King'),
	('Olympic', 'Deities'),
	('Ornaments', 'cnt:Object'),
	('Other', 'Deities'),
	('Personification', 'Deities'),
	('PersonToObject', 'cnt:Relation'),
	('PersonToPerson', 'cnt:Relation'),
	('Ptolemies', 'Hellenistic'),
	('RiverGod', 'Deities'),
	('Roman', 'foaf:Person'),
	('SacrificialImplements', 'cnt:Object'),
	('SapeianDynasty', 'King'),
	('Seleucides', 'Hellenistic'),
	('SeveranDynasty', 'Emperor'),
	('Ship', 'NauticalObject'),
	('ShipPart', 'Ship'),
	('ShipType', 'Ship'),
	('Staff', 'Tools'),
	('Statues', 'cnt:Object'),
	('Stone', 'cnt:Object'),
	('Tetrarchy', 'Emperor'),
	('TheodosianDynasty', 'Emperor'),
	('Tools', 'cnt:Object'),
	('Underworld', 'Deities'),
	('Usurper', 'Human'),
	('ValentinianDynasty', 'Emperor'),
	('VehicelObjects', 'cnt:Object'),
	('Vessel-Jar', 'cnt:Object'),
	('Wreath', 'Headdress'),
	('YearofFourEmperors', 'Emperor');
/*!40000 ALTER TABLE `nlp_hierarchy` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
