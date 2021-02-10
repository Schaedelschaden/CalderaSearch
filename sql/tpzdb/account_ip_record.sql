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

-- Dumping structure for table tpzdb.account_ip_record
CREATE TABLE IF NOT EXISTS `account_ip_record` (
  `login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `accid` int(10) NOT NULL,
  `charid` int(10) NOT NULL,
  `client_ip` tinytext NOT NULL,
  PRIMARY KEY (`login_time`,`accid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.account_ip_record: ~8 rows (approximately)
/*!40000 ALTER TABLE `account_ip_record` DISABLE KEYS */;
INSERT INTO `account_ip_record` (`login_time`, `accid`, `charid`, `client_ip`) VALUES
	('2021-02-01 11:56:32', 1001, 5, '67.190.190.206'),
	('2021-02-01 11:57:56', 1001, 5, '67.190.190.206'),
	('2021-02-01 11:58:42', 1001, 5, '67.190.190.206'),
	('2021-02-01 12:00:48', 1001, 5, '67.190.190.206'),
	('2021-02-01 12:11:18', 1001, 5, '67.190.190.206'),
	('2021-02-01 12:25:08', 1001, 5, '67.190.190.206'),
	('2021-02-01 13:19:52', 1001, 5, '67.190.190.206'),
	('2021-02-01 13:33:00', 1001, 5, '67.190.190.206');
/*!40000 ALTER TABLE `account_ip_record` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
