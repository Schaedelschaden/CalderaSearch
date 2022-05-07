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

-- Dumping structure for table tpzdb.conquest_system
CREATE TABLE IF NOT EXISTS `conquest_system` (
  `region_id` tinyint(2) NOT NULL DEFAULT 0,
  `region_control` tinyint(2) NOT NULL DEFAULT 0,
  `region_control_prev` tinyint(2) NOT NULL DEFAULT 0,
  `sandoria_influence` int(10) NOT NULL DEFAULT 0,
  `bastok_influence` int(10) NOT NULL DEFAULT 0,
  `windurst_influence` int(10) NOT NULL DEFAULT 0,
  `beastmen_influence` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table tpzdb.conquest_system: 19 rows
/*!40000 ALTER TABLE `conquest_system` DISABLE KEYS */;
INSERT INTO `conquest_system` (`region_id`, `region_control`, `region_control_prev`, `sandoria_influence`, `bastok_influence`, `windurst_influence`, `beastmen_influence`) VALUES
	(0, 0, 1, 5000, 0, 0, 0),
	(1, 0, 1, 89, 738, 3092, 81),
	(2, 1, 1, 2139, 2012, 692, 157),
	(3, 0, 1, 5000, 0, 0, 0),
	(4, 0, 0, 0, 5000, 0, 0),
	(5, 2, 0, 0, 0, 5000, 0),
	(6, 0, 0, 1584, 2555, 861, 0),
	(7, 0, 0, 2847, 1921, 200, 32),
	(8, 3, 0, 538, 1253, 0, 3209),
	(9, 1, 3, 3783, 791, 32, 394),
	(10, 0, 3, 2827, 2173, 0, 0),
	(11, 0, 3, 0, 4706, 294, 0),
	(12, 0, 3, 3499, 539, 0, 962),
	(13, 0, 3, 0, 5000, 0, 0),
	(14, 2, 3, 889, 2642, 1323, 146),
	(15, 0, 3, 1931, 353, 939, 1777),
	(16, 2, 3, 0, 5000, 0, 0),
	(17, 1, 3, 0, 5000, 0, 0),
	(18, 3, 3, 0, 1424, 0, 3576);
/*!40000 ALTER TABLE `conquest_system` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
