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

-- Dumping structure for table tpzdb.char_style
CREATE TABLE IF NOT EXISTS `char_style` (
  `charid` int(10) unsigned NOT NULL,
  `head` smallint(5) unsigned NOT NULL DEFAULT 0,
  `body` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hands` smallint(5) unsigned NOT NULL DEFAULT 0,
  `legs` smallint(5) unsigned NOT NULL DEFAULT 0,
  `feet` smallint(5) unsigned NOT NULL DEFAULT 0,
  `main` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sub` smallint(5) unsigned NOT NULL DEFAULT 0,
  `ranged` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20;

-- Dumping data for table tpzdb.char_style: 92 rows
/*!40000 ALTER TABLE `char_style` DISABLE KEYS */;
INSERT INTO `char_style` (`charid`, `head`, `body`, `hands`, `legs`, `feet`, `main`, `sub`, `ranged`) VALUES
	(1, 0, 0, 0, 0, 0, 0, 0, 0),
	(2, 0, 0, 0, 0, 0, 0, 0, 0),
	(6, 0, 0, 0, 0, 0, 0, 0, 0),
	(4, 0, 0, 0, 0, 0, 0, 0, 0),
	(5, 0, 0, 0, 0, 0, 0, 0, 0),
	(7, 0, 0, 0, 0, 0, 0, 0, 0),
	(8, 0, 0, 0, 0, 0, 0, 0, 0),
	(9, 13946, 11862, 23176, 12807, 12935, 21110, 27645, 0),
	(10, 0, 0, 0, 0, 0, 0, 0, 0),
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
	(32, 0, 0, 0, 0, 0, 0, 0, 0),
	(33, 0, 0, 0, 0, 0, 0, 0, 0),
	(34, 0, 0, 0, 0, 0, 0, 0, 0),
	(35, 0, 0, 0, 0, 0, 0, 0, 0),
	(36, 0, 4358, 0, 1156, 1, 0, 5, 0),
	(37, 0, 0, 0, 0, 0, 0, 0, 0),
	(39, 0, 0, 0, 0, 0, 0, 0, 0),
	(40, 0, 0, 0, 0, 0, 0, 0, 0),
	(57, 0, 0, 0, 0, 0, 0, 0, 0),
	(91, 0, 0, 0, 0, 0, 0, 0, 0),
	(43, 0, 0, 0, 0, 0, 0, 0, 0),
	(44, 0, 0, 0, 0, 0, 0, 0, 0),
	(45, 0, 0, 0, 0, 0, 0, 0, 0),
	(46, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(47, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(48, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(49, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(50, 16831, 491, 0, 15042, 16831, 16831, 491, 0),
	(51, 0, 0, 0, 0, 0, 0, 0, 0),
	(52, 0, 0, 0, 0, 0, 0, 0, 0),
	(53, 0, 0, 0, 0, 0, 0, 0, 0),
	(54, 25607, 26975, 27112, 27297, 27468, 0, 0, 0),
	(55, 13945, 10463, 10513, 28153, 28344, 21581, 28653, 21269),
	(56, 0, 0, 0, 0, 0, 0, 0, 0),
	(58, 0, 0, 0, 0, 0, 0, 0, 0),
	(59, 0, 0, 0, 0, 0, 0, 0, 0),
	(60, 11066, 11086, 11106, 11126, 11146, 18633, 0, 17389),
	(61, 10384, 12608, 12758, 12888, 13009, 16646, 16646, 0),
	(62, 25020, 497, 0, 15017, 25020, 25020, 497, 0),
	(63, 0, 0, 0, 0, 0, 0, 0, 0),
	(64, 0, 0, 0, 0, 0, 0, 0, 0),
	(65, 0, 0, 0, 0, 0, 0, 0, 0),
	(66, 0, 0, 0, 0, 0, 0, 0, 0),
	(68, 26745, 23444, 23511, 23578, 23645, 21103, 27645, 0),
	(67, 0, 0, 0, 0, 0, 0, 0, 0),
	(69, 0, 0, 0, 0, 0, 0, 0, 0),
	(70, 23732, 23733, 23734, 23735, 23736, 0, 0, 0),
	(71, 16070, 23480, 23547, 23614, 23681, 0, 0, 0),
	(72, 0, 0, 0, 0, 0, 0, 0, 0),
	(73, 0, 0, 0, 0, 0, 0, 0, 0),
	(74, 0, 0, 0, 0, 0, 0, 0, 0),
	(75, 0, 0, 0, 0, 0, 0, 0, 0),
	(76, 0, 0, 0, 0, 0, 0, 0, 0),
	(77, 0, 0, 0, 0, 0, 0, 0, 0),
	(78, 0, 0, 0, 0, 0, 0, 0, 0),
	(79, 0, 0, 0, 0, 0, 0, 0, 0),
	(80, 0, 0, 0, 0, 0, 0, 0, 0),
	(81, 0, 5, 0, 4096, 0, 0, 1158, 1),
	(82, 0, 0, 0, 0, 0, 0, 0, 0),
	(83, 0, 0, 0, 0, 0, 0, 0, 0),
	(84, 0, 0, 0, 0, 0, 0, 0, 0),
	(85, 26775, 26933, 27087, 27272, 23660, 20515, 20797, 0),
	(90, 0, 0, 0, 0, 0, 0, 0, 0),
	(87, 0, 0, 0, 0, 0, 0, 0, 0),
	(88, 0, 0, 0, 0, 0, 0, 0, 0),
	(89, 0, 5, 0, 4096, 0, 0, 1158, 1),
	(92, 0, 0, 0, 0, 0, 0, 0, 0),
	(93, 0, 0, 0, 0, 0, 0, 0, 0),
	(94, 0, 0, 0, 0, 0, 0, 0, 0),
	(95, 0, 0, 0, 0, 0, 0, 0, 0),
	(96, 59432, 25286, 57, 38528, 152, 0, 0, 0),
	(97, 0, 0, 0, 0, 0, 0, 0, 0),
	(98, 0, 0, 0, 0, 0, 0, 0, 0),
	(99, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `char_style` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
