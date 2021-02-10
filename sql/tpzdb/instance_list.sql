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

-- Dumping structure for table tpzdb.instance_list
CREATE TABLE IF NOT EXISTS `instance_list` (
  `instanceid` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `instance_name` varchar(35) NOT NULL DEFAULT '',
  `entrance_zone` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `time_limit` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `start_x` float(7,3) NOT NULL DEFAULT 0.000,
  `start_y` float(7,3) NOT NULL DEFAULT 0.000,
  `start_z` float(7,3) NOT NULL DEFAULT 0.000,
  `start_rot` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `music_day` smallint(3) NOT NULL DEFAULT -1,
  `music_night` smallint(3) NOT NULL DEFAULT -1,
  `battlesolo` smallint(3) NOT NULL DEFAULT -1,
  `battlemulti` smallint(3) NOT NULL DEFAULT -1,
  `instance_zone` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`instanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.instance_list: ~14 rows (approximately)
/*!40000 ALTER TABLE `instance_list` DISABLE KEYS */;
INSERT INTO `instance_list` (`instanceid`, `instance_name`, `entrance_zone`, `time_limit`, `start_x`, `start_y`, `start_z`, `start_rot`, `music_day`, `music_night`, `battlesolo`, `battlemulti`, `instance_zone`) VALUES
	(0, 'TEST', 0, 0, 0.000, 0.000, 0.000, 0, -1, -1, -1, -1, 0),
	(1, 'leujaoam_cleansing', 79, 30, 280.000, -7.500, 35.000, 195, -1, -1, -1, -1, 0),
	(12, 'preemptive_strike', 52, 30, -60.350, -5.000, 27.670, 46, -1, -1, -1, -1, 0),
	(21, 'excavation_duty', 61, 30, 124.999, -39.309, 19.999, 0, -1, -1, -1, -1, 0),
	(23, 'troll_fugitives', 61, 30, -459.912, -9.860, 342.319, 0, -1, -1, -1, -1, 0),
	(32, 'requiem', 79, 30, -458.409, -10.000, -320.966, 90, -1, -1, -1, -1, 0),
	(41, 'golden_salvage', 54, 30, 386.000, -12.000, 17.000, 46, -1, -1, -1, -1, 0),
	(43, 'extermination', 54, 30, 298.099, -3.943, 135.234, 149, -1, -1, -1, -1, 0),
	(53, 'the_black_coffin', 54, 30, 0.000, -22.000, 24.000, 64, -1, -1, -1, -1, 0),
	(54, 'against_all_odds', 54, 30, -9.000, -22.000, 17.000, 252, -1, -1, -1, -1, 0),
	(58, 'path_of_darkness', 72, 30, 500.000, 0.000, -572.000, 192, 143, 143, 143, 143, 0),
	(59, 'nashmeiras_plea', 72, 45, -444.000, -4.000, 420.000, 127, 143, 143, 143, 143, 0),
	(65, 'arrapago_remnants', 72, 100, 340.000, 0.000, -246.000, 63, -1, -1, -1, -1, 0),
	(79, 'shades_of_vengeance', 79, 30, 127.000, -15.000, -303.000, 0, -1, -1, -1, -1, 0);
/*!40000 ALTER TABLE `instance_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
