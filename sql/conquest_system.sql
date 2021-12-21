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
	(0, 0, 1, 545, 197, 4249, 9),
	(1, 1, 1, 1, 3996, 1, 2),
	(2, 1, 1, 0, 4300, 0, 700),
	(3, 1, 1, 0, 5000, 0, 0),
	(4, 0, 0, 0, 5000, 0, 0),
	(5, 2, 0, 199, 12, 4781, 8),
	(6, 1, 0, 0, 5000, 0, 0),
	(7, 2, 0, 0, 0, 5000, 0),
	(8, 3, 0, 2026, 461, 490, 2023),
	(9, 1, 3, 1625, 2969, 0, 406),
	(10, 0, 3, 0, 5000, 0, 0),
	(11, 1, 3, 4925, 0, 0, 75),
	(12, 2, 3, 670, 991, 2606, 733),
	(13, 0, 3, 0, 5000, 0, 0),
	(14, 0, 3, 4470, 353, 152, 25),
	(15, 1, 3, 0, 0, 5000, 0),
	(16, 3, 3, 3373, 0, 1627, 0),
	(17, 3, 3, 529, 1479, 1197, 1795),
	(18, 0, 3, 5000, 0, 0, 0);
/*!40000 ALTER TABLE `conquest_system` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
