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

-- Dumping structure for table tpzdb.accounts_banned
CREATE TABLE IF NOT EXISTS `accounts_banned` (
  `accid` int(10) unsigned NOT NULL DEFAULT 0,
  `timebann` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timeunbann` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banncomment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`accid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.accounts_banned: 6 rows
/*!40000 ALTER TABLE `accounts_banned` DISABLE KEYS */;
INSERT INTO `accounts_banned` (`accid`, `timebann`, `timeunbann`, `banncomment`) VALUES
	(1040, '2021-06-22 11:59:00', '2100-01-01 00:00:00', 'Zillion - Banned for using 3rd Party Tools which include Truesight and/or Radar Hack'),
	(1076, '2021-06-22 11:59:00', '2100-01-01 00:00:00', 'Zillion Alt - Banned for using 3rd Party Tools which include Truesight and/or Radar Hack'),
	(1167, '2022-03-26 11:59:00', '2100-01-01 00:00:00', 'Preciosa Alt - Banned for toxicity and being a demanding, unhelpful pain in the ass'),
	(1087, '2022-03-26 11:59:00', '2100-01-01 00:00:00', 'Preciosa Alt - Banned for toxicity and being a demanding, unhelpful pain in the ass'),
	(1089, '2022-03-26 11:59:00', '2100-01-01 00:00:00', 'Preciosa Alt - Banned for toxicity and being a demanding, unhelpful pain in the ass'),
	(1090, '2022-03-26 11:59:00', '2100-01-01 00:00:00', 'Preciosa - Banned for toxicity and being a demanding, unhelpful pain in the ass');
/*!40000 ALTER TABLE `accounts_banned` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
