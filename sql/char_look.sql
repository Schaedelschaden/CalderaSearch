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

-- Dumping structure for table tpzdb.char_look
CREATE TABLE IF NOT EXISTS `char_look` (
  `charid` int(10) unsigned NOT NULL,
  `face` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `race` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `size` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `head` smallint(4) unsigned NOT NULL DEFAULT '0',
  `body` smallint(4) unsigned NOT NULL DEFAULT '8',
  `hands` smallint(4) unsigned NOT NULL DEFAULT '8',
  `legs` smallint(4) unsigned NOT NULL DEFAULT '8',
  `feet` smallint(4) unsigned NOT NULL DEFAULT '8',
  `main` smallint(4) unsigned NOT NULL DEFAULT '0',
  `sub` smallint(4) unsigned NOT NULL DEFAULT '0',
  `ranged` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=24;

-- Dumping data for table tpzdb.char_look: 49 rows
/*!40000 ALTER TABLE `char_look` DISABLE KEYS */;
INSERT INTO `char_look` (`charid`, `face`, `race`, `size`, `head`, `body`, `hands`, `legs`, `feet`, `main`, `sub`, `ranged`) VALUES
	(1, 10, 7, 2, 339, 339, 339, 339, 339, 762, 0, 0),
	(2, 8, 7, 2, 0, 8, 8, 8, 8, 291, 0, 0),
	(4, 12, 1, 2, 67, 67, 67, 67, 67, 494, 4590, 0),
	(5, 4, 8, 2, 91, 91, 91, 91, 91, 549, 0, 0),
	(6, 8, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0),
	(7, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8, 12, 1, 2, 0, 0, 0, 0, 0, 308, 0, 0),
	(9, 3, 2, 1, 119, 458, 458, 458, 458, 462, 0, 0),
	(10, 7, 3, 1, 71, 341, 88, 67, 341, 842, 0, 0),
	(11, 3, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0),
	(12, 11, 5, 0, 203, 334, 334, 0, 0, 21, 0, 0),
	(13, 10, 5, 0, 71, 71, 71, 71, 71, 557, 0, 0),
	(14, 13, 7, 1, 64, 64, 64, 64, 64, 764, 0, 0),
	(15, 6, 2, 0, 74, 74, 74, 74, 74, 559, 544, 0),
	(16, 15, 8, 2, 81, 81, 81, 81, 81, 562, 547, 0),
	(17, 10, 7, 1, 165, 165, 165, 165, 165, 572, 572, 0),
	(18, 3, 3, 1, 79, 79, 79, 79, 79, 435, 0, 0),
	(19, 3, 7, 0, 166, 166, 166, 166, 166, 21, 0, 0),
	(20, 2, 1, 0, 112, 327, 8, 160, 8, 0, 0, 0),
	(21, 6, 5, 1, 65, 65, 65, 65, 65, 603, 0, 0),
	(22, 0, 8, 0, 0, 8, 8, 8, 8, 21, 0, 0),
	(28, 12, 4, 2, 0, 8, 8, 8, 8, 0, 0, 0),
	(24, 4, 1, 1, 166, 166, 166, 166, 166, 0, 0, 0),
	(27, 3, 2, 1, 0, 8, 8, 8, 8, 21, 0, 0),
	(26, 13, 6, 0, 0, 8, 8, 8, 8, 0, 0, 0),
	(29, 6, 3, 2, 112, 309, 8, 8, 8, 126, 4222, 0),
	(30, 9, 6, 2, 112, 309, 8, 8, 8, 227, 0, 0),
	(31, 1, 7, 0, 0, 8, 8, 8, 8, 21, 0, 0),
	(32, 0, 4, 2, 0, 8, 8, 8, 8, 0, 0, 0),
	(33, 0, 4, 0, 84, 580, 183, 85, 580, 91, 46, 103),
	(34, 10, 7, 2, 112, 309, 8, 8, 8, 227, 0, 0),
	(35, 2, 3, 2, 388, 141, 141, 141, 141, 0, 0, 0),
	(36, 5, 4, 1, 0, 8, 8, 8, 8, 21, 0, 0),
	(37, 5, 4, 1, 119, 233, 8, 116, 116, 444, 0, 0),
	(38, 5, 4, 1, 0, 8, 8, 8, 8, 0, 0, 0),
	(39, 5, 4, 1, 119, 233, 8, 8, 8, 21, 0, 0),
	(40, 0, 7, 2, 0, 0, 0, 0, 0, 0, 0, 0),
	(41, 14, 8, 2, 87, 87, 87, 87, 87, 768, 0, 0),
	(42, 3, 7, 2, 112, 8, 20, 20, 20, 227, 0, 0),
	(43, 2, 5, 2, 71, 71, 71, 71, 71, 299, 0, 0),
	(44, 4, 6, 2, 0, 8, 8, 8, 8, 0, 0, 0),
	(45, 1, 1, 2, 87, 87, 87, 87, 87, 579, 0, 0),
	(46, 3, 2, 0, 0, 8, 8, 8, 8, 0, 0, 0),
	(47, 2, 5, 0, 0, 8, 8, 8, 8, 0, 0, 0),
	(48, 11, 5, 0, 0, 8, 8, 8, 8, 0, 0, 0),
	(49, 10, 7, 0, 0, 8, 8, 8, 8, 0, 0, 0),
	(50, 10, 5, 0, 0, 8, 8, 8, 8, 0, 0, 0),
	(51, 15, 3, 2, 112, 8, 8, 8, 8, 308, 0, 0),
	(52, 8, 1, 2, 0, 8, 8, 8, 8, 21, 0, 0);
/*!40000 ALTER TABLE `char_look` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
