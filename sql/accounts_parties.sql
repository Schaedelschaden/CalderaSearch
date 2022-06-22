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

-- Dumping structure for table tpzdb.accounts_parties
CREATE TABLE IF NOT EXISTS `accounts_parties` (
  `charid` int(10) unsigned NOT NULL DEFAULT 0,
  `partyid` int(10) unsigned NOT NULL DEFAULT 0,
  `partyflag` smallint(5) unsigned NOT NULL DEFAULT 0,
  `allianceid` int(10) unsigned NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`charid`),
  CONSTRAINT `accounts_parties_ibfk_1` FOREIGN KEY (`charid`) REFERENCES `accounts_sessions` (`charid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.accounts_parties: ~5 rows (approximately)
/*!40000 ALTER TABLE `accounts_parties` DISABLE KEYS */;
INSERT INTO `accounts_parties` (`charid`, `partyid`, `partyflag`, `allianceid`, `timestamp`) VALUES
	(45, 49, 0, 0, '2022-06-19 10:20:30'),
	(49, 49, 4, 0, '2022-06-19 10:20:30'),
	(610, 610, 4, 0, '2022-06-22 01:03:54'),
	(678, 610, 0, 0, '2022-06-22 01:04:11'),
	(722, 760, 0, 0, '2022-06-21 23:07:09'),
	(728, 760, 0, 0, '2022-06-21 22:44:00'),
	(729, 760, 0, 0, '2022-06-21 23:07:08'),
	(760, 760, 4, 0, '2022-06-21 21:44:02'),
	(835, 760, 0, 0, '2022-06-22 01:57:48'),
	(855, 760, 0, 0, '2022-06-21 22:51:32');
/*!40000 ALTER TABLE `accounts_parties` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
