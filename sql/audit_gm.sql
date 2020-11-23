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

-- Dumping structure for table tpzdb.audit_gm
CREATE TABLE IF NOT EXISTS `audit_gm` (
  `date_time` datetime NOT NULL,
  `gm_name` varchar(16) NOT NULL,
  `command` varchar(40) NOT NULL,
  `full_string` varchar(200) NOT NULL,
  PRIMARY KEY (`date_time`,`gm_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.audit_gm: ~0 rows (approximately)
/*!40000 ALTER TABLE `audit_gm` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_gm` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
