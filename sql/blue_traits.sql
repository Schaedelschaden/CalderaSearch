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

-- Dumping structure for table tpzdb.blue_traits
CREATE TABLE IF NOT EXISTS `blue_traits` (
  `trait_category` smallint(2) unsigned NOT NULL,
  `trait_points_needed` smallint(2) unsigned NOT NULL,
  `traitid` tinyint(3) unsigned NOT NULL,
  `modifier` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL,
  PRIMARY KEY (`trait_category`,`trait_points_needed`,`modifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.blue_traits: 70 rows
/*!40000 ALTER TABLE `blue_traits` DISABLE KEYS */;
INSERT INTO `blue_traits` (`trait_category`, `trait_points_needed`, `traitid`, `modifier`, `value`) VALUES
	(1, 8, 32, 230, 8),
	(2, 8, 9, 370, 1),
	(3, 8, 35, 227, 8),
	(4, 8, 24, 295, 3),
	(4, 16, 24, 295, 6),
	(4, 24, 24, 295, 9),
	(4, 32, 24, 295, 12),
	(5, 8, 48, 240, 10),
	(6, 8, 5, 28, 20),
	(7, 8, 39, 231, 8),
	(8, 8, 3, 23, 10),
	(8, 16, 3, 23, 22),
	(9, 8, 11, 359, 25),
	(10, 8, 8, 5, 10),
	(10, 16, 8, 5, 20),
	(11, 8, 4, 1, 10),
	(12, 8, 33, 229, 8),
	(13, 8, 6, 29, 10),
	(14, 8, 10, 369, 1),
	(15, 8, 7, 2, 30),
	(15, 16, 7, 2, 60),
	(16, 8, 1, 25, 10),
	(16, 30, 1, 25, 48),
	(17, 8, 13, 296, 25),
	(18, 8, 2, 69, 10),
	(19, 8, 58, 249, 10),
	(20, 8, 14, 73, 10),
	(20, 24, 14, 73, 20),
	(21, 8, 17, 291, 8),
	(22, 8, 12, 170, 5),
	(22, 24, 12, 170, 15),
	(23, 8, 106, 174, 8),
	(24, 8, 15, 288, 7),
	(24, 16, 16, 302, 5),
	(25, 8, 18, 259, 10),
	(25, 16, 18, 259, 15),
	(25, 24, 18, 259, 25),
	(26, 8, 70, 306, 15),
	(27, 8, 110, 407, 5),
	(28, 16, 20, 303, 1),
	(28, 8, 19, 897, 1),
	(16, 24, 1, 25, 35),
	(16, 16, 1, 25, 22),
	(18, 16, 2, 69, 22),
	(18, 24, 2, 69, 35),
	(8, 24, 3, 23, 35),
	(8, 32, 3, 23, 48),
	(11, 16, 4, 1, 22),
	(11, 24, 4, 1, 35),
	(11, 32, 4, 1, 48),
	(6, 16, 5, 28, 24),
	(6, 24, 5, 28, 28),
	(6, 32, 5, 28, 32),
	(13, 16, 6, 29, 12),
	(13, 24, 6, 29, 14),
	(15, 24, 7, 2, 120),
	(2, 12, 9, 370, 2),
	(14, 16, 10, 369, 2),
	(22, 16, 12, 170, 10),
	(17, 16, 13, 296, 28),
	(17, 24, 13, 296, 31),
	(20, 16, 14, 73, 15),
	(25, 32, 18, 259, 30),
	(29, 8, 52, 244, 10),
	(23, 16, 106, 174, 12),
	(23, 24, 106, 174, 16),
	(27, 16, 110, 407, 7),
	(27, 24, 110, 407, 9),
	(30, 8, 98, 421, 5),
	(31, 8, 118, 3053, 5);
/*!40000 ALTER TABLE `blue_traits` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
