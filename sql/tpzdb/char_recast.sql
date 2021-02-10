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

-- Dumping structure for table tpzdb.char_recast
CREATE TABLE IF NOT EXISTS `char_recast` (
  `charid` int(10) unsigned NOT NULL,
  `id` smallint(5) NOT NULL DEFAULT 0,
  `time` int(10) NOT NULL DEFAULT 0,
  `recast` smallint(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`charid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table tpzdb.char_recast: 23 rows
/*!40000 ALTER TABLE `char_recast` DISABLE KEYS */;
INSERT INTO `char_recast` (`charid`, `id`, `time`, `recast`) VALUES
	(5, 0, 1612211584, 0),
	(5, 135, 1612211584, 0),
	(5, 133, 1612211584, 0),
	(5, 138, 1612211584, 0),
	(5, 134, 1612211584, 0),
	(5, 139, 1612211584, 0),
	(5, 140, 1612211584, 0),
	(5, 132, 1612211584, 0),
	(5, 136, 1612211584, 0),
	(5, 137, 1612211584, 0),
	(5, 141, 1612211584, 0),
	(5, 53, 1612211584, 0),
	(5, 54, 1612211584, 0),
	(5, 254, 1612211584, 0),
	(5, 142, 1612206053, 0),
	(5, 143, 1612206053, 0),
	(5, 92, 1612211584, 0),
	(5, 10, 1612211584, 0),
	(5, 24, 1612211584, 0),
	(5, 23, 1612211584, 0),
	(5, 59, 1612211584, 0),
	(5, 241, 1612211584, 0),
	(5, 25, 1612211584, 0);
/*!40000 ALTER TABLE `char_recast` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
