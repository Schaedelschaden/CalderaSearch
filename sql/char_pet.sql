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

-- Dumping structure for table tpzdb.char_pet
CREATE TABLE IF NOT EXISTS `char_pet` (
  `charid` int(10) unsigned NOT NULL,
  `wyvernid` smallint(3) unsigned NOT NULL DEFAULT '32',
  `automatonid` smallint(3) unsigned NOT NULL DEFAULT '180',
  `unlocked_attachments` blob,
  `equipped_attachments` blob,
  `adventuringfellowid` smallint(3) unsigned NOT NULL DEFAULT '0',
  `chocoboid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.char_pet: 28 rows
/*!40000 ALTER TABLE `char_pet` DISABLE KEYS */;
INSERT INTO `char_pet` (`charid`, `wyvernid`, `automatonid`, `unlocked_attachments`, `equipped_attachments`, `adventuringfellowid`, `chocoboid`) VALUES
	(1, 32, 180, NULL, NULL, 0, 0),
	(2, 32, 180, NULL, NULL, 0, 0),
	(6, 32, 180, NULL, NULL, 0, 0),
	(4, 32, 180, NULL, NULL, 0, 0),
	(5, 32, 180, _binary 0x7E0F0000FEFF0700FEFF0700FEFF0100FE3F0000FE7F0000FE7F00007EFF00007E0F0000, _binary 0x220348454C10A6CD6D0000000000, 180, 0),
	(7, 0, 180, NULL, NULL, 0, 0),
	(8, 0, 180, _binary 0x7E0F0000FE070000FE070000FE0F0000FE070000FE070000FE0700007E0700007E030000, _binary 0x2203E8C6040345434205818284A2, 0, 0),
	(9, 0, 180, NULL, NULL, 0, 0),
	(10, 0, 180, _binary 0x7E0F0000FE070000FE070000FE0F0000FE070000FE070000FE0700007E0700007E030000, NULL, 0, 0),
	(11, 0, 180, NULL, NULL, 0, 0),
	(12, 0, 180, NULL, NULL, 0, 0),
	(13, 0, 180, NULL, NULL, 0, 0),
	(14, 0, 180, NULL, NULL, 0, 0),
	(15, 0, 180, NULL, NULL, 0, 0),
	(16, 0, 180, NULL, NULL, 0, 0),
	(17, 0, 180, NULL, NULL, 0, 0),
	(18, 0, 180, NULL, NULL, 0, 0),
	(19, 0, 180, _binary 0x7E0F0000FEFF0700FEFF0700FEFF0100FE3F0000FE7F0000FE7F00007EFF00007E0F0000, _binary 0x2001000000000000000000000000, 0, 0),
	(20, 0, 180, NULL, NULL, 0, 0),
	(21, 0, 180, NULL, NULL, 0, 0),
	(22, 0, 180, NULL, NULL, 0, 0),
	(28, 0, 180, NULL, NULL, 0, 0),
	(24, 0, 180, NULL, NULL, 0, 0),
	(27, 0, 180, NULL, NULL, 0, 0),
	(26, 0, 180, NULL, NULL, 0, 0),
	(29, 0, 180, NULL, NULL, 0, 0),
	(30, 0, 180, NULL, NULL, 0, 0),
	(31, 0, 180, NULL, NULL, 0, 0);
/*!40000 ALTER TABLE `char_pet` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
