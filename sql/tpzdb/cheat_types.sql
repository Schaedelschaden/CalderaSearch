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

-- Dumping structure for table tpzdb.cheat_types
CREATE TABLE IF NOT EXISTS `cheat_types` (
  `cheatid` int(10) unsigned NOT NULL,
  `name` varchar(15) NOT NULL,
  `description` varchar(128) NOT NULL,
  `argument` int(10) unsigned NOT NULL,
  `action_bitmask` int(10) unsigned NOT NULL,
  `warning_message` varchar(128) NOT NULL,
  PRIMARY KEY (`cheatid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.cheat_types: 1 rows
/*!40000 ALTER TABLE `cheat_types` DISABLE KEYS */;
INSERT INTO `cheat_types` (`cheatid`, `name`, `description`, `argument`, `action_bitmask`, `warning_message`) VALUES
	(1, 'FASTSYNTH', 'Player injects a synth done (0x59) packet to perform synth and craft skillups faster than the game allows.', 0, 7, 'A fast craft cheating attempt has been attempted. Successful craft has been blocked and the incident will be reported.');
/*!40000 ALTER TABLE `cheat_types` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
