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

-- Dumping data for table tpzdb.accounts_sessions: ~12 rows (approximately)
/*!40000 ALTER TABLE `accounts_sessions` DISABLE KEYS */;
INSERT INTO `accounts_sessions` (`accid`, `charid`, `targid`, `linkshellid1`, `linkshellrank1`, `linkshellid2`, `linkshellrank2`, `session_key`, `server_addr`, `server_port`, `client_addr`, `client_port`, `version_mismatch`) VALUES
	(1075, 95, 1025, 10, 1, 3, 3, _binary 0x000000000000000000000000000000006EE05DAD, 3468607043, 54230, 1223686865, 54090, 1),
	(1088, 110, 1027, 4, 3, 3, 3, _binary 0x000000000000000000000000000000005AE05DAD, 3468607043, 54230, 1143360531, 54090, 1),
	(1118, 135, 1024, 10, 2, 3, 3, _binary 0x000000000000000000000000000000005CE05DAD, 3468607043, 54230, 1223686865, 54346, 1),
	(1120, 137, 1026, 10, 2, 3, 3, _binary 0x0000000000000000000000000000000058E05DAD, 3468607043, 54230, 1223686865, 54602, 1),
	(1190, 213, 1024, 16, 1, 3, 3, _binary 0x0000000000000000000000000000000072E05DAD, 3468607043, 54230, 1185171149, 63469, 1),
	(1191, 218, 1025, 16, 2, 3, 3, _binary 0x0000000000000000000000000000000064E05DAD, 3468607043, 54230, 1185171149, 63213, 1),
	(1192, 219, 1026, 4, 3, 3, 3, _binary 0x0000000000000000000000000000000062E05DAD, 3468607043, 54230, 1185171149, 62957, 1),
	(1645, 722, 1024, 16, 2, 3, 3, _binary 0x000000000000000000000000000000005CE05DAD, 3468607043, 54230, 2504806588, 54090, 1),
	(1876, 1007, 1025, 3, 3, 4, 3, _binary 0x0000000000000000000000000000000058E05DAD, 3468607043, 54230, 1168943389, 54090, 1),
	(1997, 1152, 1024, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000062E05DAD, 3468607043, 54230, 1144269297, 54090, 1),
	(2017, 1166, 1024, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000074E05DAD, 3468607043, 54230, 1144269297, 54346, 1);
/*!40000 ALTER TABLE `accounts_sessions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
