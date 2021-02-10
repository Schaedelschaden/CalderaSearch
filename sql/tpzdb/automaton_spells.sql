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

-- Dumping structure for table tpzdb.automaton_spells
CREATE TABLE IF NOT EXISTS `automaton_spells` (
  `spellid` smallint(4) unsigned NOT NULL,
  `skilllevel` smallint(3) unsigned NOT NULL DEFAULT 0,
  `heads` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `enfeeble` smallint(4) unsigned NOT NULL DEFAULT 0,
  `immunity` smallint(4) unsigned NOT NULL DEFAULT 0,
  `removes` int(6) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=14;

-- Dumping data for table tpzdb.automaton_spells: 82 rows
/*!40000 ALTER TABLE `automaton_spells` DISABLE KEYS */;
INSERT INTO `automaton_spells` (`spellid`, `skilllevel`, `heads`, `enfeeble`, `immunity`, `removes`) VALUES
	(1, 12, 31, 0, 0, 136129),
	(2, 45, 31, 0, 0, 0),
	(3, 81, 31, 0, 0, 0),
	(4, 147, 31, 0, 0, 0),
	(5, 207, 16, 0, 0, 0),
	(6, 313, 16, 0, 0, 0),
	(14, 27, 16, 0, 0, 3),
	(15, 36, 16, 0, 0, 4),
	(16, 45, 16, 0, 0, 5),
	(17, 60, 16, 0, 0, 6),
	(18, 120, 16, 0, 0, 7),
	(19, 105, 16, 0, 0, 2079),
	(20, 90, 16, 0, 0, 594974),
	(23, 0, 61, 134, 0, 0),
	(24, 96, 61, 134, 0, 0),
	(43, 24, 24, 0, 0, 0),
	(44, 84, 24, 0, 0, 0),
	(45, 144, 24, 0, 0, 0),
	(46, 217, 24, 0, 0, 0),
	(47, 281, 16, 0, 0, 0),
	(48, 54, 24, 0, 0, 0),
	(49, 114, 24, 0, 0, 0),
	(50, 188, 24, 0, 0, 0),
	(51, 241, 24, 0, 0, 0),
	(52, 347, 24, 0, 0, 0),
	(54, 105, 8, 0, 0, 0),
	(56, 42, 61, 13, 128, 0),
	(57, 147, 24, 0, 0, 0),
	(58, 21, 61, 4, 32, 0),
	(59, 57, 61, 6, 16, 0),
	(106, 99, 8, 0, 0, 0),
	(108, 66, 16, 0, 0, 0),
	(110, 135, 16, 0, 0, 0),
	(111, 232, 16, 0, 0, 0),
	(129, 425, 16, 0, 0, 0),
	(134, 434, 16, 0, 0, 0),
	(143, 99, 16, 0, 0, 0),
	(144, 60, 40, 0, 0, 0),
	(145, 153, 40, 0, 0, 0),
	(146, 251, 40, 0, 0, 0),
	(147, 281, 40, 0, 0, 0),
	(148, 349, 32, 0, 0, 0),
	(149, 75, 40, 0, 0, 0),
	(150, 178, 40, 0, 0, 0),
	(151, 256, 40, 0, 0, 0),
	(152, 286, 40, 0, 0, 0),
	(153, 368, 32, 0, 0, 0),
	(154, 45, 40, 0, 0, 0),
	(155, 138, 40, 0, 0, 0),
	(156, 246, 40, 0, 0, 0),
	(157, 276, 40, 0, 0, 0),
	(158, 331, 32, 0, 0, 0),
	(159, 15, 40, 0, 0, 0),
	(160, 108, 40, 0, 0, 0),
	(161, 227, 40, 0, 0, 0),
	(162, 266, 40, 0, 0, 0),
	(163, 296, 32, 0, 0, 0),
	(164, 90, 40, 0, 0, 0),
	(165, 203, 40, 0, 0, 0),
	(166, 261, 40, 0, 0, 0),
	(167, 291, 40, 0, 0, 0),
	(168, 389, 32, 0, 0, 0),
	(169, 30, 40, 0, 0, 0),
	(170, 123, 40, 0, 0, 0),
	(171, 236, 40, 0, 0, 0),
	(172, 271, 40, 0, 0, 0),
	(173, 313, 32, 0, 0, 0),
	(220, 18, 61, 3, 256, 0),
	(221, 141, 57, 3, 256, 0),
	(230, 33, 61, 135, 0, 0),
	(231, 111, 61, 135, 0, 0),
	(245, 45, 32, 0, 0, 0),
	(247, 78, 32, 0, 0, 0),
	(248, 331, 32, 0, 0, 0),
	(254, 27, 61, 5, 64, 0),
	(260, 105, 8, 0, 0, 0),
	(270, 120, 32, 140, 0, 0),
	(277, 256, 32, 0, 0, 0),
	(286, 337, 61, 21, 0, 0),
	(477, 337, 16, 0, 0, 0),
	(511, 410, 8, 0, 0, 0),
	(847, 368, 32, 0, 0, 0);
/*!40000 ALTER TABLE `automaton_spells` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
