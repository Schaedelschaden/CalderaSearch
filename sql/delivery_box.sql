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

-- Dumping structure for table tpzdb.delivery_box
CREATE TABLE IF NOT EXISTS `delivery_box` (
  `charid` int(10) unsigned NOT NULL,
  `charname` varchar(15) DEFAULT NULL,
  `box` tinyint(1) unsigned NOT NULL,
  `slot` smallint(3) unsigned NOT NULL DEFAULT 0,
  `itemid` smallint(5) unsigned NOT NULL,
  `itemsubid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `quantity` int(10) unsigned NOT NULL,
  `extra` tinyblob DEFAULT NULL,
  `senderid` int(10) unsigned NOT NULL DEFAULT 0,
  `sender` varchar(15) DEFAULT NULL,
  `received` tinyint(1) NOT NULL DEFAULT 0,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charid`,`box`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.delivery_box: ~24 rows (approximately)
/*!40000 ALTER TABLE `delivery_box` DISABLE KEYS */;
INSERT INTO `delivery_box` (`charid`, `charname`, `box`, `slot`, `itemid`, `itemsubid`, `quantity`, `extra`, `senderid`, `sender`, `received`, `sent`) VALUES
	(8, 'Fujin', 2, 0, 65535, 0, 10000, _binary 0x000000000000000000000000000000000000000000000000, 5, 'Khalum', 1, 1),
	(20, 'Klutix', 1, 8, 4112, 0, 1, NULL, 0, 'AH-Jeuno', 0, 0),
	(58, 'Pro', 2, 0, 27743, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 59, 'Soso', 0, 1),
	(58, 'Pro', 2, 1, 27884, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 59, 'Soso', 0, 1),
	(58, 'Pro', 2, 2, 28032, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 59, 'Soso', 0, 1),
	(58, 'Pro', 2, 3, 28171, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 59, 'Soso', 0, 1),
	(58, 'Pro', 2, 4, 28309, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 59, 'Soso', 0, 1),
	(59, 'Soso', 1, 8, 27743, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 58, 'Pro', 0, 0),
	(59, 'Soso', 1, 9, 27884, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 58, 'Pro', 0, 0),
	(59, 'Soso', 1, 10, 28032, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 58, 'Pro', 0, 0),
	(59, 'Soso', 1, 11, 28171, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 58, 'Pro', 0, 0),
	(59, 'Soso', 1, 12, 28309, 0, 1, _binary 0x000000000000000000000000000000000000000000000000, 58, 'Pro', 0, 0),
	(66, 'Pumpkin', 1, 0, 65535, 4748, 200000, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 1, 65535, 4818, 5000, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 2, 65535, 894, 9600, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 3, 65535, 658, 10000, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 4, 65535, 5, 50000, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 5, 65535, 831, 5000, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 6, 65535, 831, 5000, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 7, 318, 0, 1, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 8, 747, 0, 1, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 9, 321, 0, 1, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 10, 318, 0, 1, NULL, 0, 'AH-Jeuno', 0, 0),
	(66, 'Pumpkin', 1, 11, 321, 0, 1, NULL, 0, 'AH-Jeuno', 0, 0);
/*!40000 ALTER TABLE `delivery_box` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
