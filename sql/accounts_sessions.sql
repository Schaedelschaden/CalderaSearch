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

-- Dumping structure for table tpzdb.accounts_sessions
CREATE TABLE IF NOT EXISTS `accounts_sessions` (
  `accid` int(10) unsigned NOT NULL DEFAULT 0,
  `charid` int(10) unsigned NOT NULL DEFAULT 0,
  `targid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `linkshellid1` int(10) unsigned NOT NULL DEFAULT 0,
  `linkshellrank1` smallint(5) unsigned NOT NULL DEFAULT 0,
  `linkshellid2` int(10) unsigned NOT NULL DEFAULT 0,
  `linkshellrank2` smallint(5) unsigned NOT NULL DEFAULT 0,
  `session_key` binary(20) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `server_addr` int(10) unsigned zerofill NOT NULL DEFAULT 0000000000,
  `server_port` smallint(5) unsigned NOT NULL DEFAULT 0,
  `client_addr` int(10) unsigned zerofill NOT NULL DEFAULT 0000000000,
  `client_port` smallint(5) unsigned NOT NULL DEFAULT 0,
  `version_mismatch` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`charid`),
  UNIQUE KEY `accid` (`accid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.accounts_sessions: ~20 rows (approximately)
/*!40000 ALTER TABLE `accounts_sessions` DISABLE KEYS */;
INSERT INTO `accounts_sessions` (`accid`, `charid`, `targid`, `linkshellid1`, `linkshellrank1`, `linkshellid2`, `linkshellrank2`, `session_key`, `server_addr`, `server_port`, `client_addr`, `client_port`, `version_mismatch`) VALUES
	(1052, 67, 1027, 4, 1, 3, 3, _binary 0x0000000000000000000000000000000068E05DAD, 3468607043, 54230, 1111856371, 54090, 0),
	(1123, 140, 1024, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000094E05DAD, 3468607043, 54230, 0788888214, 54090, 1),
	(1124, 141, 1025, 3, 3, 0, 0, _binary 0x000000000000000000000000000000005EE05DAD, 3468607043, 54230, 0788888214, 54346, 1),
	(1240, 277, 1025, 16, 2, 3, 3, _binary 0x0000000000000000000000000000000078E05DAD, 3468607043, 54230, 0407740122, 54346, 1),
	(1400, 466, 1025, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000074E05DAD, 3468607043, 54230, 0415253980, 54090, 1),
	(1411, 479, 1024, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000074E05DAD, 3468607043, 54230, 0415253980, 54602, 1),
	(1557, 626, 1024, 3, 3, 0, 0, _binary 0x000000000000000000000000000000009EE05DAD, 3468607043, 54230, 0791037611, 54090, 1),
	(1558, 627, 1025, 3, 3, 0, 0, _binary 0x000000000000000000000000000000005CE05DAD, 3468607043, 54230, 1201765034, 1046, 1),
	(1559, 628, 1028, 3, 3, 0, 0, _binary 0x000000000000000000000000000000005AE05DAD, 3468607043, 54230, 1201765034, 1047, 1),
	(1560, 629, 1027, 3, 3, 0, 0, _binary 0x000000000000000000000000000000005AE05DAD, 3468607043, 54230, 1201765034, 1048, 1),
	(1562, 631, 1026, 0, 0, 0, 0, _binary 0x0000000000000000000000000000000060E05DAD, 3468607043, 54230, 0791037611, 54602, 1),
	(1563, 632, 1025, 0, 0, 0, 0, _binary 0x000000000000000000000000000000006EE05DAD, 3468607043, 54230, 0791037611, 54346, 1),
	(1565, 634, 1024, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000060E05DAD, 3468607043, 54230, 1201765034, 54090, 1),
	(1566, 635, 1025, 3, 3, 0, 0, _binary 0x000000000000000000000000000000005EE05DAD, 3468607043, 54230, 1201765034, 54346, 1),
	(1567, 636, 1026, 3, 3, 0, 0, _binary 0x000000000000000000000000000000005EE05DAD, 3468607043, 54230, 1201765034, 54602, 1),
	(1585, 654, 1026, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000074E05DAD, 3468607043, 54230, 0415253980, 54346, 1),
	(1598, 668, 1024, 0, 0, 0, 0, _binary 0x0000000000000000000000000000000086E05DAD, 3468607043, 54230, 2395282712, 54090, 1),
	(1630, 705, 1024, 3, 3, 0, 0, _binary 0x00000000000000000000000000000000D6E05DAD, 3468607043, 54230, 2532452114, 7172, 1),
	(1631, 706, 1025, 0, 0, 0, 0, _binary 0x00000000000000000000000000000000AAE05DAD, 3468607043, 54230, 2532452114, 7170, 1),
	(1632, 707, 1026, 0, 0, 0, 0, _binary 0x00000000000000000000000000000000C6E05DAD, 3468607043, 54230, 2532452114, 7168, 1),
	(1676, 765, 1024, 16, 3, 0, 0, _binary 0x0000000000000000000000000000000074E05DAD, 3468607043, 54230, 0407740122, 54090, 1),
	(1682, 773, 1024, 0, 0, 0, 0, _binary 0x000000000000000000000000000000005EE05DAD, 3468607043, 54230, 1632887660, 54090, 1);
/*!40000 ALTER TABLE `accounts_sessions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
