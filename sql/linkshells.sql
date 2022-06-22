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

-- Dumping structure for table tpzdb.linkshells
CREATE TABLE IF NOT EXISTS `linkshells` (
  `linkshellid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `color` smallint(5) unsigned NOT NULL DEFAULT 61440,
  `poster` varchar(15) NOT NULL DEFAULT '',
  `message` blob DEFAULT NULL,
  `messagetime` int(10) unsigned NOT NULL DEFAULT 0,
  `postrights` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `broken` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`linkshellid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table tpzdb.linkshells: 21 rows
/*!40000 ALTER TABLE `linkshells` DISABLE KEYS */;
INSERT INTO `linkshells` (`linkshellid`, `name`, `color`, `poster`, `message`, `messagetime`, `postrights`, `broken`) VALUES
	(1, 'LifeHapppens', 65535, 'Tierkaintwo', _binary 0x416C6C207472757374732068617665206265656E2072657365742E205573652021616464616C6C74727573747320746F2067657420616C6C20776F726B696E6720747275737473, 1616974507, 2, 0),
	(2, 'CalderaServer', 65284, '', NULL, 0, 2, 1),
	(3, 'CalderaServer', 61440, 'Khalum', _binary 0x57656C636F6D6520746F2043616C64657261277320736572766572206C696E6B7368656C6C2120506C6561736520626520636F757274656F757320746F2065616368206F7468657220616E6420686176652066756E21, 1601860543, 2, 0),
	(4, 'Dirteaters', 65392, 'Tierkaintwo', _binary 0x4E65656420736F6D65776865726520617761792066726F6D20746865207269666672616666, 1616981290, 2, 0),
	(5, 'Tempest', 63155, '', NULL, 0, 2, 1),
	(6, 'Tempest', 63089, '', NULL, 0, 2, 0),
	(7, 'HeroesOfOurTime', 65280, 'Gigabite', _binary 0x77656C636F6D65, 1619252156, 2, 0),
	(8, 'TheUnderground', 61518, 'Prizefighter', _binary 0x54686973206973207468652072656D697821, 1620102106, 2, 0),
	(9, 'Madness', 63479, 'Devilcat', _binary 0x4D656F772E20456E6A6F792079657273656C663C33202D2D2D2D2D2D2D2D2D20, 1620378512, 2, 0),
	(10, 'AnimalFarm', 61576, '', NULL, 0, 2, 0),
	(11, 'MoogleClub', 65523, '', NULL, 0, 2, 0),
	(12, 'MentalHospital', 65484, '', NULL, 0, 2, 0),
	(13, 'Theothers', 65535, '', NULL, 0, 2, 0),
	(14, 'PeneArmy', 65360, '', NULL, 0, 2, 0),
	(15, 'jediorder', 65344, '', NULL, 0, 2, 1),
	(16, 'JovaRefugees', 61647, 'Pheliont', _binary 0x57656C636F6D6520746F207468652052656675676565732E20486176652066756E21, 1655406098, 2, 0),
	(17, 'Thrall', 64113, '', NULL, 0, 2, 0),
	(18, 'Bombtoss', 61467, '', NULL, 0, 2, 0),
	(19, 'AcesPlace', 65523, 'Vengeanceace', _binary 0x54656C6C206D6520492063616E27742C20616E642069276C6C2070726F766520746F20796F7520492063616E2E20, 1651720454, 2, 0),
	(20, 'Friendos', 65391, '', NULL, 0, 2, 0),
	(21, 'Miyamoto', 61455, '', NULL, 0, 2, 0);
/*!40000 ALTER TABLE `linkshells` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
