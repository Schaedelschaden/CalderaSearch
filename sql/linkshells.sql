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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table tpzdb.linkshells: 3 rows
/*!40000 ALTER TABLE `linkshells` DISABLE KEYS */;
INSERT INTO `linkshells` (`linkshellid`, `name`, `color`, `poster`, `message`, `messagetime`, `postrights`, `broken`) VALUES
	(1, 'LifeHapppens', 65535, 'Tierkaintwo', _binary 0x416C6C2036207072696D6520617661746172732061726520676F6F6420746F20676F2E205468656D697320616E64204C616368657369732042434E4D532061726520676F6F642E20416E642062656173746D616E206B696E67732061726520676F6F642C, 1615043542, 2, 0),
	(2, 'CalderaServer', 65284, '', NULL, 0, 2, 1),
	(3, 'CalderaServer', 61440, 'Khalum', _binary 0x57656C636F6D6520746F2043616C64657261277320736572766572206C696E6B7368656C6C2120506C6561736520626520636F757274656F757320746F2065616368206F7468657220616E6420686176652066756E21, 1601860543, 2, 0);
/*!40000 ALTER TABLE `linkshells` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
