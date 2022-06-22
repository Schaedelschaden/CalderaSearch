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

-- Dumping data for table tpzdb.accounts_sessions: ~10 rows (approximately)
/*!40000 ALTER TABLE `accounts_sessions` DISABLE KEYS */;
INSERT INTO `accounts_sessions` (`accid`, `charid`, `targid`, `linkshellid1`, `linkshellrank1`, `linkshellid2`, `linkshellrank2`, `session_key`, `server_addr`, `server_port`, `client_addr`, `client_port`, `version_mismatch`) VALUES
	(1029, 45, 1025, 4, 2, 3, 3, _binary 0x000000000000000000000000000000005AE05DAD, 3468607043, 54230, 1288729064, 54346, 1),
	(1033, 49, 1024, 4, 2, 3, 3, _binary 0x000000000000000000000000000000005AE05DAD, 3468607043, 54230, 1288729064, 54090, 1),
	(1054, 69, 1024, 4, 2, 3, 3, _binary 0x0000000000000000000000000000000058E05DAD, 3468607043, 54230, 1111856371, 54090, 0),
	(1194, 220, 1026, 4, 3, 3, 3, _binary 0x0000000000000000000000000000000086E05DAD, 3468607043, 54230, 2504263545, 54815, 1),
	(1545, 610, 1024, 0, 0, 3, 3, _binary 0x0000000000000000000000000000000058E05DAD, 3468607043, 54230, 1997363122, 36579, 1),
	(1605, 678, 1025, 0, 0, 0, 0, _binary 0x0000000000000000000000000000000068E05DAD, 3468607043, 54230, 1997363122, 53775, 1),
	(1645, 722, 1024, 16, 3, 3, 3, _binary 0x00000000000000000000000000000000A2E05DAD, 3468607043, 54230, 0409947543, 54090, 1),
	(1646, 728, 1025, 16, 3, 3, 3, _binary 0x00000000000000000000000000000000AEE05DAD, 3468607043, 54230, 0409947543, 54346, 1),
	(1650, 729, 1026, 16, 3, 3, 3, _binary 0x00000000000000000000000000000000ACE05DAD, 3468607043, 54230, 0409947543, 54602, 1),
	(1218, 760, 1028, 3, 3, 0, 0, _binary 0x00000000000000000000000000000000BEE25DAD, 3468607043, 54230, 0790783073, 54346, 1),
	(1732, 835, 1029, 0, 0, 0, 0, _binary 0x000000000000000000000000000000005AE25DAD, 3468607043, 54230, 0790783073, 54602, 1),
	(1733, 836, 1025, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000068E25DAD, 3468607043, 54230, 0790783073, 54090, 1),
	(1749, 855, 1027, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000034E15DAD, 3468607043, 54230, 1216671408, 54090, 1),
	(1768, 876, 1025, 3, 3, 0, 0, _binary 0x0000000000000000000000000000000058E05DAD, 3468607043, 54230, 1951824484, 54090, 1);
/*!40000 ALTER TABLE `accounts_sessions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
