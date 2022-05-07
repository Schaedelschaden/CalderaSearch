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

-- Dumping data for table tpzdb.accounts_parties: ~12 rows (approximately)
/*!40000 ALTER TABLE `accounts_parties` DISABLE KEYS */;
INSERT INTO `accounts_parties` (`charid`, `partyid`, `partyflag`, `allianceid`, `timestamp`) VALUES
	(466, 479, 0, 0, '2022-05-07 14:09:02'),
	(479, 479, 4, 0, '2022-05-07 14:09:02'),
	(626, 626, 4, 0, '2022-05-07 07:08:48'),
	(627, 626, 0, 0, '2022-05-07 16:27:31'),
	(628, 626, 0, 0, '2022-05-07 16:27:47'),
	(629, 626, 0, 0, '2022-05-07 16:28:00'),
	(631, 626, 0, 0, '2022-05-07 07:08:54'),
	(632, 626, 0, 0, '2022-05-07 07:08:48'),
	(634, 634, 4, 0, '2022-05-07 16:03:47'),
	(635, 634, 0, 0, '2022-05-07 16:04:02'),
	(636, 634, 0, 0, '2022-05-07 16:03:47'),
	(654, 479, 0, 0, '2022-05-07 14:09:02'),
	(668, 668, 4, 0, '2022-05-07 10:23:13'),
	(705, 705, 4, 0, '2022-05-07 08:58:57'),
	(706, 705, 0, 0, '2022-05-07 07:39:04'),
	(707, 705, 0, 0, '2022-05-07 11:07:06'),
	(765, 765, 4, 0, '2022-05-07 10:32:36');
/*!40000 ALTER TABLE `accounts_parties` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
