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



-- Exportiere Struktur von View thrakien_d4n4.nlp_list_obj_view
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `nlp_list_obj_view` (
	`value` MEDIUMTEXT NULL COLLATE 'utf8mb4_unicode_ci',
	`link` MEDIUMTEXT NULL COLLATE 'utf8mb4_unicode_ci'
);

-- Exportiere Struktur von View thrakien_d4n4.nlp_list_obj_view
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `nlp_list_obj_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `nlp_list_obj_view` AS select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',10),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 10) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',9),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 9) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',8),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 8) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',7),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 7) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',6),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 6) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',5),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 5) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',4),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 4) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',3),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 3) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',2),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 2) union select distinct trim(substring_index(substring_index(`nlp_list_obj`.`alternativenames_en`,',',1),',',-(1))) AS `value`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` where (((length(`nlp_list_obj`.`alternativenames_en`) - length(replace(`nlp_list_obj`.`alternativenames_en`,',',''))) + 1) >= 1) union select distinct `nlp_list_obj`.`name_en` AS `name_en`,`nlp_list_obj`.`link` AS `link` from `nlp_list_obj` order by `value`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
