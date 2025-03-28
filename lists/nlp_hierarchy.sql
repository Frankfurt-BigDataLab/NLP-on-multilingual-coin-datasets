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

-- Exportiere Struktur von Tabelle thrakien_d4n4.nlp_hierarchy
CREATE TABLE IF NOT EXISTS `nlp_hierarchy` (
  `class` varchar(50) NOT NULL,
  `superclass` varchar(50) DEFAULT NULL,
  `class_uri` varchar(70) DEFAULT NULL,
  `superclass_uri` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle thrakien_d4n4.nlp_hierarchy: ~103 rows (ungefähr)
INSERT INTO `nlp_hierarchy` (`class`, `superclass`, `class_uri`, `superclass_uri`) VALUES
	('AdoptiveEmperors', 'Emperor', 'https://www.wikidata.org/wiki/Q110418817', 'https://www.wikidata.org/wiki/Q39018'),
	('AnimalRestraints', 'Tools', 'https://www.wikidata.org/wiki/Q357003', 'https://www.wikidata.org/wiki/Q39546'),
	('AntonineDynasty', 'Emperor', 'https://www.wikidata.org/wiki/Q3291176', 'https://www.wikidata.org/wiki/Q39018'),
	('ArchitecturalElements', 'Architecture', 'https://www.wikidata.org/wiki/Q391414', 'https://www.wikidata.org/wiki/Q12271'),
	('ArchitecturalOrnaments', 'ArchitecturalElements', 'https://www.wikidata.org/wiki/Q56061392', 'https://www.wikidata.org/wiki/Q391414'),
	('Architecture', 'cnt:Object', 'https://www.wikidata.org/wiki/Q12271', 'https://www.wikidata.org/wiki/Q488383'),
	('ArgeadDynasty', 'Hellenistic', 'https://www.wikidata.org/wiki/Q538849', 'https://www.wikidata.org/wiki/Q428995'),
	('Armour', 'Clothing', 'https://www.wikidata.org/wiki/Q20793164', 'https://www.wikidata.org/wiki/Q11460'),
	('Arms', 'cnt:Object', 'https://www.wikidata.org/wiki/Q728', 'https://www.wikidata.org/wiki/Q488383'),
	('Astrological', 'cnt:Object', 'https://www.wikidata.org/wiki/Q3174349', 'https://www.wikidata.org/wiki/Q488383'),
	('Ax', 'Arms', 'https://www.wikidata.org/wiki/Q39397', 'https://www.wikidata.org/wiki/Q728'),
	('Bar', 'cnt:Object', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/bar_object', 'https://www.wikidata.org/wiki/Q488383'),
	('Barbarian', 'Human', 'https://www.wikidata.org/wiki/Q134313', 'https://www.wikidata.org/wiki/Q5'),
	('BarracksEmperors', 'Emperor', 'https://www.wikidata.org/wiki/Q129167', 'https://www.wikidata.org/wiki/Q39018'),
	('Bird', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q5113', 'https://www.wikidata.org/wiki/Q729'),
	('BodyParts', 'cnt:Object', 'https://www.wikidata.org/wiki/Q16457828', 'https://www.wikidata.org/wiki/Q488383'),
	('Branches', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q2923673', 'https://www.wikidata.org/wiki/Q756'),
	('Bush', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q42295', 'https://www.wikidata.org/wiki/Q756'),
	('CanianDynasty', 'King', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/caniandynasty_person', 'https://www.wikidata.org/wiki/Q116'),
	('Cereal-Grain', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q12117', 'https://www.wikidata.org/wiki/Q756'),
	('CityFounder', 'Heroes', 'https://www.wikidata.org/wiki/Q88208710', 'https://www.wikidata.org/wiki/Q162244'),
	('CivicInstitutions', 'foaf:Person', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/civicinstitutions_person', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Clothing', 'cnt:Object', 'https://www.wikidata.org/wiki/Q11460', 'https://www.wikidata.org/wiki/Q488383'),
	('ConstantinianDynasty', 'Emperor', 'https://www.wikidata.org/wiki/Q175454', 'https://www.wikidata.org/wiki/Q39018'),
	('Crown', 'Ornaments', 'https://www.wikidata.org/wiki/Q170984', 'https://www.wikidata.org/wiki/Q18358253'),
	('Deities', 'foaf:Person', 'https://www.wikidata.org/wiki/Q178885', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Egyptian', 'foaf:Person', 'https://www.wikidata.org/wiki/Q202311', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Emperor', 'Human', 'https://www.wikidata.org/wiki/Q39018', 'https://www.wikidata.org/wiki/Q5'),
	('EmperorsFamily', 'Human', 'https://www.wikidata.org/wiki/Q10948083', 'https://www.wikidata.org/wiki/Q5'),
	('Female', 'foaf:Person', 'https://www.wikidata.org/wiki/Q467', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Fish', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q152', 'https://www.wikidata.org/wiki/Q729'),
	('FlavianDynasty', 'Emperor', 'https://www.wikidata.org/wiki/Q200565', 'https://www.wikidata.org/wiki/Q39018'),
	('Flower', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q886167', 'https://www.wikidata.org/wiki/Q756'),
	('Fruit', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q1364', 'https://www.wikidata.org/wiki/Q756'),
	('GameObjects', 'cnt:Object', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/gameobjects_object', 'https://www.wikidata.org/wiki/Q488383'),
	('Gate', 'Architecture', 'https://www.wikidata.org/wiki/Q53060', 'https://www.wikidata.org/wiki/Q12271'),
	('General', 'Human', 'https://www.wikidata.org/wiki/Q83460', 'https://www.wikidata.org/wiki/Q5'),
	('GordianDynasty', 'BarracksEmperors', 'https://www.wikidata.org/wiki/Q48981450', 'https://www.wikidata.org/wiki/Q129167'),
	('Grass', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q643352', 'https://www.wikidata.org/wiki/Q756'),
	('Greek', 'foaf:Person', 'https://www.wikidata.org/wiki/Q11772', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Greek-Roman', 'foaf:Person', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/greek-roman_person', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Harness', 'AnimalRestraints', 'https://www.wikidata.org/wiki/Q111254017', 'https://www.wikidata.org/wiki/Q357003'),
	('Head', 'BodyParts', 'https://www.wikidata.org/wiki/Q23640', 'https://www.wikidata.org/wiki/Q16457828'),
	('Headdress', 'Clothing', 'https://www.wikidata.org/wiki/Q28972621', 'https://www.wikidata.org/wiki/Q11460'),
	('Hellenistic', 'King', 'https://www.wikidata.org/wiki/Q428995', 'https://www.wikidata.org/wiki/Q116'),
	('Herb', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q207123', 'https://www.wikidata.org/wiki/Q756'),
	('Heroes', 'foaf:Person', 'https://www.wikidata.org/wiki/Q162244', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Human', 'foaf:Person', 'https://www.wikidata.org/wiki/Q5', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Insect', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q1390', 'https://www.wikidata.org/wiki/Q729'),
	('Interieur-Furniture', 'cnt:Object', 'https://www.wikidata.org/wiki/Q14745', 'https://www.wikidata.org/wiki/Q488383'),
	('Jewellery', 'Ornaments', 'https://www.wikidata.org/wiki/Q161439', 'https://www.wikidata.org/wiki/Q18358253'),
	('Julio-ClaudianDynasty', 'Emperor', 'https://www.wikidata.org/wiki/Q192841', 'https://www.wikidata.org/wiki/Q39018'),
	('King', 'Human', 'https://www.wikidata.org/wiki/Q116', 'https://www.wikidata.org/wiki/Q5'),
	('Leaves', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q33971', 'https://www.wikidata.org/wiki/Q756'),
	('LeonidDynasty', 'Emperor', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/leoniddynasty_person', 'https://www.wikidata.org/wiki/Q39018'),
	('Male', 'foaf:Person', 'https://www.wikidata.org/wiki/Q8441', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('Mammal', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q7377', 'https://www.wikidata.org/wiki/Q729'),
	('Mammal-Fish', 'cnt:Animal', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/mammal-fish_animal', 'https://www.wikidata.org/wiki/Q729'),
	('Metal', 'cnt:Object', 'https://www.wikidata.org/wiki/Q11426', 'https://www.wikidata.org/wiki/Q488383'),
	('Mollusca', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q25326', 'https://www.wikidata.org/wiki/Q729'),
	('Mural', 'Architecture', 'https://www.wikidata.org/wiki/Q219423', 'https://www.wikidata.org/wiki/Q12271'),
	('MusicalInstruments', 'cnt:Object', 'https://www.wikidata.org/wiki/Q34379', 'https://www.wikidata.org/wiki/Q488383'),
	('MythicalCreature', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q2239243', 'https://www.wikidata.org/wiki/Q729'),
	('MythologicalFigures', 'foaf:Person', 'https://www.wikidata.org/wiki/Q4271324', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('NauticalObject', 'cnt:Object', 'https://www.wikidata.org/wiki/Q20820043', 'https://www.wikidata.org/wiki/Q488383'),
	('Ocre_object', 'cnt:Object', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ocre_object_object', 'https://www.wikidata.org/wiki/Q488383'),
	('Ocre_subject', 'foaf:Person', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/ocre_subject_subject', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('OdrysianDynasty', 'King', 'https://www.wikidata.org/wiki/Q870517', 'https://www.wikidata.org/wiki/Q116'),
	('Olympic', 'Deities', 'https://www.wikidata.org/wiki/Q101609', 'https://www.wikidata.org/wiki/Q178885'),
	('Ornaments', 'cnt:Object', 'https://www.wikidata.org/wiki/Q18358253', 'https://www.wikidata.org/wiki/Q488383'),
	('Other', 'Deities', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/other_subject', 'https://www.wikidata.org/wiki/Q178885'),
	('Personification', 'Deities', 'https://www.wikidata.org/wiki/Q207174', 'https://www.wikidata.org/wiki/Q178885'),
	('PersonToObject', 'cnt:Relation', 'http://www.dbis.cs.uni-frankfurt.de/cnt/idpersontoobject_relation', 'https://www.wikidata.org/wiki/Q930933'),
	('PersonToPerson', 'cnt:Relation', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/persontoperson_relation', 'https://www.wikidata.org/wiki/Q930933'),
	('PlantsParts', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q20011319', 'https://www.wikidata.org/wiki/Q756'),
	('Ptolemies', 'Hellenistic', 'https://www.wikidata.org/wiki/Q131976', 'https://www.wikidata.org/wiki/Q428995'),
	('Reptile', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q10811', 'https://www.wikidata.org/wiki/Q729'),
	('RiverGod', 'Deities', 'https://www.wikidata.org/wiki/Q1434313', 'https://www.wikidata.org/wiki/Q178885'),
	('Roman', 'foaf:Person', 'https://www.wikidata.org/wiki/Q2277', 'http://xmlns.com/foaf/0.1/#term_Person'),
	('SacrificialImplements', 'cnt:Object', 'https://www.wikidata.org/wiki/Q111475275', 'https://www.wikidata.org/wiki/Q488383'),
	('SapeianDynasty', 'King', 'http://www.dbis.cs.uni-frankfurt.de/cnt/id/sapeiandynasty_person', 'https://www.wikidata.org/wiki/Q116'),
	('Seleucides', 'Hellenistic', 'https://www.wikidata.org/wiki/Q705904', 'https://www.wikidata.org/wiki/Q428995'),
	('SeveranDynasty', 'Emperor', 'https://www.wikidata.org/wiki/Q321219', 'https://www.wikidata.org/wiki/Q39018'),
	('Shell', 'Shellfish', 'https://www.wikidata.org/wiki/Q213096', 'https://www.wikidata.org/wiki/Q6501235'),
	('Shellfish', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q6501235', 'https://www.wikidata.org/wiki/Q729'),
	('Ship', 'NauticalObject', 'https://www.wikidata.org/wiki/Q11446', 'https://www.wikidata.org/wiki/Q20820043'),
	('ShipPart', 'Ship', 'https://www.wikidata.org/wiki/Q15688633', 'https://www.wikidata.org/wiki/Q11446'),
	('ShipType', 'Ship', 'https://www.wikidata.org/wiki/Q2235308', 'https://www.wikidata.org/wiki/Q11446'),
	('Staff', 'Tools', 'https://www.wikidata.org/wiki/Q10971443', 'https://www.wikidata.org/wiki/Q39546'),
	('Statues', 'cnt:Object', 'https://www.wikidata.org/wiki/Q179700', 'https://www.wikidata.org/wiki/Q488383'),
	('Stone', 'cnt:Object', 'https://www.wikidata.org/wiki/Q22731', 'https://www.wikidata.org/wiki/Q488383'),
	('Tetrarchy', 'Emperor', 'https://www.wikidata.org/wiki/Q174450', 'https://www.wikidata.org/wiki/Q39018'),
	('TheodosianDynasty', 'Emperor', 'https://www.wikidata.org/wiki/Q854070', 'https://www.wikidata.org/wiki/Q39018'),
	('Tools', 'cnt:Object', 'https://www.wikidata.org/wiki/Q39546', 'https://www.wikidata.org/wiki/Q488383'),
	('Tree', 'cnt:Plant', 'https://www.wikidata.org/wiki/Q10884', 'https://www.wikidata.org/wiki/Q756'),
	('Underworld', 'Deities', 'https://www.wikidata.org/wiki/Q1521549', 'https://www.wikidata.org/wiki/Q178885'),
	('Usurper', 'Human', 'https://www.wikidata.org/wiki/Q1136723', 'https://www.wikidata.org/wiki/Q5'),
	('ValentinianDynasty', 'Emperor', 'https://www.wikidata.org/wiki/Q1324480', 'https://www.wikidata.org/wiki/Q39018'),
	('VehicelObjects', 'cnt:Object', 'https://www.wikidata.org/wiki/Q42889', 'https://www.wikidata.org/wiki/Q488383'),
	('Vessel-Jar', 'cnt:Object', 'https://www.wikidata.org/wiki/Q766983', 'https://www.wikidata.org/wiki/Q488383'),
	('Worm', 'cnt:Animal', 'https://www.wikidata.org/wiki/Q47253', 'https://www.wikidata.org/wiki/Q729'),
	('Wreath', 'Headdress', 'https://www.wikidata.org/wiki/Q14127146', 'https://www.wikidata.org/wiki/Q28972621'),
	('YearofFourEmperors', 'Emperor', 'https://www.wikidata.org/wiki/Q470596', 'https://www.wikidata.org/wiki/Q39018');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
