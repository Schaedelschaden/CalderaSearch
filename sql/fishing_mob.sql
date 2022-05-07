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

-- Dumping structure for table tpzdb.fishing_mob
CREATE TABLE IF NOT EXISTS `fishing_mob` (
  `mobid` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `zoneid` smallint(5) unsigned NOT NULL,
  `level` tinyint(3) NOT NULL,
  `min_length` smallint(5) unsigned NOT NULL,
  `max_length` smallint(5) unsigned NOT NULL,
  `ranking` smallint(5) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL,
  `base_delay` tinyint(2) unsigned NOT NULL,
  `base_move` tinyint(2) unsigned NOT NULL,
  `log` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `quest` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `nm` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `nm_flags` int(11) unsigned NOT NULL DEFAULT 0,
  `areaid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `rarity` smallint(5) unsigned NOT NULL DEFAULT 0,
  `min_respawn` int(10) unsigned NOT NULL DEFAULT 0,
  `max_respawn` int(10) unsigned NOT NULL DEFAULT 0,
  `required_baitid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `alternative_baitid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `required_keyitem` smallint(5) unsigned NOT NULL DEFAULT 0,
  `quest_only` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `disabled` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`mobid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.fishing_mob: 286 rows
/*!40000 ALTER TABLE `fishing_mob` DISABLE KEYS */;
INSERT INTO `fishing_mob` (`mobid`, `name`, `zoneid`, `level`, `min_length`, `max_length`, `ranking`, `difficulty`, `base_delay`, `base_move`, `log`, `quest`, `nm`, `nm_flags`, `areaid`, `rarity`, `min_respawn`, `max_respawn`, `required_baitid`, `alternative_baitid`, `required_keyitem`, `quest_only`, `disabled`) VALUES
	(16781313, 'Snipper', 1, 10, 1, 1, 10, 15, 11, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16781314, 'Snipper', 1, 10, 1, 1, 10, 15, 11, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16781315, 'Big_Jaw', 1, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16781316, 'Fishtrap', 1, 30, 1, 1, 10, 17, 9, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16781317, 'Protozoan', 1, 40, 1, 1, 10, 18, 8, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16781318, 'Aipaloovik', 1, 50, 1, 1, 1, 16, 10, 15, 255, 255, 1, 0, 1, 500, 0, 0, 0, 0, 0, 0, 0),
	(16785409, 'Snipper', 2, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16785410, 'Triangle_Crab', 2, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16785411, 'Clipper', 2, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16785412, 'Greater_Pugil', 2, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16785413, 'Fishtrap', 2, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16789505, 'Ghost_Crab', 3, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16789506, 'Ghost_Crab', 3, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16789507, 'Greater_Pugil', 3, 40, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16789508, 'Kraken', 3, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16789509, 'Harajnite', 3, 50, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16789510, 'Cyclopean_Conch', 3, 50, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16793601, 'Ghost_Crab', 4, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16793602, 'Grindylow', 4, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16793603, 'Greater_Pugil', 4, 30, 1, 1, 10, 17, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16793604, 'Apsaras', 4, 40, 1, 1, 10, 18, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16793605, 'Kraken', 4, 50, 1, 1, 10, 19, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(16793606, 'Lancet_Jagil', 4, 60, 1, 1, 1, 20, 10, 15, 4, 30, 1, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16822273, 'Snipper', 11, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16822274, 'Blind_Crab', 11, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16822275, 'Cutter', 11, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16822276, 'Ghost_Crab', 11, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16822277, 'Amoebic_Nodule', 11, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16875521, 'Clipper', 24, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16875522, 'Grindylow', 24, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16875523, 'Greater_Pugil', 24, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16875524, 'Greater_Pugil', 24, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16875525, 'Apsaras', 24, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16879617, 'Clipper', 25, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16879618, 'Grindylow', 25, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16879619, 'Greater_Pugil', 25, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16879620, 'Greater_Pugil', 25, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16965635, 'Passage_Crab', 46, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16965636, 'Gugru_Jagil', 46, 20, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16965637, 'Blanched_Kraken', 46, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16965638, 'Gugru_Orobon', 46, 40, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 0, 0, 17407, 17400, 0, 0, 0),
	(16965639, 'Northern_Piranu', 46, 50, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 14400, 21600, 17407, 17400, 0, 0, 0),
	(16969731, 'Passage_Crab', 47, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16969732, 'Gugru_Jagil', 47, 20, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16969733, 'Blanched_Kraken', 47, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16969734, 'Gugru_Orobon', 47, 40, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 0, 0, 17407, 17400, 0, 0, 0),
	(16969735, 'Southern_Piranu', 47, 50, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 14400, 21600, 17407, 17400, 0, 0, 0),
	(16986113, 'Red_Smoocher', 51, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16986114, 'Azoth_Apsaras', 51, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16986115, 'Red_Osculator', 51, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16986116, 'Kissing_Leech', 51, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16986117, 'Mercurial_Makara', 51, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16990209, 'Red_Smoocher', 52, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16990210, 'Azoth_Apsaras', 52, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16990211, 'Red_Osculator', 52, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16990212, 'Kissing_Leech', 52, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16990213, 'Mercurial_Makara', 52, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(16998401, 'Wootzshell', 54, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(16998402, 'Arrapago_Leech', 54, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(16998403, 'Chimera_Clot', 54, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(16998404, 'Lahama', 54, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(16998405, 'Llamhigyn_Y_Dwr', 54, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(16998406, 'Giant_Orobon', 54, 50, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 0, 0, 17407, 17400, 0, 0, 0),
	(17014785, 'Cyan_Deep_Crab', 58, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17014786, 'Submarine_Nipper', 58, 20, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17014787, 'Thalassic_Pugil', 58, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17014788, 'Abyssal_Pugil', 58, 40, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17014789, 'Bathybic_Kulshedra', 58, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17014790, 'Orobon', 58, 40, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 0, 0, 17407, 17400, 0, 0, 0),
	(17018881, 'Cyan_Deep_Crab', 59, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17018882, 'Submarine_Nipper', 59, 20, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17018883, 'Thalassic_Pugil', 59, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17018884, 'Abyssal_Pugil', 59, 40, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17018885, 'Bathybic_Kulshedra', 59, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17018886, 'Orobon', 59, 40, 1, 1, 10, 15, 10, 15, 255, 255, 1, 0, 1, 1000, 0, 0, 17407, 17400, 0, 0, 0),
	(17027073, 'Sicklemoon_Crab', 61, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17027074, 'Zazalda_Clot', 61, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17027075, 'Vozold_Clot', 61, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17027076, 'Zazalda_Jagil', 61, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17027077, 'Vozold_Jagil', 61, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17027078, 'Giant_Orobon', 61, 50, 1, 1, 10, 16, 10, 15, 255, 255, 1, 0, 1, 1000, 0, 0, 17407, 17400, 0, 0, 0),
	(17043457, 'Suhur_Mas', 65, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17043458, 'Suhur_Mas', 65, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17043459, 'Mamool_Ja_Bloodsucker', 65, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17043460, 'Mamook_Mush', 65, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17043461, 'Mamook_Crab', 65, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17055745, 'Cave_Mold', 68, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17055746, 'Cave_Mold', 68, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17055747, 'Anautogenous_Slug', 68, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17055748, 'Cave_Pugil', 68, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17055749, 'Aydeewa_Crab', 68, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17100801, 'Caedarva_Pondscum', 79, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17100802, 'Caedarva_Marshscum', 79, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17100803, 'Suhur_Mas', 79, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17100804, 'Llamhigyn_Y_Dwr', 79, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17100805, 'Llamhigyn_Y_Dwr', 79, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17186817, 'Tree_Crab', 100, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17186818, 'Limicoline_Crab', 100, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17186819, 'Land_Crab', 100, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17186820, 'Vermivorous_Crab', 100, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17186821, 'Passage_Crab', 100, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17190913, 'Pugil', 101, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17190914, 'Cheval_Pugil', 101, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17190915, 'Mud_Pugil', 101, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17190916, 'Pug_Pugil', 101, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17190917, 'Fighting_Pugil', 101, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17195009, 'Coral_Crab', 102, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17195010, 'Pug_Pugil', 102, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17195011, 'Thickshell', 102, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17195012, 'Giant_Pugil', 102, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17195013, 'Puffer_Pugil', 102, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17199105, 'Stag_Crab', 103, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17199106, 'Puffer_Pugil', 103, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17199109, 'Cutter', 103, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17203201, 'Stag_Crab', 104, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17203202, 'Spring_Pugil', 104, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17203203, 'Thread_Leech', 104, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17203204, 'Ferocious_Pugil', 104, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17203205, 'Huge_Leech', 104, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17207297, 'Snipper', 105, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17207298, 'Land_Pugil', 105, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17207299, 'Cutter', 105, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17207300, 'Greater_Pugil', 105, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17207301, 'Kraken', 105, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17211393, 'Stone_Crab', 106, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17211394, 'Sand_Crab', 106, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17211395, 'Land_Crab', 106, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17211396, 'Pug_Pugil', 106, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17211397, 'Fighting_Pugil', 106, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17215490, 'Sand_Crab', 107, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17215491, 'Land_Crab', 107, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17215492, 'Mole_Crab', 107, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17215493, 'Passage_Crab', 107, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17223681, 'Swamp_Leech', 109, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17223682, 'Stag_Crab', 109, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17223683, 'Swamp_Pugil', 109, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17223684, 'Thread_Leech', 109, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17227777, 'Snipper', 110, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17227778, 'Big_Jaw', 110, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17227779, 'Horrid_Fluke', 110, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17227780, 'Greater_Pugil', 110, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17227781, 'Big_Leech', 110, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17231873, 'Greater_Pugil', 111, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17231874, 'Vepar', 111, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17231875, 'Kraken', 111, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17231876, 'Apsaras', 111, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17231877, 'Morgawr', 111, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17240065, 'Razorjaw_Pugil', 113, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17240066, 'Rock_Crab', 113, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17240067, 'Stygian_Pugil', 113, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17240068, 'Stygian_Pugil', 113, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17240069, 'Stygian_Pugil', 113, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17240070, 'Devil Manta', 113, 50, 1, 1, 10, 15, 10, 15, 255, 255, 1, 106, 1, 1000, 600, 600, 0, 0, 0, 0, 0),
	(17244161, 'Greater_Pugil', 114, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17244162, 'Cutter', 114, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17244163, 'Ironshell', 114, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17244164, 'Makara', 114, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17244165, 'Bigclaw', 114, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17248257, 'Palm_Crab', 115, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17248258, 'Savanna_Crab', 115, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17248259, 'Land_Crab', 115, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17248260, 'Mugger_Crab', 115, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17248261, 'Passage_Crab', 115, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17252353, 'Palm_Crab', 116, 10, 1, 1, 10, 16, 14, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17252354, 'Savanna_Crab', 116, 20, 1, 1, 10, 15, 11, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17252355, 'Mud_Pugil', 116, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17252356, 'Pug_Pugil', 116, 40, 1, 1, 10, 17, 9, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17252357, 'Fighting_Pugil', 116, 50, 1, 1, 10, 19, 8, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17260545, 'Stag_Crab', 118, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17260546, 'Puffer_Pugil', 118, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17260547, 'Snipper', 118, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17260548, 'Shoal_Pugil', 118, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17260549, 'Clipper', 118, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17261040, 'Puffer Pugil', 118, 1, 1, 1, 1, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 1, 0),
	(17268737, 'Big_Jaw', 120, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17268738, 'Snipper', 120, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17268739, 'Greater_Pugil', 120, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17268740, 'Cutter', 120, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17268741, 'Kraken', 120, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17272833, 'Greater_Pugil', 121, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17272834, 'Clipper', 121, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17272835, 'Greater_Pugil', 121, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17272836, 'Bigclaw', 121, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17272837, 'Apsaras', 121, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17281025, 'Ironshell', 123, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17281026, 'Ironshell', 123, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17281027, 'Bigclaw', 123, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17281028, 'Bigclaw', 123, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17281029, 'Bloodsucker', 123, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17285121, 'Greater_Pugil', 124, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17285122, 'Clipper', 124, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17285123, 'Vepar', 124, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17285124, 'Vepar', 124, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17285125, 'Makara', 124, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17289217, 'Ironshell', 125, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17289218, 'Apsaras', 125, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17289219, 'Bigclaw', 125, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17289220, 'Bigclaw', 125, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17289221, 'Razorjaw_Pugil', 125, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17293313, 'Qufim_Pugil', 126, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17293315, 'Sea_Bishop', 126, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17293316, 'Vepar', 126, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17350657, 'Pugil', 140, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17350658, 'Pugil', 140, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17350659, 'Pug_Pugil', 140, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17350660, 'Giant_Pugil', 140, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17350661, 'Puffer_Pugil', 140, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17354754, 'Pug_Pugil', 141, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17354755, 'Giant_Pugil', 141, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17354757, 'Land_Pugil', 141, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17354758, 'Orcish_Fodder', 141, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17362945, 'Mine_Crab', 143, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17362946, 'Mine_Crab', 143, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17362947, 'Coral_Crab', 143, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17362948, 'Stag_Crab', 143, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17362949, 'Snipper', 143, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17371137, 'Pugil', 145, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17371138, 'Pugil', 145, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17371139, 'Pug_Pugil', 145, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17371140, 'Puffer_Pugil', 145, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17371141, 'Land_Pugil', 145, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17387521, 'Ferocious_Pugil', 149, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17387522, 'Ferocious_Pugil', 149, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17387523, 'Greater_Pugil', 149, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17387524, 'Gloop', 149, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17387525, 'Oil_Spill', 149, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17396141, 'Odontotyrannus', 151, 20, 1, 1, 1, 15, 10, 15, 0, 91, 1, 0, 1, 1000, 0, 0, 17001, 0, 0, 0, 0),
	(17403905, 'Scavenger_Crab', 153, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17403906, 'Stygian_Pugil', 153, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17403907, 'Bouncing_Ball', 153, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17403908, 'Demonic_Pugil', 153, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17403909, 'Demonic_Pugil', 153, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17408001, 'Demonic_Pugil', 154, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17408002, 'Demonic_Pugil', 154, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17408003, 'Demonic_Pugil', 154, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17408004, 'Demonic_Pugil', 154, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17408005, 'Demonic_Pugil', 154, 50, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17428481, 'Uggalepih_Leech', 159, 20, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17428482, 'Uggalepih_Leech', 159, 20, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17428483, 'Bloodsucker', 159, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17428484, 'Bloodsucker', 159, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17428485, 'Bouncing_Ball', 159, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17432577, 'Rock_Crab', 160, 20, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17432578, 'Razorjaw_Pugil', 160, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17432579, 'Bloodsucker', 160, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17461250, 'Acid_Grease', 167, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17469441, 'Bigclaw', 169, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17469442, 'Canal_Leech', 169, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17469443, 'Rock_Crab', 169, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17469445, 'Mousse', 169, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17485825, 'Snipper', 173, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17485826, 'Snipper', 173, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17485827, 'Greater_Pugil', 173, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17485828, 'Greater_Pugil', 173, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17485829, 'Kraken', 173, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17489921, 'Scavenger Crab', 174, 20, 1, 1, 10, 15, 11, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17489922, 'Scavenger Crab', 174, 20, 1, 1, 10, 15, 11, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17489923, 'Stygian Pugil', 174, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17489924, 'Stygian Pugil', 174, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17489925, 'Devil Manta', 174, 50, 1, 1, 1, 19, 8, 15, 255, 255, 1, 106, 1, 1000, 600, 600, 0, 0, 0, 0, 0),
	(17498113, 'Big_Jaw', 176, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17498114, 'Big_Jaw', 176, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17498117, 'Stygian_Pugil', 176, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17559553, 'Land_Crab', 191, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17559554, 'Land_Crab', 191, 10, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17559555, 'Coral_Crab', 191, 20, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17559556, 'Wadi_Leech', 191, 30, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17559557, 'Thread_Leech', 191, 40, 1, 1, 10, 15, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17567745, 'Stag_Crab', 193, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17567746, 'Stag_Crab', 193, 20, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17567747, 'Thread_Leech', 193, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17567748, 'Poison_Leech', 193, 40, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17567749, 'Rancid_Ooze', 193, 50, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17580033, 'Pirate_Pugil', 196, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17580034, 'Pirate_Pugil', 196, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17580035, 'Greater_Pugil', 196, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1),
	(17580036, 'Ooze', 196, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17580037, 'Mush', 196, 10, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17678337, 'Sea Pugil', 220, 10, 1, 1, 10, 16, 14, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17678338, 'Ocean Crab', 220, 40, 1, 1, 10, 17, 9, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17678339, 'Ocean Pugil', 220, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17678340, 'Pirate Pugil', 220, 40, 1, 1, 10, 17, 9, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17682433, 'Sea Pugil', 221, 10, 1, 1, 10, 16, 14, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17682434, 'Ocean Crab', 221, 40, 1, 1, 10, 17, 9, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17682435, 'Ocean Pugil', 221, 30, 1, 1, 10, 16, 10, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0),
	(17682436, 'Pirate Pugil', 221, 40, 1, 1, 10, 17, 9, 15, 255, 255, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `fishing_mob` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
