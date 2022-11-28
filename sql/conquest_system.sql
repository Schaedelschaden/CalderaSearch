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
	(0, 1, 1, 4705, 295, 0, 0),
	(1, 2, 1, 0, 3998, 0, 2),
	(2, 1, 1, 0, 5000, 0, 0),
	(3, 2, 1, 5000, 0, 0, 0),
	(4, 1, 0, 0, 5000, 0, 0),
	(5, 2, 0, 0, 0, 5000, 0),
	(6, 2, 0, 0, 5000, 0, 0),
	(7, 1, 0, 0, 4126, 825, 49),
	(8, 3, 0, 597, 0, 0, 4403),
	(9, 1, 3, 0, 2437, 0, 2563),
	(10, 0, 3, 0, 5000, 0, 0),
	(11, 2, 3, 171, 4829, 0, 0),
	(12, 1, 3, 42, 4770, 42, 146),
	(13, 0, 3, 3348, 731, 659, 262),
	(14, 1, 3, 1352, 3469, 0, 179),
	(15, 0, 3, 2128, 459, 53, 2360),
	(16, 3, 3, 3545, 0, 0, 1455),
	(17, 1, 3, 1389, 2451, 0, 1160),
	(18, 3, 3, 0, 0, 0, 5000);
/*!40000 ALTER TABLE `conquest_system` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
