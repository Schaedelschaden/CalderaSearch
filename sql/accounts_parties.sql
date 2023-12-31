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

-- Dumping data for table tpzdb.accounts_parties: ~7 rows (approximately)
/*!40000 ALTER TABLE `accounts_parties` DISABLE KEYS */;
INSERT INTO `accounts_parties` (`charid`, `partyid`, `partyflag`, `allianceid`, `timestamp`) VALUES
	(95, 137, 0, 0, '2022-11-28 11:55:43'),
	(137, 137, 4, 0, '2022-11-28 11:55:44'),
	(213, 213, 4, 0, '2022-11-28 10:36:15'),
	(218, 213, 0, 0, '2022-11-28 10:36:18'),
	(219, 213, 0, 0, '2022-11-28 10:36:15'),
	(1166, 1166, 4, 0, '2022-11-28 12:01:53');
/*!40000 ALTER TABLE `accounts_parties` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
