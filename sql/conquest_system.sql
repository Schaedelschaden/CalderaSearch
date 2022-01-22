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
	(1, 0, 1, 1460, 2395, 0, 145),
	(2, 0, 1, 2136, 2717, 0, 147),
	(3, 1, 1, 0, 5000, 0, 0),
	(4, 1, 0, 629, 4371, 0, 0),
	(5, 1, 0, 2843, 1784, 0, 373),
	(6, 1, 0, 1854, 2953, 0, 193),
	(7, 0, 0, 20, 4833, 0, 147),
	(8, 3, 0, 3447, 340, 0, 1213),
	(9, 0, 3, 4100, 0, 0, 900),
	(10, 1, 3, 0, 5000, 0, 0),
	(11, 2, 3, 0, 0, 5000, 0),
	(12, 1, 3, 1884, 2834, 0, 282),
	(13, 1, 3, 5000, 0, 0, 0),
	(14, 1, 3, 1672, 3283, 0, 45),
	(15, 0, 3, 1787, 3213, 0, 0),
	(16, 3, 3, 0, 1256, 0, 3744),
	(17, 3, 3, 529, 1479, 1197, 1795),
	(18, 0, 3, 0, 4400, 0, 600);
/*!40000 ALTER TABLE `conquest_system` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
