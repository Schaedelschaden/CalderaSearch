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

-- Dumping structure for table tpzdb.char_style
CREATE TABLE IF NOT EXISTS `char_style` (
  `charid` int(10) unsigned NOT NULL,
  `head` smallint(5) unsigned NOT NULL DEFAULT '0',
  `body` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hands` smallint(5) unsigned NOT NULL DEFAULT '0',
  `legs` smallint(5) unsigned NOT NULL DEFAULT '0',
  `feet` smallint(5) unsigned NOT NULL DEFAULT '0',
  `main` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sub` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ranged` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20;

-- Dumping data for table tpzdb.char_style: 48 rows
/*!40000 ALTER TABLE `char_style` DISABLE KEYS */;
INSERT INTO `char_style` (`charid`, `head`, `body`, `hands`, `legs`, `feet`, `main`, `sub`, `ranged`) VALUES
	(1, 0, 0, 0, 0, 0, 0, 0, 0),
	(2, 0, 0, 0, 0, 0, 0, 0, 0),
	(6, 0, 0, 0, 0, 0, 0, 0, 0),
	(4, 0, 0, 0, 0, 0, 0, 0, 0),
	(5, 0, 0, 0, 0, 0, 0, 0, 0),
	(7, 0, 0, 0, 0, 0, 0, 0, 0),
	(8, 0, 0, 0, 0, 0, 0, 0, 0),
	(9, 13946, 23733, 23734, 23735, 23736, 21110, 27645, 0),
	(10, 23401, 26939, 23521, 23600, 27452, 20512, 22212, 0),
	(11, 0, 0, 0, 0, 0, 0, 0, 0),
	(12, 0, 0, 0, 0, 0, 0, 0, 0),
	(13, 0, 0, 0, 0, 0, 0, 0, 0),
	(14, 0, 0, 0, 0, 0, 0, 0, 0),
	(15, 0, 0, 0, 0, 0, 0, 0, 0),
	(16, 0, 0, 0, 0, 0, 0, 0, 0),
	(17, 0, 0, 0, 0, 0, 0, 0, 0),
	(18, 0, 0, 0, 0, 0, 0, 0, 0),
	(19, 0, 0, 0, 0, 0, 0, 0, 0),
	(20, 0, 0, 0, 0, 0, 0, 0, 0),
	(21, 0, 0, 0, 0, 0, 0, 0, 0),
	(22, 51988, 572, 0, 55952, 51988, 51988, 572, 0),
	(28, 0, 0, 0, 0, 0, 0, 0, 0),
	(24, 0, 0, 0, 0, 0, 0, 0, 0),
	(27, 0, 0, 0, 32728, 27232, 0, 0, 0),
	(26, 40314, 657, 0, 47754, 40314, 40314, 657, 0),
	(29, 0, 0, 0, 0, 0, 0, 0, 0),
	(30, 0, 0, 0, 0, 0, 0, 0, 0),
	(31, 0, 0, 0, 0, 0, 0, 0, 0),
	(32, 51801, 477, 0, 39539, 51801, 51801, 477, 0),
	(33, 0, 0, 0, 0, 0, 0, 0, 0),
	(34, 0, 0, 0, 0, 0, 0, 0, 0),
	(35, 0, 0, 0, 0, 0, 0, 0, 0),
	(36, 0, 4358, 0, 1156, 1, 0, 5, 0),
	(37, 0, 0, 0, 0, 0, 0, 0, 0),
	(39, 872, 37593, 19743, 30294, 19338, 34735, 38800, 6961),
	(40, 0, 0, 0, 0, 0, 0, 0, 0),
	(41, 0, 0, 0, 0, 0, 0, 0, 0),
	(42, 0, 0, 0, 0, 0, 0, 0, 0),
	(43, 0, 0, 0, 0, 0, 0, 0, 0),
	(44, 0, 0, 0, 0, 0, 0, 0, 0),
	(45, 0, 0, 0, 0, 0, 0, 0, 0),
	(46, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(47, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(48, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(49, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(50, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(51, 0, 0, 0, 0, 0, 0, 0, 0),
	(52, 52685, 52685, 52685, 52685, 52685, 52685, 52685, 52685);
/*!40000 ALTER TABLE `char_style` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
