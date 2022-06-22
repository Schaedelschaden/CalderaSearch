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

-- Dumping data for table tpzdb.server_variables: 107 rows
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
	('[GUILD]pattern_update', 172),
	('[GUILD]pattern', 3),
	('Heliodromos_ToD', 1655485548),
	('[SEA]IxAernDRG_PH', 16920786),
	('realPadfoot', 1),
	('Old_Prof_Spawn_Location', 6),
	('[CHOCOBO][48]price', 250),
	('[CHOCOBO][48]time', 1655433538),
	('[CHOCOBO][51]price', 200),
	('[CHOCOBO][51]time', 1655433538),
	('[CHOCOBO][80]price', 150),
	('[CHOCOBO][80]time', 1655433538),
	('[CHOCOBO][82]price', 200),
	('[CHOCOBO][82]time', 1655433538),
	('[CHOCOBO][87]price', 150),
	('[CHOCOBO][87]time', 1655433538),
	('[CHOCOBO][90]price', 200),
	('[CHOCOBO][90]time', 1655433538),
	('[CHOCOBO][94]price', 150),
	('[CHOCOBO][94]time', 1655433538),
	('[CHOCOBO][97]price', 200),
	('[CHOCOBO][97]time', 1655433538),
	('[CHOCOBO][102]price', 200),
	('[CHOCOBO][102]time', 1655433538),
	('[CHOCOBO][108]price', 250),
	('[CHOCOBO][108]time', 1655658241),
	('[CHOCOBO][114]price', 250),
	('[CHOCOBO][114]time', 1655655919),
	('[CHOCOBO][117]price', 225),
	('[CHOCOBO][117]time', 1655596066),
	('[CHOCOBO][124]price', 200),
	('[CHOCOBO][124]time', 1655433538),
	('[CHOCOBO][230]price', 100),
	('[CHOCOBO][230]time', 1655433539),
	('[CHOCOBO][234]price', 100),
	('[CHOCOBO][234]time', 1655433539),
	('[CHOCOBO][241]price', 100),
	('[CHOCOBO][241]time', 1655433539),
	('[CHOCOBO][244]price', 200),
	('[CHOCOBO][244]time', 1655433539),
	('[CHOCOBO][245]price', 225),
	('[CHOCOBO][245]time', 1655492751),
	('[CHOCOBO][246]price', 225),
	('[CHOCOBO][246]time', 1655649986),
	('[CHOCOBO][247]price', 90),
	('[CHOCOBO][247]time', 1655433539),
	('[CHOCOBO][250]price', 90),
	('[CHOCOBO][250]time', 1655433539),
	('[CHOCOBO][252]price', 90),
	('[CHOCOBO][252]time', 1655433539),
	('Selbina_Deastination', 84),
	('Mhaura_Deastination', 76),
	('[POP]Nidhogg', 1620047576),
	('SurpriseSpecialEvent', 1),
	('[PH]Tzee_Xicu_the_Manifest', 7),
	('GUDHA_EFFIGY_RESPAWN', 1933775261),
	('[POP]Antican_Tag', 1648747654),
	('[PH]King_Behemoth', 7),
	('[POP]Aspidochelone', 1626722505),
	('[PH]Nidhogg', 5),
	('[promy]LastEventPicked20', 1),
	('[PH]Za_Dha_Adamantking', 7),
	('[POP]Overlord_Bakgodek', 1615144141),
	('Dark_Ixion_Alive', 1),
	('[promy]LastEventPicked16', 1),
	('[PH]Overlord_Bakgodek', 7),
	('[POP]King_Behemoth', 1624633877),
	('[promy]LastEventPicked18', 2),
	('[PH]Aspidochelone', 1),
	('[POP]Biast', 1651537844);
/*!40000 ALTER TABLE `server_variables` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
