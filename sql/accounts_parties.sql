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

-- Dumping data for table tpzdb.accounts_parties: ~6 rows (approximately)
/*!40000 ALTER TABLE `accounts_parties` DISABLE KEYS */;
INSERT INTO `accounts_parties` (`charid`, `partyid`, `partyflag`, `allianceid`, `timestamp`) VALUES
	(155, 464, 256, 0, '2021-12-20 19:55:10'),
	(293, 293, 4, 0, '2021-12-20 15:35:31'),
	(330, 293, 0, 0, '2021-12-20 15:35:31'),
	(376, 376, 4, 0, '2021-12-20 20:32:47'),
	(464, 464, 4, 0, '2021-12-20 10:25:33'),
	(469, 469, 4, 0, '2021-12-20 18:51:21');
/*!40000 ALTER TABLE `accounts_parties` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
