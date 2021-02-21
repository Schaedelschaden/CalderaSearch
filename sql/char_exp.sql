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

-- Dumping structure for table tpzdb.char_exp
CREATE TABLE IF NOT EXISTS `char_exp` (
  `charid` int(10) unsigned NOT NULL,
  `mode` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `war` smallint(5) unsigned NOT NULL DEFAULT 0,
  `mnk` smallint(5) unsigned NOT NULL DEFAULT 0,
  `whm` smallint(5) unsigned NOT NULL DEFAULT 0,
  `blm` smallint(5) unsigned NOT NULL DEFAULT 0,
  `rdm` smallint(5) unsigned NOT NULL DEFAULT 0,
  `thf` smallint(5) unsigned NOT NULL DEFAULT 0,
  `pld` smallint(5) unsigned NOT NULL DEFAULT 0,
  `drk` smallint(5) unsigned NOT NULL DEFAULT 0,
  `bst` smallint(5) unsigned NOT NULL DEFAULT 0,
  `brd` smallint(5) unsigned NOT NULL DEFAULT 0,
  `rng` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sam` smallint(5) unsigned NOT NULL DEFAULT 0,
  `nin` smallint(5) unsigned NOT NULL DEFAULT 0,
  `drg` smallint(5) unsigned NOT NULL DEFAULT 0,
  `smn` smallint(5) unsigned NOT NULL DEFAULT 0,
  `blu` smallint(5) unsigned NOT NULL DEFAULT 0,
  `cor` smallint(5) unsigned NOT NULL DEFAULT 0,
  `pup` smallint(5) unsigned NOT NULL DEFAULT 0,
  `dnc` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sch` smallint(5) unsigned NOT NULL DEFAULT 0,
  `geo` smallint(5) unsigned NOT NULL DEFAULT 0,
  `run` smallint(5) unsigned NOT NULL DEFAULT 0,
  `merits` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `limits` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=85;

-- Dumping data for table tpzdb.char_exp: 74 rows
/*!40000 ALTER TABLE `char_exp` DISABLE KEYS */;
INSERT INTO `char_exp` (`charid`, `mode`, `war`, `mnk`, `whm`, `blm`, `rdm`, `thf`, `pld`, `drk`, `bst`, `brd`, `rng`, `sam`, `nin`, `drg`, `smn`, `blu`, `cor`, `pup`, `dnc`, `sch`, `geo`, `run`, `merits`, `limits`) VALUES
	(1, 0, 55999, 18785, 21246, 55999, 980, 55999, 55999, 0, 1386, 0, 50596, 0, 0, 55999, 5449, 55999, 2400, 0, 0, 0, 0, 55999, 57, 3984),
	(2, 0, 0, 0, 0, 499, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(4, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4000),
	(5, 0, 55879, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55699, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 99, 9999),
	(6, 0, 0, 0, 0, 1888, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4599, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(7, 0, 55999, 0, 749, 53599, 55999, 0, 55999, 55999, 0, 0, 0, 55999, 0, 55999, 55999, 0, 0, 0, 0, 0, 0, 0, 24, 486),
	(8, 0, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55699, 55999, 55999, 5299, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 34, 6420),
	(9, 0, 55999, 0, 55999, 55999, 55999, 55999, 55999, 0, 0, 0, 0, 0, 0, 55999, 55999, 0, 55999, 0, 0, 0, 0, 0, 6, 3440),
	(10, 0, 55999, 55999, 19999, 55999, 55999, 0, 55999, 44272, 0, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 54979, 55999, 55999, 55999, 47, 7137),
	(11, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(12, 0, 55999, 0, 55999, 0, 55999, 0, 0, 0, 0, 0, 0, 54799, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0),
	(13, 0, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 0, 1, 7308),
	(14, 0, 55999, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 7699, 7699, 0, 0, 0, 0, 0, 7699, 0, 0, 0, 9, 2670),
	(15, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6726),
	(16, 0, 55999, 0, 0, 0, 55999, 1060, 0, 55699, 55999, 0, 0, 55999, 55999, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 2, 4174),
	(17, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 55999, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 3160),
	(18, 0, 55999, 55999, 0, 55999, 55999, 0, 55999, 55999, 0, 0, 0, 0, 55999, 0, 0, 0, 55999, 0, 55999, 0, 0, 0, 0, 9802),
	(19, 0, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 0, 0),
	(20, 0, 0, 0, 55279, 55999, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 33, 2960),
	(21, 0, 55099, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 2, 760),
	(22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(24, 0, 55999, 0, 0, 55999, 55999, 0, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 0, 0, 55999, 0, 0, 55999, 55999, 0, 0, 0, 7922),
	(27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(29, 0, 0, 490, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(30, 0, 0, 0, 0, 490, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(33, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 55999, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 15, 2775),
	(34, 0, 0, 0, 0, 6307, 749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(35, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(37, 0, 55999, 55999, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(38, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 55999, 55999, 749, 0, 0, 0, 0, 0, 55999, 55999, 0, 3957),
	(39, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1732),
	(40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42, 0, 0, 0, 0, 969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20),
	(44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(45, 0, 55999, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1246),
	(46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(51, 0, 0, 0, 0, 55999, 0, 0, 0, 1669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1200),
	(52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(53, 0, 55699, 55999, 0, 0, 55999, 55999, 55999, 55999, 0, 0, 0, 55999, 55999, 55999, 55999, 55999, 0, 0, 0, 0, 0, 0, 0, 6114),
	(54, 0, 0, 0, 55999, 55999, 55999, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 55999, 0, 55999, 0, 55999, 55999, 0, 0, 0, 6114),
	(55, 1, 55999, 55999, 0, 0, 55999, 0, 55999, 55999, 55999, 0, 55999, 55999, 55699, 55999, 55999, 55999, 55399, 0, 55999, 0, 0, 55999, 0, 7999),
	(56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 55999, 0, 0, 0, 0, 55999, 0, 1, 2915),
	(57, 0, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 0, 0, 0, 0),
	(58, 0, 0, 3525, 0, 0, 1668, 0, 0, 0, 7211, 0, 0, 0, 959, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 2345),
	(59, 0, 0, 0, 0, 6258, 1054, 0, 0, 0, 0, 0, 4253, 0, 399, 0, 0, 0, 0, 0, 0, 3156, 2064, 0, 0, 0),
	(60, 0, 0, 0, 33117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(61, 0, 4553, 2199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2599, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(62, 0, 0, 0, 2528, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(63, 0, 0, 0, 0, 649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(65, 0, 55999, 0, 0, 158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(66, 0, 55999, 0, 0, 0, 0, 55999, 55999, 1734, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 55999, 5, 5333),
	(69, 0, 55999, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 99, 9999),
	(67, 0, 0, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55699, 55999, 55999, 55999, 25, 8504),
	(68, 0, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 55999, 99, 6642),
	(70, 0, 55999, 55999, 7799, 0, 7799, 55999, 55999, 55999, 0, 0, 55999, 0, 7799, 55999, 55999, 55999, 55999, 0, 7799, 0, 0, 0, 17, 6210),
	(71, 0, 55699, 55999, 0, 55999, 55999, 0, 55999, 0, 0, 0, 0, 55999, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 42, 941),
	(72, 0, 0, 0, 55999, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 315),
	(73, 0, 55999, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(74, 0, 55999, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 27, 2100),
	(75, 0, 0, 0, 55999, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 99, 2443),
	(76, 0, 55999, 55999, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 55999, 7699, 55999, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0),
	(77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 0),
	(78, 0, 55999, 55999, 55999, 0, 55999, 0, 0, 0, 0, 0, 0, 0, 55999, 0, 0, 55999, 0, 0, 0, 0, 0, 0, 47, 4984),
	(79, 0, 55999, 55999, 55999, 55999, 55999, 55999, 0, 0, 0, 0, 0, 0, 55999, 0, 55999, 55999, 0, 0, 0, 55999, 0, 0, 110, 5085),
	(80, 0, 55999, 0, 0, 0, 55999, 0, 0, 55999, 0, 0, 0, 55999, 0, 0, 0, 55999, 0, 0, 0, 0, 0, 55999, 1, 3160),
	(81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 822, 0, 0, 0, 0, 0, 0, 0, 0),
	(82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3522, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `char_exp` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
