-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.26-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table tpzdb.char_stats
CREATE TABLE IF NOT EXISTS `char_stats` (
  `charid` int(10) unsigned NOT NULL,
  `hp` smallint(4) unsigned NOT NULL DEFAULT '50',
  `mp` smallint(4) unsigned NOT NULL DEFAULT '50',
  `nameflags` int(10) unsigned NOT NULL DEFAULT '0',
  `mhflag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mjob` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sjob` tinyint(2) unsigned NOT NULL DEFAULT '22',
  `death` int(10) unsigned NOT NULL DEFAULT '0',
  `2h` int(10) unsigned NOT NULL DEFAULT '0',
  `title` smallint(4) unsigned NOT NULL DEFAULT '0',
  `bazaar_message` blob,
  `zoning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mlvl` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `slvl` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `pet_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `pet_type` smallint(3) unsigned NOT NULL DEFAULT '0',
  `pet_hp` smallint(4) unsigned NOT NULL DEFAULT '0',
  `pet_mp` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.char_stats: 49 rows
/*!40000 ALTER TABLE `char_stats` DISABLE KEYS */;
INSERT INTO `char_stats` (`charid`, `hp`, `mp`, `nameflags`, `mhflag`, `mjob`, `sjob`, `death`, `2h`, `title`, `bazaar_message`, `zoning`, `mlvl`, `slvl`, `pet_id`, `pet_type`, `pet_hp`, `pet_mp`) VALUES
	(1, 2099, 728, 117571584, 0, 22, 13, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(2, 34, 24, 0, 0, 4, 2, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(4, 2883, 0, 0, 0, 2, 1, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(5, 2199, 197, 117571584, 0, 14, 12, 0, 0, 465, NULL, 0, 99, 49, 48, 1, 1973, 0),
	(6, 32, 14, 131072, 0, 14, 3, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(7, 1328, 708, 393216, 0, 4, 12, 1, 0, 455, NULL, 0, 99, 49, 0, 0, 0, 0),
	(8, 9999, 1694, 100794368, 0, 17, 5, 0, 0, 455, NULL, 0, 99, 49, 0, 0, 0, 0),
	(9, 1646, 1508, 131072, 0, 3, 4, 0, 0, 453, NULL, 0, 99, 49, 0, 0, 0, 0),
	(10, 2564, 649, 393216, 0, 8, 12, 0, 0, 465, NULL, 0, 99, 49, 0, 0, 0, 0),
	(11, 1165, 654, 6, 0, 3, 4, 0, 0, 206, NULL, 0, 99, 1, 0, 0, 0, 0),
	(12, 1358, 0, 131072, 0, 12, 1, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(13, 9999, 9999, 393216, 0, 4, 1, 0, 0, 455, NULL, 0, 99, 49, 0, 0, 0, 0),
	(14, 2242, 100, 393216, 0, 1, 19, 0, 0, 453, NULL, 0, 99, 49, 0, 0, 0, 0),
	(15, 1489, 90, 131072, 0, 6, 0, 0, 0, 453, NULL, 0, 99, 1, 0, 0, 0, 0),
	(16, 9974, 107, 131072, 0, 9, 13, 0, 0, 455, NULL, 0, 99, 49, 24, 0, 0, 0),
	(17, 9999, 7823, 131072, 0, 16, 13, 0, 0, 455, NULL, 0, 99, 49, 0, 0, 0, 0),
	(18, 9999, 4464, 131072, 0, 8, 5, 0, 0, 455, NULL, 0, 99, 1, 0, 0, 0, 0),
	(19, 1698, 969, 131072, 0, 16, 19, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(20, 9999, 9999, 117833728, 0, 15, 4, 0, 0, 145, NULL, 0, 99, 49, 18, 0, 0, 0),
	(21, 0, 100, 393216, 0, 1, 12, 68, 0, 455, NULL, 0, 99, 49, 0, 0, 0, 0),
	(22, 36, 0, 262144, 0, 1, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(28, 27, 22, 0, 0, 4, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(24, 9999, 8454, 262144, 0, 16, 5, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(27, 31, 0, 262144, 0, 1, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(26, 23, 28, 0, 0, 3, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(29, 54, 0, 0, 0, 2, 0, 0, 0, 206, NULL, 0, 2, 1, 0, 0, 0, 0),
	(30, 31, 44, 0, 0, 4, 0, 0, 0, 206, NULL, 0, 2, 1, 0, 0, 0, 0),
	(31, 31, 0, 262144, 0, 1, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(32, 27, 22, 0, 0, 4, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(33, 1695, 0, 131072, 0, 11, 1, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(34, 7007, 4843, 393216, 0, 4, 0, 0, 0, 206, NULL, 0, 53, 1, 0, 0, 0, 0),
	(35, 1410, 0, 131072, 0, 12, 0, 0, 0, 206, NULL, 0, 99, 1, 0, 0, 0, 0),
	(36, 33, 0, 80740480, 0, 1, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(37, 1669, 0, 134610947, 0, 12, 1, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(38, 50, 50, 0, 0, 1, 0, 0, 0, 0, NULL, 2, 1, 1, 0, 0, 0, 0),
	(39, 338, 0, 131072, 0, 1, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(40, 25, 24, 0, 0, 4, 0, 0, 0, 206, NULL, 0, 1, 1, 0, 0, 0, 0),
	(41, 2081, 107, 393216, 0, 12, 1, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(42, 127, 172, 131072, 0, 4, 0, 0, 0, 206, NULL, 0, 11, 1, 0, 0, 0, 0),
	(43, 9002, 9999, 131072, 0, 4, 3, 0, 0, 206, NULL, 0, 99, 1, 0, 0, 0, 0),
	(44, 21, 30, 131072, 0, 4, 0, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0),
	(45, 1869, 107, 131072, 0, 12, 1, 0, 0, 206, NULL, 0, 99, 49, 0, 0, 0, 0),
	(46, 25, 24, 131072, 0, 4, 22, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0),
	(47, 21, 30, 131072, 0, 4, 22, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0),
	(48, 21, 30, 131072, 0, 4, 22, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0),
	(49, 25, 24, 131072, 0, 4, 22, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0),
	(50, 21, 30, 131072, 0, 4, 22, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0),
	(51, 119, 32, 131072, 0, 8, 22, 0, 0, 465, NULL, 0, 7, 0, 0, 0, 0, 0),
	(52, 33, 0, 0, 0, 2, 22, 0, 0, 206, NULL, 0, 1, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `char_stats` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
