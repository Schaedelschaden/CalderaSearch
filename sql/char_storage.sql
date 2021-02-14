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

-- Dumping structure for table tpzdb.char_storage
CREATE TABLE IF NOT EXISTS `char_storage` (
  `charid` int(10) unsigned NOT NULL,
  `inventory` tinyint(2) unsigned NOT NULL DEFAULT 80,
  `safe` tinyint(2) unsigned NOT NULL DEFAULT 80,
  `locker` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `satchel` tinyint(2) unsigned NOT NULL DEFAULT 80,
  `sack` tinyint(2) unsigned NOT NULL DEFAULT 80,
  `case` tinyint(2) unsigned NOT NULL DEFAULT 80,
  `wardrobe` tinyint(2) unsigned NOT NULL DEFAULT 80,
  `wardrobe2` tinyint(2) unsigned NOT NULL DEFAULT 80,
  `wardrobe3` tinyint(2) unsigned NOT NULL DEFAULT 80,
  `wardrobe4` tinyint(2) unsigned NOT NULL DEFAULT 80,
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.char_storage: 66 rows
/*!40000 ALTER TABLE `char_storage` DISABLE KEYS */;
INSERT INTO `char_storage` (`charid`, `inventory`, `safe`, `locker`, `satchel`, `sack`, `case`, `wardrobe`, `wardrobe2`, `wardrobe3`, `wardrobe4`) VALUES
	(1, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(2, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(6, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(4, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(5, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(7, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(8, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(9, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(10, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(11, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(12, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(13, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(14, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(15, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(16, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(17, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(18, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(19, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(20, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(21, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(22, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(23, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(24, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(27, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(26, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(28, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(32, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(33, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(34, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(35, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(36, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(37, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(38, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(39, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(40, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(57, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(58, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(43, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(44, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(45, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(46, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(47, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(48, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(49, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(50, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(51, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(52, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(53, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(54, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(55, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(56, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(59, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(60, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(61, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(62, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(63, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(64, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(65, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(66, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(69, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(67, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(68, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(70, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(71, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(72, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80),
	(73, 80, 80, 0, 80, 80, 80, 80, 80, 80, 80);
/*!40000 ALTER TABLE `char_storage` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
