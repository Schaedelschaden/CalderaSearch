-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.5-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table tpzdb.server_variables
CREATE TABLE IF NOT EXISTS `server_variables` (
  `name` varchar(50) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.server_variables: 93 rows
/*!40000 ALTER TABLE `server_variables` DISABLE KEYS */;
INSERT INTO `server_variables` (`name`, `value`) VALUES
	('[BF]Save_The_Children_record', 14),
	('[BF]The_Holy_Crest_record', 600),
	('[BF]Mission_2-3_Horlais_Peak_record', 600),
	('[BF]Mission_2-3_Balgas_Dais_record', 18),
	('[BF]Mission_2-3_Waughroon_record', 600),
	('[BF]Shattering_Stars_job1_record', 600),
	('[BF]Shattering_Stars_job2_record', 600),
	('[BF]Shattering_Stars_job3_record', 600),
	('[BF]Shattering_Stars_job4_record', 600),
	('[BF]Shattering_Stars_job5_record', 600),
	('[BF]Shattering_Stars_job6_record', 600),
	('[BF]Shattering_Stars_job7_record', 600),
	('[BF]Shattering_Stars_job8_record', 600),
	('[BF]Shattering_Stars_job9_record', 600),
	('[BF]Shattering_Stars_job10_record', 600),
	('[BF]Shattering_Stars_job11_record', 600),
	('[BF]Shattering_Stars_job12_record', 600),
	('[BF]Shattering_Stars_job13_record', 600),
	('[BF]Shattering_Stars_job14_record', 600),
	('[BF]Shattering_Stars_job15_record', 600),
	('[BF]Zilart_Mission_4_record', 600),
	('[TEMP]Respawn_qm1_for_curtana', 0),
	('[TEMP]Respawn_qm1_for_rattle', 0),
	('[TEMP]Respawn_qm2_for_offering', 0),
	('[TEMP]Respawn_qm3_for_whistle', 0),
	('[POP]Beryl-footed_Molberry', 0),
	('[POP]Crimson-toothed_Pawberry', 0),
	('[LANTERN]_rancor_nw_last_lit', 0),
	('[LANTERN]_rancor_ne_last_lit', 0),
	('[LANTERN]_rancor_sw_last_lit', 0),
	('[LANTERN]_rancor_se_last_lit', 0),
	('[ZM4]Fire_Headstone_Active', 0),
	('[ZM4]Wind_Headstone_Active', 0),
	('[ZM4]Lightning_Headstone_Active', 0),
	('[ZM4]Light_Headstone_Active', 0),
	('[BF]Mission_5-1_Enter', 0),
	('[BF]Mission_5-1_QuBia_Arena_record', 15),
	('[GUILD]pattern_update', 41),
	('[GUILD]pattern', 3),
	('Heliodromos_ToD', 1613046754),
	('[SEA]IxAernDRG_PH', 16920791),
	('realPadfoot', 1),
	('Old_Prof_Spawn_Location', 5),
	('[CHOCOBO][48]price', 250),
	('[CHOCOBO][48]time', 1613000730),
	('[CHOCOBO][51]price', 200),
	('[CHOCOBO][51]time', 1613000730),
	('[CHOCOBO][80]price', 150),
	('[CHOCOBO][80]time', 1613000730),
	('[CHOCOBO][82]price', 200),
	('[CHOCOBO][82]time', 1613000730),
	('[CHOCOBO][87]price', 150),
	('[CHOCOBO][87]time', 1613000730),
	('[CHOCOBO][90]price', 200),
	('[CHOCOBO][90]time', 1613000730),
	('[CHOCOBO][94]price', 150),
	('[CHOCOBO][94]time', 1613000730),
	('[CHOCOBO][97]price', 200),
	('[CHOCOBO][97]time', 1613000730),
	('[CHOCOBO][102]price', 200),
	('[CHOCOBO][102]time', 1613000730),
	('[CHOCOBO][108]price', 200),
	('[CHOCOBO][108]time', 1613000730),
	('[CHOCOBO][114]price', 200),
	('[CHOCOBO][114]time', 1613000730),
	('[CHOCOBO][117]price', 200),
	('[CHOCOBO][117]time', 1613000730),
	('[CHOCOBO][124]price', 200),
	('[CHOCOBO][124]time', 1613000730),
	('[CHOCOBO][230]price', 100),
	('[CHOCOBO][230]time', 1613000730),
	('[CHOCOBO][234]price', 100),
	('[CHOCOBO][234]time', 1613000730),
	('[CHOCOBO][241]price', 100),
	('[CHOCOBO][241]time', 1613000730),
	('[CHOCOBO][244]price', 200),
	('[CHOCOBO][244]time', 1613000730),
	('[CHOCOBO][245]price', 200),
	('[CHOCOBO][245]time', 1613000730),
	('[CHOCOBO][246]price', 200),
	('[CHOCOBO][246]time', 1613000730),
	('[CHOCOBO][247]price', 90),
	('[CHOCOBO][247]time', 1613000730),
	('[CHOCOBO][250]price', 90),
	('[CHOCOBO][250]time', 1613000730),
	('[CHOCOBO][252]price', 90),
	('[CHOCOBO][252]time', 1613000730),
	('Selbina_Deastination', 59),
	('Mhaura_Deastination', 79),
	('AV_Regen_Reduction', 48),
	('[POP]Nidhogg', 1599448381),
	('SurpriseSpecialEvent', 1),
	('[PH]Tzee_Xicu_the_Manifest', 1);
/*!40000 ALTER TABLE `server_variables` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
