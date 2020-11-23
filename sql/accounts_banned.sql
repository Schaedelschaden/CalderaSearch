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

-- Dumping structure for table tpzdb.accounts_banned
CREATE TABLE IF NOT EXISTS `accounts_banned` (
  `accid` int(10) unsigned NOT NULL DEFAULT '0',
  `timebann` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timeunbann` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banncomment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`accid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.accounts_banned: 0 rows
/*!40000 ALTER TABLE `accounts_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_banned` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
