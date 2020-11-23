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

-- Dumping structure for table tpzdb.skill_ranks
CREATE TABLE IF NOT EXISTS `skill_ranks` (
  `skillid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `name` char(12) DEFAULT NULL,
  `war` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `mnk` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `whm` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `blm` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rdm` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `thf` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pld` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `drk` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `bst` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `brd` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rng` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sam` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `nin` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `drg` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `smn` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `blu` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `cor` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pup` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `dnc` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sch` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `geo` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `run` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`skillid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=44 PACK_KEYS=1;

-- Dumping data for table tpzdb.skill_ranks: 33 rows
/*!40000 ALTER TABLE `skill_ranks` DISABLE KEYS */;
INSERT INTO `skill_ranks` (`skillid`, `name`, `war`, `mnk`, `whm`, `blm`, `rdm`, `thf`, `pld`, `drk`, `bst`, `brd`, `rng`, `sam`, `nin`, `drg`, `smn`, `blu`, `cor`, `pup`, `dnc`, `sch`, `geo`, `run`) VALUES
	(1, 'hand2hand', 9, 1, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 1, 9, 0, 0, 0),
	(2, 'dagger', 5, 0, 0, 9, 4, 1, 8, 7, 6, 5, 5, 10, 6, 10, 10, 0, 3, 8, 1, 9, 8, 0),
	(3, 'sword', 4, 0, 0, 0, 4, 9, 1, 5, 10, 8, 9, 6, 7, 8, 0, 1, 5, 0, 9, 0, 0, 2),
	(4, 'great sword', 3, 0, 0, 0, 0, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(5, 'axe', 2, 0, 0, 0, 0, 0, 0, 5, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5),
	(6, 'great axe', 1, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4),
	(7, 'scythe', 3, 0, 0, 10, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(8, 'polearm', 5, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
	(9, 'katana', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(10, 'great katana', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(11, 'club', 5, 6, 3, 6, 9, 10, 2, 8, 9, 9, 10, 10, 10, 10, 6, 5, 0, 9, 0, 6, 3, 8),
	(12, 'staff', 4, 4, 6, 5, 0, 0, 2, 0, 0, 6, 0, 0, 0, 5, 4, 0, 0, 0, 0, 6, 6, 0),
	(25, 'archery', 9, 0, 0, 0, 9, 8, 0, 0, 0, 0, 2, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(26, 'marksmanship', 9, 0, 0, 0, 0, 6, 0, 10, 0, 0, 2, 0, 7, 0, 0, 0, 4, 0, 0, 0, 0, 0),
	(27, 'throwing', 9, 10, 10, 9, 11, 9, 0, 0, 0, 10, 8, 6, 1, 0, 0, 0, 6, 6, 6, 9, 0, 0),
	(28, 'guarding', 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0),
	(29, 'evasion', 7, 3, 10, 10, 9, 1, 7, 7, 7, 9, 10, 3, 2, 4, 10, 8, 9, 4, 3, 10, 9, 3),
	(30, 'shield', 6, 0, 9, 0, 11, 11, 1, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(31, 'parrying', 8, 10, 0, 0, 10, 2, 7, 10, 7, 10, 0, 2, 2, 5, 0, 9, 2, 9, 4, 10, 10, 1),
	(32, 'divine', 0, 0, 2, 0, 10, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 4),
	(33, 'healing', 0, 0, 1, 0, 8, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0),
	(34, 'enhancing', 0, 0, 6, 10, 3, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 5),
	(35, 'enfeebling', 0, 0, 7, 6, 1, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 6, 0),
	(36, 'elemental', 0, 0, 0, 1, 6, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 3, 0),
	(37, 'dark', 0, 0, 0, 2, 10, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 7, 0),
	(38, 'summoning', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0),
	(39, 'ninjutsu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(40, 'singing', 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(41, 'string', 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(42, 'wind', 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(43, 'blue', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
	(44, 'geomancy', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0),
	(45, 'handbell', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0);
/*!40000 ALTER TABLE `skill_ranks` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
