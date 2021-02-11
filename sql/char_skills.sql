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

-- Dumping structure for table tpzdb.char_skills
CREATE TABLE IF NOT EXISTS `char_skills` (
  `charid` int(10) unsigned NOT NULL,
  `skillid` tinyint(2) unsigned NOT NULL,
  `value` smallint(4) unsigned NOT NULL DEFAULT 0,
  `rank` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`charid`,`skillid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=10;

-- Dumping data for table tpzdb.char_skills: 1,895 rows
/*!40000 ALTER TABLE `char_skills` DISABLE KEYS */;
INSERT INTO `char_skills` (`charid`, `skillid`, `value`, `rank`) VALUES
	(1, 36, 5000, 0),
	(1, 1, 5000, 0),
	(1, 2, 5000, 0),
	(1, 3, 5000, 0),
	(1, 4, 5000, 0),
	(1, 5, 5000, 0),
	(1, 6, 5000, 0),
	(1, 7, 5000, 0),
	(1, 8, 5000, 0),
	(1, 9, 5000, 0),
	(1, 10, 5000, 0),
	(1, 11, 5000, 0),
	(1, 12, 5000, 0),
	(1, 13, 5000, 0),
	(1, 14, 5000, 0),
	(1, 15, 5000, 0),
	(1, 16, 5000, 0),
	(1, 17, 5000, 0),
	(1, 18, 5000, 0),
	(1, 19, 5000, 0),
	(1, 20, 5000, 0),
	(1, 21, 5000, 0),
	(1, 22, 5000, 0),
	(1, 23, 5000, 0),
	(1, 24, 5000, 0),
	(1, 25, 5000, 0),
	(1, 26, 5000, 0),
	(1, 27, 5000, 0),
	(1, 28, 5000, 0),
	(1, 29, 5000, 0),
	(1, 30, 5000, 0),
	(1, 31, 5000, 0),
	(1, 32, 5000, 0),
	(1, 33, 5000, 0),
	(1, 34, 5000, 0),
	(1, 35, 5000, 0),
	(1, 37, 5000, 0),
	(1, 38, 5000, 0),
	(1, 39, 5000, 0),
	(1, 40, 5000, 0),
	(1, 41, 5000, 0),
	(1, 42, 5000, 0),
	(1, 43, 5000, 0),
	(1, 44, 5000, 0),
	(2, 36, 36, 0),
	(2, 29, 24, 0),
	(4, 1, 5000, 0),
	(4, 28, 5000, 0),
	(4, 29, 5000, 0),
	(5, 31, 5000, 0),
	(5, 5, 5000, 0),
	(5, 29, 5000, 0),
	(5, 30, 5000, 0),
	(5, 28, 5000, 0),
	(5, 1, 5000, 0),
	(5, 2, 5000, 0),
	(5, 3, 5000, 0),
	(5, 4, 5000, 0),
	(5, 6, 5000, 0),
	(5, 7, 5000, 0),
	(5, 8, 5000, 0),
	(5, 9, 5000, 0),
	(5, 10, 5000, 0),
	(5, 11, 5000, 0),
	(5, 12, 5000, 0),
	(5, 13, 5000, 0),
	(5, 14, 5000, 0),
	(5, 15, 5000, 0),
	(5, 16, 5000, 0),
	(5, 17, 5000, 0),
	(5, 18, 5000, 0),
	(5, 19, 5000, 0),
	(5, 20, 5000, 0),
	(5, 21, 5000, 0),
	(5, 22, 5000, 0),
	(5, 23, 5000, 0),
	(5, 24, 5000, 0),
	(5, 25, 5000, 0),
	(5, 26, 5000, 0),
	(5, 27, 5000, 0),
	(5, 32, 5000, 0),
	(5, 33, 5000, 0),
	(5, 34, 5000, 0),
	(5, 35, 5000, 0),
	(5, 36, 5000, 0),
	(5, 37, 5000, 0),
	(5, 38, 5000, 0),
	(5, 39, 5000, 0),
	(5, 40, 5000, 0),
	(5, 41, 5000, 0),
	(5, 42, 5000, 0),
	(5, 43, 5000, 0),
	(5, 44, 5000, 0),
	(6, 36, 435, 0),
	(6, 29, 255, 0),
	(11, 29, 3, 0),
	(10, 1, 5000, 0),
	(10, 2, 5000, 0),
	(10, 3, 5000, 0),
	(10, 4, 5000, 0),
	(10, 5, 5000, 0),
	(10, 6, 5000, 0),
	(10, 7, 5000, 0),
	(10, 8, 5000, 0),
	(10, 9, 5000, 0),
	(10, 10, 5000, 0),
	(10, 11, 5000, 0),
	(10, 12, 5000, 0),
	(10, 13, 5000, 0),
	(10, 14, 5000, 0),
	(10, 15, 5000, 0),
	(10, 16, 5000, 0),
	(10, 17, 5000, 0),
	(10, 18, 5000, 0),
	(10, 19, 5000, 0),
	(10, 20, 5000, 0),
	(10, 21, 5000, 0),
	(10, 22, 5000, 0),
	(10, 23, 5000, 0),
	(10, 24, 5000, 0),
	(10, 25, 5000, 0),
	(10, 26, 5000, 0),
	(10, 27, 5000, 0),
	(10, 28, 5000, 0),
	(10, 29, 5000, 0),
	(10, 30, 5000, 0),
	(10, 31, 5000, 0),
	(10, 32, 5000, 0),
	(10, 33, 5000, 0),
	(10, 34, 5000, 0),
	(10, 35, 5000, 0),
	(10, 36, 5000, 0),
	(10, 37, 5000, 0),
	(10, 38, 5000, 0),
	(10, 39, 5000, 0),
	(10, 40, 5000, 0),
	(10, 41, 5000, 0),
	(10, 42, 5000, 0),
	(10, 43, 5000, 0),
	(10, 44, 5000, 0),
	(12, 1, 5000, 0),
	(12, 2, 5000, 0),
	(12, 3, 5000, 0),
	(12, 4, 5000, 0),
	(12, 5, 5000, 0),
	(12, 6, 5000, 0),
	(12, 7, 5000, 0),
	(12, 8, 5000, 0),
	(12, 9, 5000, 0),
	(12, 10, 5000, 0),
	(12, 11, 5000, 0),
	(12, 12, 5000, 0),
	(12, 13, 5000, 0),
	(12, 14, 5000, 0),
	(12, 15, 5000, 0),
	(12, 16, 5000, 0),
	(12, 17, 5000, 0),
	(12, 18, 5000, 0),
	(12, 19, 5000, 0),
	(12, 20, 5000, 0),
	(12, 21, 5000, 0),
	(12, 22, 5000, 0),
	(12, 23, 5000, 0),
	(12, 24, 5000, 0),
	(12, 25, 5000, 0),
	(12, 26, 5000, 0),
	(12, 27, 5000, 0),
	(12, 28, 5000, 0),
	(12, 29, 5000, 0),
	(12, 30, 5000, 0),
	(12, 31, 5000, 0),
	(12, 32, 5000, 0),
	(12, 33, 5000, 0),
	(12, 34, 5000, 0),
	(12, 35, 5000, 0),
	(12, 36, 5000, 0),
	(12, 37, 5000, 0),
	(12, 38, 5000, 0),
	(12, 39, 5000, 0),
	(12, 40, 5000, 0),
	(12, 41, 5000, 0),
	(12, 42, 5000, 0),
	(12, 43, 5000, 0),
	(12, 44, 5000, 0),
	(7, 1, 5000, 0),
	(7, 2, 5000, 0),
	(7, 3, 5000, 0),
	(7, 4, 5000, 0),
	(7, 5, 5000, 0),
	(7, 6, 5000, 0),
	(7, 7, 5000, 0),
	(7, 8, 5000, 0),
	(7, 9, 5000, 0),
	(7, 10, 5000, 0),
	(7, 11, 5000, 0),
	(7, 12, 5000, 0),
	(7, 13, 5000, 0),
	(7, 14, 5000, 0),
	(7, 15, 5000, 0),
	(7, 16, 5000, 0),
	(7, 17, 5000, 0),
	(7, 18, 5000, 0),
	(7, 19, 5000, 0),
	(7, 20, 5000, 0),
	(7, 21, 5000, 0),
	(7, 22, 5000, 0),
	(7, 23, 5000, 0),
	(7, 24, 5000, 0),
	(7, 25, 5000, 0),
	(7, 26, 5000, 0),
	(7, 27, 5000, 0),
	(7, 28, 5000, 0),
	(7, 29, 5000, 0),
	(7, 30, 5000, 0),
	(7, 31, 5000, 0),
	(7, 32, 5000, 0),
	(7, 33, 5000, 0),
	(7, 34, 5000, 0),
	(7, 35, 5000, 0),
	(7, 36, 5000, 0),
	(7, 37, 5000, 0),
	(7, 38, 5000, 0),
	(7, 39, 5000, 0),
	(7, 40, 5000, 0),
	(7, 41, 5000, 0),
	(7, 42, 5000, 0),
	(7, 43, 5000, 0),
	(7, 44, 5000, 0),
	(9, 1, 5000, 0),
	(9, 2, 5000, 0),
	(9, 3, 5000, 0),
	(9, 4, 5000, 0),
	(9, 5, 5000, 0),
	(9, 6, 5000, 0),
	(9, 7, 5000, 0),
	(9, 8, 5000, 0),
	(9, 9, 5000, 0),
	(9, 10, 5000, 0),
	(9, 11, 5000, 0),
	(9, 12, 5000, 0),
	(9, 13, 5000, 0),
	(9, 14, 5000, 0),
	(9, 15, 5000, 0),
	(9, 16, 5000, 0),
	(9, 17, 5000, 0),
	(9, 18, 5000, 0),
	(9, 19, 5000, 0),
	(9, 20, 5000, 0),
	(9, 21, 5000, 0),
	(9, 22, 5000, 0),
	(9, 23, 5000, 0),
	(9, 24, 5000, 0),
	(9, 25, 5000, 0),
	(9, 26, 5000, 0),
	(9, 27, 5000, 0),
	(9, 28, 5000, 0),
	(9, 29, 5000, 0),
	(9, 30, 5000, 0),
	(9, 31, 5000, 0),
	(9, 32, 5000, 0),
	(9, 33, 5000, 0),
	(9, 34, 5000, 0),
	(9, 35, 5000, 0),
	(9, 36, 5000, 0),
	(9, 37, 5000, 0),
	(9, 38, 5000, 0),
	(9, 39, 5000, 0),
	(9, 40, 5000, 0),
	(9, 41, 5000, 0),
	(9, 42, 5000, 0),
	(9, 43, 5000, 0),
	(9, 44, 5000, 0),
	(8, 1, 5000, 0),
	(8, 2, 5000, 0),
	(8, 3, 5000, 0),
	(8, 4, 5000, 0),
	(8, 5, 5000, 0),
	(8, 6, 5000, 0),
	(8, 7, 5000, 0),
	(8, 8, 5000, 0),
	(8, 9, 5000, 0),
	(8, 10, 5000, 0),
	(8, 11, 5000, 0),
	(8, 12, 5000, 0),
	(8, 13, 5000, 0),
	(8, 14, 5000, 0),
	(8, 15, 5000, 0),
	(8, 16, 5000, 0),
	(8, 17, 5000, 0),
	(8, 18, 5000, 0),
	(8, 19, 5000, 0),
	(8, 20, 5000, 0),
	(8, 21, 5000, 0),
	(8, 22, 5000, 0),
	(8, 23, 5000, 0),
	(8, 24, 5000, 0),
	(8, 25, 5000, 0),
	(8, 26, 5000, 0),
	(8, 27, 5000, 0),
	(8, 28, 5000, 0),
	(8, 29, 5000, 0),
	(8, 30, 5000, 0),
	(8, 31, 5000, 0),
	(8, 32, 5000, 0),
	(8, 33, 5000, 0),
	(8, 34, 5000, 0),
	(8, 35, 5000, 0),
	(8, 36, 5000, 0),
	(8, 37, 5000, 0),
	(8, 38, 5000, 0),
	(8, 39, 5000, 0),
	(8, 40, 5000, 0),
	(8, 41, 5000, 0),
	(8, 42, 5000, 0),
	(8, 43, 5000, 0),
	(8, 44, 5000, 0),
	(13, 1, 5000, 0),
	(13, 2, 5000, 0),
	(13, 3, 5000, 0),
	(13, 4, 5000, 0),
	(13, 5, 5000, 0),
	(13, 6, 5000, 0),
	(13, 7, 5000, 0),
	(13, 8, 5000, 0),
	(13, 9, 5000, 0),
	(13, 10, 5000, 0),
	(13, 11, 5000, 0),
	(13, 12, 5000, 0),
	(13, 13, 5000, 0),
	(13, 14, 5000, 0),
	(13, 15, 5000, 0),
	(13, 16, 5000, 0),
	(13, 17, 5000, 0),
	(13, 18, 5000, 0),
	(13, 19, 5000, 0),
	(13, 20, 5000, 0),
	(13, 21, 5000, 0),
	(13, 22, 5000, 0),
	(13, 23, 5000, 0),
	(13, 24, 5000, 0),
	(13, 25, 5000, 0),
	(13, 26, 5000, 0),
	(13, 27, 5000, 0),
	(13, 28, 5000, 0),
	(13, 29, 5000, 0),
	(13, 30, 5000, 0),
	(13, 31, 5000, 0),
	(13, 32, 5000, 0),
	(13, 33, 5000, 0),
	(13, 34, 5000, 0),
	(13, 35, 5000, 0),
	(13, 36, 5000, 0),
	(13, 37, 5000, 0),
	(13, 38, 5000, 0),
	(13, 39, 5000, 0),
	(13, 40, 5000, 0),
	(13, 41, 5000, 0),
	(13, 42, 5000, 0),
	(13, 43, 5000, 0),
	(13, 44, 5000, 0),
	(15, 2, 2868, 0),
	(15, 31, 210, 0),
	(15, 29, 189, 0),
	(14, 6, 5000, 0),
	(14, 31, 5000, 0),
	(14, 29, 5000, 0),
	(16, 2, 5000, 0),
	(16, 31, 5000, 0),
	(16, 29, 5000, 0),
	(16, 4, 5000, 0),
	(16, 7, 5000, 0),
	(16, 1, 5000, 0),
	(16, 3, 5000, 0),
	(16, 5, 5000, 0),
	(16, 6, 5000, 0),
	(16, 8, 5000, 0),
	(16, 9, 5000, 0),
	(16, 10, 5000, 0),
	(16, 11, 5000, 0),
	(16, 12, 5000, 0),
	(16, 13, 5000, 0),
	(16, 14, 5000, 0),
	(16, 15, 5000, 0),
	(16, 16, 5000, 0),
	(16, 17, 5000, 0),
	(16, 18, 5000, 0),
	(16, 19, 5000, 0),
	(16, 20, 5000, 0),
	(16, 21, 5000, 0),
	(16, 22, 5000, 0),
	(16, 23, 5000, 0),
	(16, 24, 5000, 0),
	(16, 25, 5000, 0),
	(16, 26, 5000, 0),
	(16, 27, 5000, 0),
	(16, 28, 5000, 0),
	(16, 30, 5000, 0),
	(16, 32, 5000, 0),
	(16, 33, 5000, 0),
	(16, 34, 5000, 0),
	(16, 35, 5000, 0),
	(16, 36, 5000, 0),
	(16, 37, 5000, 0),
	(16, 38, 5000, 0),
	(16, 39, 5000, 0),
	(16, 40, 5000, 0),
	(16, 41, 5000, 0),
	(16, 42, 5000, 0),
	(16, 43, 5000, 0),
	(16, 44, 5000, 0),
	(17, 1, 5000, 0),
	(17, 2, 5000, 0),
	(17, 3, 5000, 0),
	(17, 4, 5000, 0),
	(17, 5, 5000, 0),
	(17, 6, 5000, 0),
	(17, 7, 5000, 0),
	(17, 8, 5000, 0),
	(17, 9, 5000, 0),
	(17, 10, 5000, 0),
	(17, 11, 5000, 0),
	(17, 12, 5000, 0),
	(17, 13, 5000, 0),
	(17, 14, 5000, 0),
	(17, 15, 5000, 0),
	(17, 16, 5000, 0),
	(17, 17, 5000, 0),
	(17, 18, 5000, 0),
	(17, 19, 5000, 0),
	(17, 20, 5000, 0),
	(17, 21, 5000, 0),
	(17, 22, 5000, 0),
	(17, 23, 5000, 0),
	(17, 24, 5000, 0),
	(17, 25, 5000, 0),
	(17, 26, 5000, 0),
	(17, 27, 5000, 0),
	(17, 28, 5000, 0),
	(17, 29, 5000, 0),
	(17, 30, 5000, 0),
	(17, 31, 5000, 0),
	(17, 32, 5000, 0),
	(17, 33, 5000, 0),
	(17, 34, 5000, 0),
	(17, 35, 5000, 0),
	(17, 36, 5000, 0),
	(17, 37, 5000, 0),
	(17, 38, 5000, 0),
	(17, 39, 5000, 0),
	(17, 40, 5000, 0),
	(17, 41, 5000, 0),
	(17, 42, 5000, 0),
	(17, 43, 5000, 0),
	(17, 44, 5000, 0),
	(14, 1, 5000, 0),
	(14, 2, 5000, 0),
	(14, 3, 5000, 0),
	(14, 4, 5000, 0),
	(14, 5, 5000, 0),
	(14, 7, 5000, 0),
	(14, 8, 5000, 0),
	(14, 9, 5000, 0),
	(14, 10, 5000, 0),
	(14, 11, 5000, 0),
	(14, 12, 5000, 0),
	(14, 13, 5000, 0),
	(14, 14, 5000, 0),
	(14, 15, 5000, 0),
	(14, 16, 5000, 0),
	(14, 17, 5000, 0),
	(14, 18, 5000, 0),
	(14, 19, 5000, 0),
	(14, 20, 5000, 0),
	(14, 21, 5000, 0),
	(14, 22, 5000, 0),
	(14, 23, 5000, 0),
	(14, 24, 5000, 0),
	(14, 25, 5000, 0),
	(14, 26, 5000, 0),
	(14, 27, 5000, 0),
	(14, 28, 5000, 0),
	(14, 30, 5000, 0),
	(14, 32, 5000, 0),
	(14, 33, 5000, 0),
	(14, 34, 5000, 0),
	(14, 35, 5000, 0),
	(14, 36, 5000, 0),
	(14, 37, 5000, 0),
	(14, 38, 5000, 0),
	(14, 39, 5000, 0),
	(14, 40, 5000, 0),
	(14, 41, 5000, 0),
	(14, 42, 5000, 0),
	(14, 43, 5000, 0),
	(14, 44, 5000, 0),
	(18, 1, 5000, 0),
	(18, 2, 5000, 0),
	(18, 3, 5000, 0),
	(18, 4, 5000, 0),
	(18, 5, 5000, 0),
	(18, 6, 5000, 0),
	(18, 7, 5000, 0),
	(18, 8, 5000, 0),
	(18, 9, 5000, 0),
	(18, 10, 5000, 0),
	(18, 11, 5000, 0),
	(18, 12, 5000, 0),
	(18, 13, 5000, 0),
	(18, 14, 5000, 0),
	(18, 15, 5000, 0),
	(18, 16, 5000, 0),
	(18, 17, 5000, 0),
	(18, 18, 5000, 0),
	(18, 19, 5000, 0),
	(18, 20, 5000, 0),
	(18, 21, 5000, 0),
	(18, 22, 5000, 0),
	(18, 23, 5000, 0),
	(18, 24, 5000, 0),
	(18, 25, 5000, 0),
	(18, 26, 5000, 0),
	(18, 27, 5000, 0),
	(18, 28, 5000, 0),
	(18, 29, 5000, 0),
	(18, 30, 5000, 0),
	(18, 31, 5000, 0),
	(18, 32, 5000, 0),
	(18, 33, 5000, 0),
	(18, 34, 5000, 0),
	(18, 35, 5000, 0),
	(18, 36, 5000, 0),
	(18, 37, 5000, 0),
	(18, 38, 5000, 0),
	(18, 39, 5000, 0),
	(18, 40, 5000, 0),
	(18, 41, 5000, 0),
	(18, 42, 5000, 0),
	(18, 43, 5000, 0),
	(18, 44, 5000, 0),
	(19, 1, 5000, 0),
	(19, 2, 5000, 0),
	(19, 3, 5000, 0),
	(19, 4, 5000, 0),
	(19, 5, 5000, 0),
	(19, 6, 5000, 0),
	(19, 7, 5000, 0),
	(19, 8, 5000, 0),
	(19, 9, 5000, 0),
	(19, 10, 5000, 0),
	(19, 11, 5000, 0),
	(19, 12, 5000, 0),
	(19, 13, 5000, 0),
	(19, 14, 5000, 0),
	(19, 15, 5000, 0),
	(19, 16, 5000, 0),
	(19, 17, 5000, 0),
	(19, 18, 5000, 0),
	(19, 19, 5000, 0),
	(19, 20, 5000, 0),
	(19, 21, 5000, 0),
	(19, 22, 5000, 0),
	(19, 23, 5000, 0),
	(19, 24, 5000, 0),
	(19, 25, 5000, 0),
	(19, 26, 5000, 0),
	(19, 27, 5000, 0),
	(19, 28, 5000, 0),
	(19, 29, 5000, 0),
	(19, 30, 5000, 0),
	(19, 31, 5000, 0),
	(19, 32, 5000, 0),
	(19, 33, 5000, 0),
	(19, 34, 5000, 0),
	(19, 35, 5000, 0),
	(19, 36, 5000, 0),
	(19, 37, 5000, 0),
	(19, 38, 5000, 0),
	(19, 39, 5000, 0),
	(19, 40, 5000, 0),
	(19, 41, 5000, 0),
	(19, 42, 5000, 0),
	(19, 43, 5000, 0),
	(19, 44, 5000, 0),
	(20, 29, 5000, 0),
	(20, 11, 5000, 0),
	(20, 36, 5000, 0),
	(21, 6, 5000, 0),
	(21, 1, 5000, 0),
	(21, 2, 5000, 0),
	(21, 3, 5000, 0),
	(21, 4, 5000, 0),
	(21, 5, 5000, 0),
	(21, 7, 5000, 0),
	(21, 8, 5000, 0),
	(21, 9, 5000, 0),
	(21, 10, 5000, 0),
	(21, 11, 5000, 0),
	(21, 12, 5000, 0),
	(21, 13, 5000, 0),
	(21, 14, 5000, 0),
	(21, 15, 5000, 0),
	(21, 16, 5000, 0),
	(21, 17, 5000, 0),
	(21, 18, 5000, 0),
	(21, 19, 5000, 0),
	(21, 20, 5000, 0),
	(21, 21, 5000, 0),
	(21, 22, 5000, 0),
	(21, 23, 5000, 0),
	(21, 24, 5000, 0),
	(21, 25, 5000, 0),
	(21, 26, 5000, 0),
	(21, 27, 5000, 0),
	(21, 28, 5000, 0),
	(21, 29, 5000, 0),
	(21, 30, 5000, 0),
	(21, 31, 5000, 0),
	(21, 32, 5000, 0),
	(21, 33, 5000, 0),
	(21, 34, 5000, 0),
	(21, 35, 5000, 0),
	(21, 36, 5000, 0),
	(21, 37, 5000, 0),
	(21, 38, 5000, 0),
	(21, 39, 5000, 0),
	(21, 40, 5000, 0),
	(21, 41, 5000, 0),
	(21, 42, 5000, 0),
	(21, 43, 5000, 0),
	(21, 44, 5000, 0),
	(20, 35, 5000, 0),
	(20, 12, 5000, 0),
	(20, 34, 5000, 0),
	(20, 2, 5000, 0),
	(20, 7, 5000, 0),
	(20, 1, 5000, 0),
	(20, 3, 5000, 0),
	(20, 4, 5000, 0),
	(20, 5, 5000, 0),
	(20, 6, 5000, 0),
	(20, 8, 5000, 0),
	(20, 9, 5000, 0),
	(20, 10, 5000, 0),
	(20, 13, 5000, 0),
	(20, 14, 5000, 0),
	(20, 15, 5000, 0),
	(20, 16, 5000, 0),
	(20, 17, 5000, 0),
	(20, 18, 5000, 0),
	(20, 19, 5000, 0),
	(20, 20, 5000, 0),
	(20, 21, 5000, 0),
	(20, 22, 5000, 0),
	(20, 23, 5000, 0),
	(20, 24, 5000, 0),
	(20, 25, 5000, 0),
	(20, 26, 5000, 0),
	(20, 27, 5000, 0),
	(20, 28, 5000, 0),
	(20, 30, 5000, 0),
	(20, 31, 5000, 0),
	(20, 32, 5000, 0),
	(20, 33, 5000, 0),
	(20, 37, 5000, 0),
	(20, 38, 5000, 0),
	(20, 39, 5000, 0),
	(20, 40, 5000, 0),
	(20, 41, 5000, 0),
	(20, 42, 5000, 0),
	(20, 43, 5000, 0),
	(20, 44, 5000, 0),
	(24, 1, 5000, 0),
	(24, 2, 5000, 0),
	(24, 3, 5000, 0),
	(24, 4, 5000, 0),
	(24, 5, 5000, 0),
	(24, 6, 5000, 0),
	(24, 7, 5000, 0),
	(24, 8, 5000, 0),
	(24, 9, 5000, 0),
	(24, 10, 5000, 0),
	(24, 11, 5000, 0),
	(24, 12, 5000, 0),
	(24, 13, 5000, 0),
	(24, 14, 5000, 0),
	(24, 15, 5000, 0),
	(24, 16, 5000, 0),
	(24, 17, 5000, 0),
	(24, 18, 5000, 0),
	(24, 19, 5000, 0),
	(24, 20, 5000, 0),
	(24, 21, 5000, 0),
	(24, 22, 5000, 0),
	(24, 23, 5000, 0),
	(24, 24, 5000, 0),
	(24, 25, 5000, 0),
	(24, 26, 5000, 0),
	(24, 27, 5000, 0),
	(24, 28, 5000, 0),
	(24, 29, 5000, 0),
	(24, 30, 5000, 0),
	(24, 31, 5000, 0),
	(24, 32, 5000, 0),
	(24, 33, 5000, 0),
	(24, 34, 5000, 0),
	(24, 35, 5000, 0),
	(24, 36, 5000, 0),
	(24, 37, 5000, 0),
	(24, 38, 5000, 0),
	(24, 39, 5000, 0),
	(24, 40, 5000, 0),
	(24, 41, 5000, 0),
	(24, 42, 5000, 0),
	(24, 43, 5000, 0),
	(24, 44, 5000, 0),
	(29, 28, 12, 0),
	(29, 1, 24, 0),
	(29, 29, 9, 0),
	(30, 29, 9, 0),
	(33, 1, 5000, 0),
	(33, 2, 5000, 0),
	(33, 3, 5000, 0),
	(33, 4, 5000, 0),
	(33, 5, 5000, 0),
	(33, 6, 5000, 0),
	(33, 7, 5000, 0),
	(33, 8, 5000, 0),
	(33, 9, 5000, 0),
	(33, 10, 5000, 0),
	(33, 11, 5000, 0),
	(33, 12, 5000, 0),
	(33, 13, 5000, 0),
	(33, 14, 5000, 0),
	(33, 15, 5000, 0),
	(33, 16, 5000, 0),
	(33, 17, 5000, 0),
	(33, 18, 5000, 0),
	(33, 19, 5000, 0),
	(33, 20, 5000, 0),
	(33, 21, 5000, 0),
	(33, 22, 5000, 0),
	(33, 23, 5000, 0),
	(33, 24, 5000, 0),
	(33, 25, 5000, 0),
	(33, 26, 5000, 0),
	(33, 27, 5000, 0),
	(33, 28, 5000, 0),
	(33, 29, 5000, 0),
	(33, 30, 5000, 0),
	(33, 31, 5000, 0),
	(33, 32, 5000, 0),
	(33, 33, 5000, 0),
	(33, 34, 5000, 0),
	(33, 35, 5000, 0),
	(33, 36, 5000, 0),
	(33, 37, 5000, 0),
	(33, 38, 5000, 0),
	(33, 39, 5000, 0),
	(33, 40, 5000, 0),
	(33, 41, 5000, 0),
	(33, 42, 5000, 0),
	(33, 43, 5000, 0),
	(33, 44, 5000, 0),
	(34, 1, 5000, 0),
	(34, 2, 5000, 0),
	(34, 3, 5000, 0),
	(34, 4, 5000, 0),
	(34, 5, 5000, 0),
	(34, 6, 5000, 0),
	(34, 7, 5000, 0),
	(34, 8, 5000, 0),
	(34, 9, 5000, 0),
	(34, 10, 5000, 0),
	(34, 11, 5000, 0),
	(34, 12, 5000, 0),
	(34, 13, 5000, 0),
	(34, 14, 5000, 0),
	(34, 15, 5000, 0),
	(34, 16, 5000, 0),
	(34, 17, 5000, 0),
	(34, 18, 5000, 0),
	(34, 19, 5000, 0),
	(34, 20, 5000, 0),
	(34, 21, 5000, 0),
	(34, 22, 5000, 0),
	(34, 23, 5000, 0),
	(34, 24, 5000, 0),
	(34, 25, 5000, 0),
	(34, 26, 5000, 0),
	(34, 27, 5000, 0),
	(34, 28, 5000, 0),
	(34, 29, 5000, 0),
	(34, 30, 5000, 0),
	(34, 31, 5000, 0),
	(34, 32, 5000, 0),
	(34, 33, 5000, 0),
	(34, 34, 5000, 0),
	(34, 35, 5000, 0),
	(34, 36, 5000, 0),
	(34, 37, 5000, 0),
	(34, 38, 5000, 0),
	(34, 39, 5000, 0),
	(34, 40, 5000, 0),
	(34, 41, 5000, 0),
	(34, 42, 5000, 0),
	(34, 43, 5000, 0),
	(34, 44, 5000, 0),
	(8, 45, 5000, 0),
	(5, 45, 5000, 0),
	(10, 45, 5000, 0),
	(56, 45, 5000, 0),
	(56, 44, 5000, 0),
	(56, 43, 5000, 0),
	(56, 42, 5000, 0),
	(56, 41, 5000, 0),
	(56, 40, 5000, 0),
	(56, 39, 5000, 0),
	(56, 38, 5000, 0),
	(56, 37, 5000, 0),
	(56, 36, 5000, 0),
	(56, 35, 5000, 0),
	(56, 34, 5000, 0),
	(56, 33, 5000, 0),
	(56, 32, 5000, 0),
	(56, 31, 5000, 0),
	(56, 30, 5000, 0),
	(56, 29, 5000, 0),
	(56, 28, 5000, 0),
	(56, 27, 5000, 0),
	(56, 26, 5000, 0),
	(56, 25, 5000, 0),
	(56, 24, 5000, 0),
	(56, 23, 5000, 0),
	(56, 22, 5000, 0),
	(56, 21, 5000, 0),
	(56, 20, 5000, 0),
	(56, 19, 5000, 0),
	(56, 18, 5000, 0),
	(56, 17, 5000, 0),
	(56, 16, 5000, 0),
	(56, 15, 5000, 0),
	(56, 14, 5000, 0),
	(56, 13, 5000, 0),
	(56, 12, 5000, 0),
	(56, 11, 5000, 0),
	(56, 10, 5000, 0),
	(56, 9, 5000, 0),
	(56, 8, 5000, 0),
	(56, 7, 5000, 0),
	(56, 6, 5000, 0),
	(56, 5, 5000, 0),
	(56, 4, 5000, 0),
	(56, 3, 5000, 0),
	(56, 2, 5000, 0),
	(56, 1, 5000, 0),
	(39, 29, 5000, 0),
	(43, 1, 5000, 0),
	(43, 2, 5000, 0),
	(43, 3, 5000, 0),
	(43, 4, 5000, 0),
	(43, 5, 5000, 0),
	(43, 6, 5000, 0),
	(43, 7, 5000, 0),
	(43, 8, 5000, 0),
	(43, 9, 5000, 0),
	(43, 10, 5000, 0),
	(43, 11, 5000, 0),
	(43, 12, 5000, 0),
	(43, 13, 5000, 0),
	(43, 14, 5000, 0),
	(43, 15, 5000, 0),
	(43, 16, 5000, 0),
	(43, 17, 5000, 0),
	(43, 18, 5000, 0),
	(43, 19, 5000, 0),
	(43, 20, 5000, 0),
	(43, 21, 5000, 0),
	(43, 22, 5000, 0),
	(43, 23, 5000, 0),
	(43, 24, 5000, 0),
	(43, 25, 5000, 0),
	(43, 26, 5000, 0),
	(43, 27, 5000, 0),
	(43, 28, 5000, 0),
	(43, 29, 5000, 0),
	(43, 30, 5000, 0),
	(43, 31, 5000, 0),
	(43, 32, 5000, 0),
	(43, 33, 5000, 0),
	(43, 34, 5000, 0),
	(43, 35, 5000, 0),
	(43, 36, 5000, 0),
	(43, 37, 5000, 0),
	(43, 38, 5000, 0),
	(43, 39, 5000, 0),
	(43, 40, 5000, 0),
	(43, 41, 5000, 0),
	(43, 42, 5000, 0),
	(43, 43, 5000, 0),
	(43, 44, 5000, 0),
	(43, 45, 5000, 0),
	(19, 45, 5000, 0),
	(4, 2, 5000, 0),
	(4, 3, 5000, 0),
	(4, 4, 5000, 0),
	(4, 5, 5000, 0),
	(4, 6, 5000, 0),
	(4, 7, 5000, 0),
	(4, 8, 5000, 0),
	(4, 9, 5000, 0),
	(4, 10, 5000, 0),
	(4, 11, 5000, 0),
	(4, 12, 5000, 0),
	(4, 13, 5000, 0),
	(4, 14, 5000, 0),
	(4, 15, 5000, 0),
	(4, 16, 5000, 0),
	(4, 17, 5000, 0),
	(4, 18, 5000, 0),
	(4, 19, 5000, 0),
	(4, 20, 5000, 0),
	(4, 21, 5000, 0),
	(4, 22, 5000, 0),
	(4, 23, 5000, 0),
	(4, 24, 5000, 0),
	(4, 25, 5000, 0),
	(4, 26, 5000, 0),
	(4, 27, 5000, 0),
	(4, 30, 5000, 0),
	(4, 31, 5000, 0),
	(4, 32, 5000, 0),
	(4, 33, 5000, 0),
	(4, 34, 5000, 0),
	(4, 35, 5000, 0),
	(4, 36, 5000, 0),
	(4, 37, 5000, 0),
	(4, 38, 5000, 0),
	(4, 39, 5000, 0),
	(4, 40, 5000, 0),
	(4, 41, 5000, 0),
	(4, 42, 5000, 0),
	(4, 43, 5000, 0),
	(4, 44, 5000, 0),
	(4, 45, 5000, 0),
	(51, 1, 5000, 0),
	(51, 2, 5000, 0),
	(51, 3, 5000, 0),
	(51, 4, 5000, 0),
	(51, 5, 5000, 0),
	(51, 6, 5000, 0),
	(51, 7, 5000, 0),
	(51, 8, 5000, 0),
	(51, 9, 5000, 0),
	(51, 10, 5000, 0),
	(51, 11, 5000, 0),
	(51, 12, 5000, 0),
	(51, 13, 5000, 0),
	(51, 14, 5000, 0),
	(51, 15, 5000, 0),
	(51, 16, 5000, 0),
	(51, 17, 5000, 0),
	(51, 18, 5000, 0),
	(51, 19, 5000, 0),
	(51, 20, 5000, 0),
	(51, 21, 5000, 0),
	(51, 22, 5000, 0),
	(51, 23, 5000, 0),
	(51, 24, 5000, 0),
	(51, 25, 5000, 0),
	(51, 26, 5000, 0),
	(51, 27, 5000, 0),
	(51, 28, 5000, 0),
	(51, 29, 5000, 0),
	(51, 30, 5000, 0),
	(51, 31, 5000, 0),
	(51, 32, 5000, 0),
	(51, 33, 5000, 0),
	(51, 34, 5000, 0),
	(51, 35, 5000, 0),
	(51, 36, 5000, 0),
	(51, 37, 5000, 0),
	(51, 38, 5000, 0),
	(51, 39, 5000, 0),
	(51, 40, 5000, 0),
	(51, 41, 5000, 0),
	(51, 42, 5000, 0),
	(51, 43, 5000, 0),
	(51, 44, 5000, 0),
	(51, 45, 5000, 0),
	(45, 1, 5000, 0),
	(45, 2, 5000, 0),
	(45, 3, 5000, 0),
	(45, 4, 5000, 0),
	(45, 5, 5000, 0),
	(45, 6, 5000, 0),
	(45, 7, 5000, 0),
	(45, 8, 5000, 0),
	(45, 9, 5000, 0),
	(45, 10, 5000, 0),
	(45, 11, 5000, 0),
	(45, 12, 5000, 0),
	(45, 13, 5000, 0),
	(45, 14, 5000, 0),
	(45, 15, 5000, 0),
	(45, 16, 5000, 0),
	(45, 17, 5000, 0),
	(45, 18, 5000, 0),
	(45, 19, 5000, 0),
	(45, 20, 5000, 0),
	(45, 21, 5000, 0),
	(45, 22, 5000, 0),
	(45, 23, 5000, 0),
	(45, 24, 5000, 0),
	(45, 25, 5000, 0),
	(45, 26, 5000, 0),
	(45, 27, 5000, 0),
	(45, 28, 5000, 0),
	(45, 29, 5000, 0),
	(45, 30, 5000, 0),
	(45, 31, 5000, 0),
	(45, 32, 5000, 0),
	(45, 33, 5000, 0),
	(45, 34, 5000, 0),
	(45, 35, 5000, 0),
	(45, 36, 5000, 0),
	(45, 37, 5000, 0),
	(45, 38, 5000, 0),
	(45, 39, 5000, 0),
	(45, 40, 5000, 0),
	(45, 41, 5000, 0),
	(45, 42, 5000, 0),
	(45, 43, 5000, 0),
	(45, 44, 5000, 0),
	(45, 45, 5000, 0),
	(53, 3, 5000, 0),
	(53, 31, 5000, 0),
	(53, 30, 5000, 0),
	(53, 29, 5000, 0),
	(54, 11, 5000, 0),
	(54, 29, 5000, 0),
	(54, 35, 5000, 0),
	(54, 36, 5000, 0),
	(53, 6, 5000, 0),
	(54, 12, 5000, 0),
	(54, 34, 5000, 0),
	(54, 37, 5000, 0),
	(53, 1, 5000, 0),
	(53, 2, 5000, 0),
	(53, 4, 5000, 0),
	(53, 5, 5000, 0),
	(53, 7, 5000, 0),
	(53, 8, 5000, 0),
	(53, 9, 5000, 0),
	(53, 10, 5000, 0),
	(53, 11, 5000, 0),
	(53, 12, 5000, 0),
	(53, 13, 5000, 0),
	(53, 14, 5000, 0),
	(53, 15, 5000, 0),
	(53, 16, 5000, 0),
	(53, 17, 5000, 0),
	(53, 18, 5000, 0),
	(53, 19, 5000, 0),
	(53, 20, 5000, 0),
	(53, 21, 5000, 0),
	(53, 22, 5000, 0),
	(53, 23, 5000, 0),
	(53, 24, 5000, 0),
	(53, 25, 5000, 0),
	(53, 26, 5000, 0),
	(53, 27, 5000, 0),
	(53, 28, 5000, 0),
	(53, 32, 5000, 0),
	(53, 33, 5000, 0),
	(53, 34, 5000, 0),
	(53, 35, 5000, 0),
	(53, 36, 5000, 0),
	(53, 37, 5000, 0),
	(53, 38, 5000, 0),
	(53, 39, 5000, 0),
	(53, 40, 5000, 0),
	(53, 41, 5000, 0),
	(53, 42, 5000, 0),
	(53, 43, 5000, 0),
	(53, 44, 5000, 0),
	(53, 45, 5000, 0),
	(54, 33, 5000, 0),
	(54, 1, 5000, 0),
	(54, 2, 5000, 0),
	(54, 3, 5000, 0),
	(54, 4, 5000, 0),
	(54, 5, 5000, 0),
	(54, 6, 5000, 0),
	(54, 7, 5000, 0),
	(54, 8, 5000, 0),
	(54, 9, 5000, 0),
	(54, 10, 5000, 0),
	(54, 13, 5000, 0),
	(54, 14, 5000, 0),
	(54, 15, 5000, 0),
	(54, 16, 5000, 0),
	(54, 17, 5000, 0),
	(54, 18, 5000, 0),
	(54, 19, 5000, 0),
	(54, 20, 5000, 0),
	(54, 21, 5000, 0),
	(54, 22, 5000, 0),
	(54, 23, 5000, 0),
	(54, 24, 5000, 0),
	(54, 25, 5000, 0),
	(54, 26, 5000, 0),
	(54, 27, 5000, 0),
	(54, 28, 5000, 0),
	(54, 30, 5000, 0),
	(54, 31, 5000, 0),
	(54, 32, 5000, 0),
	(54, 38, 5000, 0),
	(54, 39, 5000, 0),
	(54, 40, 5000, 0),
	(54, 41, 5000, 0),
	(54, 42, 5000, 0),
	(54, 43, 5000, 0),
	(54, 44, 5000, 0),
	(54, 45, 5000, 0),
	(55, 1, 5000, 0),
	(55, 2, 5000, 0),
	(55, 3, 5000, 0),
	(55, 4, 5000, 0),
	(55, 5, 5000, 0),
	(55, 6, 5000, 0),
	(55, 7, 5000, 0),
	(55, 8, 5000, 0),
	(55, 9, 5000, 0),
	(55, 10, 5000, 0),
	(55, 11, 5000, 0),
	(55, 12, 5000, 0),
	(55, 13, 5000, 0),
	(55, 14, 5000, 0),
	(55, 15, 5000, 0),
	(55, 16, 5000, 0),
	(55, 17, 5000, 0),
	(55, 18, 5000, 0),
	(55, 19, 5000, 0),
	(55, 20, 5000, 0),
	(55, 21, 5000, 0),
	(55, 22, 5000, 0),
	(55, 23, 5000, 0),
	(55, 24, 5000, 0),
	(55, 25, 5000, 0),
	(55, 26, 5000, 0),
	(55, 27, 5000, 0),
	(55, 28, 5000, 0),
	(55, 29, 5000, 0),
	(55, 30, 5000, 0),
	(55, 31, 5000, 0),
	(55, 32, 5000, 0),
	(55, 33, 5000, 0),
	(55, 34, 5000, 0),
	(55, 35, 5000, 0),
	(55, 36, 5000, 0),
	(55, 37, 5000, 0),
	(55, 38, 5000, 0),
	(55, 39, 5000, 0),
	(55, 40, 5000, 0),
	(55, 41, 5000, 0),
	(55, 42, 5000, 0),
	(55, 43, 5000, 0),
	(55, 44, 5000, 0),
	(55, 45, 5000, 0),
	(38, 38, 5000, 0),
	(38, 1, 5000, 0),
	(38, 2, 5000, 0),
	(38, 3, 5000, 0),
	(38, 4, 5000, 0),
	(38, 5, 5000, 0),
	(38, 6, 5000, 0),
	(38, 7, 5000, 0),
	(38, 8, 5000, 0),
	(38, 9, 5000, 0),
	(38, 10, 5000, 0),
	(38, 11, 5000, 0),
	(38, 12, 5000, 0),
	(38, 13, 5000, 0),
	(38, 14, 5000, 0),
	(38, 15, 5000, 0),
	(38, 16, 5000, 0),
	(38, 17, 5000, 0),
	(38, 18, 5000, 0),
	(38, 19, 5000, 0),
	(38, 20, 5000, 0),
	(38, 21, 5000, 0),
	(38, 22, 5000, 0),
	(38, 23, 5000, 0),
	(38, 24, 5000, 0),
	(38, 25, 5000, 0),
	(38, 26, 5000, 0),
	(38, 27, 5000, 0),
	(38, 28, 5000, 0),
	(38, 29, 5000, 0),
	(38, 30, 5000, 0),
	(38, 31, 5000, 0),
	(38, 32, 5000, 0),
	(38, 33, 5000, 0),
	(38, 34, 5000, 0),
	(38, 35, 5000, 0),
	(38, 36, 5000, 0),
	(38, 37, 5000, 0),
	(38, 39, 5000, 0),
	(38, 40, 5000, 0),
	(38, 41, 5000, 0),
	(38, 42, 5000, 0),
	(38, 43, 5000, 0),
	(38, 44, 5000, 0),
	(38, 45, 5000, 0),
	(57, 1, 5000, 0),
	(57, 2, 5000, 0),
	(57, 3, 5000, 0),
	(57, 4, 5000, 0),
	(57, 5, 5000, 0),
	(57, 6, 5000, 0),
	(57, 7, 5000, 0),
	(57, 8, 5000, 0),
	(57, 9, 5000, 0),
	(57, 10, 5000, 0),
	(57, 11, 5000, 0),
	(57, 12, 5000, 0),
	(57, 13, 5000, 0),
	(57, 14, 5000, 0),
	(57, 15, 5000, 0),
	(57, 16, 5000, 0),
	(57, 17, 5000, 0),
	(57, 18, 5000, 0),
	(57, 19, 5000, 0),
	(57, 20, 5000, 0),
	(57, 21, 5000, 0),
	(57, 22, 5000, 0),
	(57, 23, 5000, 0),
	(57, 24, 5000, 0),
	(57, 25, 5000, 0),
	(57, 26, 5000, 0),
	(57, 27, 5000, 0),
	(57, 28, 5000, 0),
	(57, 29, 5000, 0),
	(57, 30, 5000, 0),
	(57, 31, 5000, 0),
	(57, 32, 5000, 0),
	(57, 33, 5000, 0),
	(57, 34, 5000, 0),
	(57, 35, 5000, 0),
	(57, 36, 5000, 0),
	(57, 37, 5000, 0),
	(57, 38, 5000, 0),
	(57, 39, 5000, 0),
	(57, 40, 5000, 0),
	(57, 41, 5000, 0),
	(57, 42, 5000, 0),
	(57, 43, 5000, 0),
	(57, 44, 5000, 0),
	(57, 45, 5000, 0),
	(58, 31, 5000, 0),
	(58, 29, 5000, 0),
	(58, 3, 5000, 0),
	(58, 30, 5000, 0),
	(58, 35, 5000, 0),
	(58, 36, 5000, 0),
	(58, 33, 5000, 0),
	(58, 34, 5000, 0),
	(58, 9, 5000, 0),
	(58, 1, 5000, 0),
	(58, 2, 5000, 0),
	(58, 4, 5000, 0),
	(58, 5, 5000, 0),
	(58, 6, 5000, 0),
	(58, 7, 5000, 0),
	(58, 8, 5000, 0),
	(58, 10, 5000, 0),
	(58, 11, 5000, 0),
	(58, 12, 5000, 0),
	(58, 13, 5000, 0),
	(58, 14, 5000, 0),
	(58, 15, 5000, 0),
	(58, 16, 5000, 0),
	(58, 17, 5000, 0),
	(58, 18, 5000, 0),
	(58, 19, 5000, 0),
	(58, 20, 5000, 0),
	(58, 21, 5000, 0),
	(58, 22, 5000, 0),
	(58, 23, 5000, 0),
	(58, 24, 5000, 0),
	(58, 25, 5000, 0),
	(58, 26, 5000, 0),
	(58, 27, 5000, 0),
	(58, 28, 5000, 0),
	(58, 32, 5000, 0),
	(58, 37, 5000, 0),
	(58, 38, 5000, 0),
	(58, 39, 5000, 0),
	(58, 40, 5000, 0),
	(58, 41, 5000, 0),
	(58, 42, 5000, 0),
	(58, 43, 5000, 0),
	(58, 44, 5000, 0),
	(58, 45, 5000, 0),
	(59, 1, 5000, 0),
	(59, 2, 5000, 0),
	(59, 3, 5000, 0),
	(59, 4, 5000, 0),
	(59, 5, 5000, 0),
	(59, 6, 5000, 0),
	(59, 7, 5000, 0),
	(59, 8, 5000, 0),
	(59, 9, 5000, 0),
	(59, 10, 5000, 0),
	(59, 11, 5000, 0),
	(59, 12, 5000, 0),
	(59, 13, 5000, 0),
	(59, 14, 5000, 0),
	(59, 15, 5000, 0),
	(59, 16, 5000, 0),
	(59, 17, 5000, 0),
	(59, 18, 5000, 0),
	(59, 19, 5000, 0),
	(59, 20, 5000, 0),
	(59, 21, 5000, 0),
	(59, 22, 5000, 0),
	(59, 23, 5000, 0),
	(59, 24, 5000, 0),
	(59, 25, 5000, 0),
	(59, 26, 5000, 0),
	(59, 27, 5000, 0),
	(59, 28, 5000, 0),
	(59, 29, 5000, 0),
	(59, 30, 5000, 0),
	(59, 31, 5000, 0),
	(59, 32, 5000, 0),
	(59, 33, 5000, 0),
	(59, 34, 5000, 0),
	(59, 35, 5000, 0),
	(59, 36, 5000, 0),
	(59, 37, 5000, 0),
	(59, 38, 5000, 0),
	(59, 39, 5000, 0),
	(59, 40, 5000, 0),
	(59, 41, 5000, 0),
	(59, 42, 5000, 0),
	(59, 43, 5000, 0),
	(59, 44, 5000, 0),
	(59, 45, 5000, 0),
	(60, 1, 5000, 0),
	(60, 2, 5000, 0),
	(60, 3, 5000, 0),
	(60, 4, 5000, 0),
	(60, 5, 5000, 0),
	(60, 6, 5000, 0),
	(60, 7, 5000, 0),
	(60, 8, 5000, 0),
	(60, 9, 5000, 0),
	(60, 10, 5000, 0),
	(60, 11, 5000, 0),
	(60, 12, 5000, 0),
	(60, 13, 5000, 0),
	(60, 14, 5000, 0),
	(60, 15, 5000, 0),
	(60, 16, 5000, 0),
	(60, 17, 5000, 0),
	(60, 18, 5000, 0),
	(60, 19, 5000, 0),
	(60, 20, 5000, 0),
	(60, 21, 5000, 0),
	(60, 22, 5000, 0),
	(60, 23, 5000, 0),
	(60, 24, 5000, 0),
	(60, 25, 5000, 0),
	(60, 26, 5000, 0),
	(60, 27, 5000, 0),
	(60, 28, 5000, 0),
	(60, 29, 5000, 0),
	(60, 30, 5000, 0),
	(60, 31, 5000, 0),
	(60, 32, 5000, 0),
	(60, 33, 5000, 0),
	(60, 34, 5000, 0),
	(60, 35, 5000, 0),
	(60, 36, 5000, 0),
	(60, 37, 5000, 0),
	(60, 38, 5000, 0),
	(60, 39, 5000, 0),
	(60, 40, 5000, 0),
	(60, 41, 5000, 0),
	(60, 42, 5000, 0),
	(60, 43, 5000, 0),
	(60, 44, 5000, 0),
	(60, 45, 5000, 0),
	(61, 31, 9, 0),
	(61, 29, 9, 0),
	(39, 1, 5000, 0),
	(39, 2, 5000, 0),
	(39, 3, 5000, 0),
	(39, 4, 5000, 0),
	(39, 5, 5000, 0),
	(39, 6, 5000, 0),
	(39, 7, 5000, 0),
	(39, 8, 5000, 0),
	(39, 9, 5000, 0),
	(39, 10, 5000, 0),
	(39, 11, 5000, 0),
	(39, 12, 5000, 0),
	(39, 13, 5000, 0),
	(39, 14, 5000, 0),
	(39, 15, 5000, 0),
	(39, 16, 5000, 0),
	(39, 17, 5000, 0),
	(39, 18, 5000, 0),
	(39, 19, 5000, 0),
	(39, 20, 5000, 0),
	(39, 21, 5000, 0),
	(39, 22, 5000, 0),
	(39, 23, 5000, 0),
	(39, 24, 5000, 0),
	(39, 25, 5000, 0),
	(39, 26, 5000, 0),
	(39, 27, 5000, 0),
	(39, 28, 5000, 0),
	(39, 30, 5000, 0),
	(39, 31, 5000, 0),
	(39, 32, 5000, 0),
	(39, 33, 5000, 0),
	(39, 34, 5000, 0),
	(39, 35, 5000, 0),
	(39, 36, 5000, 0),
	(39, 37, 5000, 0),
	(39, 38, 5000, 0),
	(39, 39, 5000, 0),
	(39, 40, 5000, 0),
	(39, 41, 5000, 0),
	(39, 42, 5000, 0),
	(39, 43, 5000, 0),
	(39, 44, 5000, 0),
	(39, 45, 5000, 0),
	(62, 1, 5000, 0),
	(62, 2, 5000, 0),
	(62, 3, 5000, 0),
	(62, 4, 5000, 0),
	(62, 5, 5000, 0),
	(62, 6, 5000, 0),
	(62, 7, 5000, 0),
	(62, 8, 5000, 0),
	(62, 9, 5000, 0),
	(62, 10, 5000, 0),
	(62, 11, 5000, 0),
	(62, 12, 765, 0),
	(62, 13, 5000, 0),
	(62, 14, 5000, 0),
	(62, 15, 5000, 0),
	(62, 16, 5000, 0),
	(62, 17, 5000, 0),
	(62, 18, 5000, 0),
	(62, 19, 5000, 0),
	(62, 20, 5000, 0),
	(62, 21, 5000, 0),
	(62, 22, 5000, 0),
	(62, 23, 5000, 0),
	(62, 24, 5000, 0),
	(62, 25, 5000, 0),
	(62, 26, 5000, 0),
	(62, 27, 5000, 0),
	(62, 28, 5000, 0),
	(62, 29, 663, 0),
	(62, 30, 5000, 0),
	(62, 31, 5000, 0),
	(62, 32, 825, 0),
	(62, 33, 825, 0),
	(62, 34, 756, 0),
	(62, 35, 774, 0),
	(62, 36, 5000, 0),
	(62, 37, 5000, 0),
	(62, 38, 5000, 0),
	(62, 39, 5000, 0),
	(62, 40, 5000, 0),
	(62, 41, 5000, 0),
	(62, 42, 5000, 0),
	(62, 43, 5000, 0),
	(62, 44, 5000, 0),
	(62, 45, 5000, 0),
	(8, 49, 2000, 10),
	(8, 56, 990, 0),
	(5, 49, 1500, 15),
	(63, 36, 78, 0),
	(64, 1, 5000, 0),
	(64, 2, 5000, 0),
	(64, 3, 5000, 0),
	(64, 4, 5000, 0),
	(64, 5, 5000, 0),
	(64, 6, 5000, 0),
	(64, 7, 5000, 0),
	(64, 8, 5000, 0),
	(64, 9, 5000, 0),
	(64, 10, 5000, 0),
	(64, 11, 5000, 0),
	(64, 12, 5000, 0),
	(64, 13, 5000, 0),
	(64, 14, 5000, 0),
	(64, 15, 5000, 0),
	(64, 16, 5000, 0),
	(64, 17, 5000, 0),
	(64, 18, 5000, 0),
	(64, 19, 5000, 0),
	(64, 20, 5000, 0),
	(64, 21, 5000, 0),
	(64, 22, 5000, 0),
	(64, 23, 5000, 0),
	(64, 24, 5000, 0),
	(64, 25, 5000, 0),
	(64, 26, 5000, 0),
	(64, 27, 5000, 0),
	(64, 28, 5000, 0),
	(64, 29, 5000, 0),
	(64, 30, 5000, 0),
	(64, 31, 5000, 0),
	(64, 32, 5000, 0),
	(64, 33, 5000, 0),
	(64, 34, 5000, 0),
	(64, 35, 5000, 0),
	(64, 36, 5000, 0),
	(64, 37, 5000, 0),
	(64, 38, 5000, 0),
	(64, 39, 5000, 0),
	(64, 40, 5000, 0),
	(64, 41, 5000, 0),
	(64, 42, 5000, 0),
	(64, 43, 5000, 0),
	(64, 44, 5000, 0),
	(64, 45, 5000, 0),
	(65, 1, 5000, 0),
	(65, 2, 5000, 0),
	(65, 3, 5000, 0),
	(65, 4, 5000, 0),
	(65, 5, 5000, 0),
	(65, 6, 5000, 0),
	(65, 7, 5000, 0),
	(65, 8, 5000, 0),
	(65, 9, 5000, 0),
	(65, 10, 5000, 0),
	(65, 11, 5000, 0),
	(65, 12, 5000, 0),
	(65, 13, 5000, 0),
	(65, 14, 5000, 0),
	(65, 15, 5000, 0),
	(65, 16, 5000, 0),
	(65, 17, 5000, 0),
	(65, 18, 5000, 0),
	(65, 19, 5000, 0),
	(65, 20, 5000, 0),
	(65, 21, 5000, 0),
	(65, 22, 5000, 0),
	(65, 23, 5000, 0),
	(65, 24, 5000, 0),
	(65, 25, 5000, 0),
	(65, 26, 5000, 0),
	(65, 27, 5000, 0),
	(65, 28, 5000, 0),
	(65, 29, 5000, 0),
	(65, 30, 5000, 0),
	(65, 31, 5000, 0),
	(65, 32, 5000, 0),
	(65, 33, 5000, 0),
	(65, 34, 5000, 0),
	(65, 35, 5000, 0),
	(65, 36, 5000, 0),
	(65, 37, 5000, 0),
	(65, 38, 5000, 0),
	(65, 39, 5000, 0),
	(65, 40, 5000, 0),
	(65, 41, 5000, 0),
	(65, 42, 5000, 0),
	(65, 43, 5000, 0),
	(65, 44, 5000, 0),
	(65, 45, 5000, 0),
	(5, 53, 6, 0),
	(66, 6, 5000, 0),
	(66, 31, 5000, 0),
	(66, 29, 5000, 0),
	(66, 1, 5000, 0),
	(66, 2, 5000, 0),
	(66, 3, 5000, 0),
	(66, 4, 5000, 0),
	(66, 5, 5000, 0),
	(66, 7, 5000, 0),
	(66, 8, 5000, 0),
	(66, 9, 5000, 0),
	(66, 10, 5000, 0),
	(66, 11, 5000, 0),
	(66, 12, 5000, 0),
	(66, 13, 5000, 0),
	(66, 14, 5000, 0),
	(66, 15, 5000, 0),
	(66, 16, 5000, 0),
	(66, 17, 5000, 0),
	(66, 18, 5000, 0),
	(66, 19, 5000, 0),
	(66, 20, 5000, 0),
	(66, 21, 5000, 0),
	(66, 22, 5000, 0),
	(66, 23, 5000, 0),
	(66, 24, 5000, 0),
	(66, 25, 5000, 0),
	(66, 26, 5000, 0),
	(66, 27, 5000, 0),
	(66, 28, 5000, 0),
	(66, 30, 5000, 0),
	(66, 32, 5000, 0),
	(66, 33, 5000, 0),
	(66, 34, 5000, 0),
	(66, 35, 5000, 0),
	(66, 36, 5000, 0),
	(66, 37, 5000, 0),
	(66, 38, 5000, 0),
	(66, 39, 5000, 0),
	(66, 40, 5000, 0),
	(66, 41, 5000, 0),
	(66, 42, 5000, 0),
	(66, 43, 5000, 0),
	(66, 44, 5000, 0),
	(66, 45, 5000, 0),
	(67, 45, 5000, 0),
	(67, 44, 5000, 0),
	(67, 43, 5000, 0),
	(67, 42, 5000, 0),
	(67, 41, 5000, 0),
	(67, 40, 5000, 0),
	(67, 39, 5000, 0),
	(67, 38, 5000, 0),
	(67, 37, 5000, 0),
	(67, 36, 5000, 0),
	(67, 35, 5000, 0),
	(67, 34, 5000, 0),
	(67, 33, 5000, 0),
	(67, 32, 5000, 0),
	(67, 31, 5000, 0),
	(67, 30, 5000, 0),
	(67, 29, 5000, 0),
	(67, 28, 5000, 0),
	(67, 27, 5000, 0),
	(67, 26, 5000, 0),
	(67, 25, 5000, 0),
	(67, 24, 5000, 0),
	(67, 23, 5000, 0),
	(67, 22, 5000, 0),
	(67, 21, 5000, 0),
	(67, 20, 5000, 0),
	(67, 19, 5000, 0),
	(67, 18, 5000, 0),
	(67, 17, 5000, 0),
	(67, 16, 5000, 0),
	(67, 15, 5000, 0),
	(67, 14, 5000, 0),
	(67, 13, 5000, 0),
	(67, 12, 5000, 0),
	(67, 11, 5000, 0),
	(67, 10, 5000, 0),
	(67, 9, 5000, 0),
	(67, 8, 5000, 0),
	(67, 7, 5000, 0),
	(67, 6, 5000, 0),
	(67, 5, 5000, 0),
	(67, 4, 5000, 0),
	(67, 3, 5000, 0),
	(67, 2, 5000, 0),
	(67, 1, 5000, 0),
	(40, 1, 5000, 0),
	(40, 2, 5000, 0),
	(40, 3, 5000, 0),
	(40, 4, 5000, 0),
	(40, 5, 5000, 0),
	(40, 6, 5000, 0),
	(40, 7, 5000, 0),
	(40, 8, 5000, 0),
	(40, 9, 5000, 0),
	(40, 10, 5000, 0),
	(40, 11, 5000, 0),
	(40, 12, 5000, 0),
	(40, 13, 5000, 0),
	(40, 14, 5000, 0),
	(40, 15, 5000, 0),
	(40, 16, 5000, 0),
	(40, 17, 5000, 0),
	(40, 18, 5000, 0),
	(40, 19, 5000, 0),
	(40, 20, 5000, 0),
	(40, 21, 5000, 0),
	(40, 22, 5000, 0),
	(40, 23, 5000, 0),
	(40, 24, 5000, 0),
	(40, 25, 5000, 0),
	(40, 26, 5000, 0),
	(40, 27, 5000, 0),
	(40, 28, 5000, 0),
	(40, 29, 5000, 0),
	(40, 30, 5000, 0),
	(40, 31, 5000, 0),
	(40, 32, 5000, 0),
	(40, 33, 5000, 0),
	(40, 34, 5000, 0),
	(40, 35, 5000, 0),
	(40, 36, 5000, 0),
	(40, 37, 5000, 0),
	(40, 38, 5000, 0),
	(40, 39, 5000, 0),
	(40, 40, 5000, 0),
	(40, 41, 5000, 0),
	(40, 42, 5000, 0),
	(40, 43, 5000, 0),
	(40, 44, 5000, 0),
	(40, 45, 5000, 0),
	(32, 1, 5000, 0),
	(32, 2, 5000, 0),
	(32, 3, 5000, 0),
	(32, 4, 5000, 0),
	(32, 5, 5000, 0),
	(32, 6, 5000, 0),
	(32, 7, 5000, 0),
	(32, 8, 5000, 0),
	(32, 9, 5000, 0),
	(32, 10, 5000, 0),
	(32, 11, 5000, 0),
	(32, 12, 5000, 0),
	(32, 13, 5000, 0),
	(32, 14, 5000, 0),
	(32, 15, 5000, 0),
	(32, 16, 5000, 0),
	(32, 17, 5000, 0),
	(32, 18, 5000, 0),
	(32, 19, 5000, 0),
	(32, 20, 5000, 0),
	(32, 21, 5000, 0),
	(32, 22, 5000, 0),
	(32, 23, 5000, 0),
	(32, 24, 5000, 0),
	(32, 25, 5000, 0),
	(32, 26, 5000, 0),
	(32, 27, 5000, 0),
	(32, 28, 5000, 0),
	(32, 29, 5000, 0),
	(32, 30, 5000, 0),
	(32, 31, 5000, 0),
	(32, 32, 5000, 0),
	(32, 33, 5000, 0),
	(32, 34, 5000, 0),
	(32, 35, 5000, 0),
	(32, 36, 5000, 0),
	(32, 37, 5000, 0),
	(32, 38, 5000, 0),
	(32, 39, 5000, 0),
	(32, 40, 5000, 0),
	(32, 41, 5000, 0),
	(32, 42, 5000, 0),
	(32, 43, 5000, 0),
	(32, 44, 5000, 0),
	(32, 45, 5000, 0),
	(68, 1, 5000, 0),
	(68, 2, 5000, 0),
	(68, 3, 5000, 0),
	(68, 4, 5000, 0),
	(68, 5, 5000, 0),
	(68, 6, 5000, 0),
	(68, 7, 5000, 0),
	(68, 8, 5000, 0),
	(68, 9, 5000, 0),
	(68, 10, 5000, 0),
	(68, 11, 5000, 0),
	(68, 12, 5000, 0),
	(68, 13, 5000, 0),
	(68, 14, 5000, 0),
	(68, 15, 5000, 0),
	(68, 16, 5000, 0),
	(68, 17, 5000, 0),
	(68, 18, 5000, 0),
	(68, 19, 5000, 0),
	(68, 20, 5000, 0),
	(68, 21, 5000, 0),
	(68, 22, 5000, 0),
	(68, 23, 5000, 0),
	(68, 24, 5000, 0),
	(68, 25, 5000, 0),
	(68, 26, 5000, 0),
	(68, 27, 5000, 0),
	(68, 28, 5000, 0),
	(68, 29, 5000, 0),
	(68, 30, 5000, 0),
	(68, 31, 5000, 0),
	(68, 32, 5000, 0),
	(68, 33, 5000, 0),
	(68, 34, 5000, 0),
	(68, 35, 5000, 0),
	(68, 36, 5000, 0),
	(68, 37, 5000, 0),
	(68, 38, 5000, 0),
	(68, 39, 5000, 0),
	(68, 40, 5000, 0),
	(68, 41, 5000, 0),
	(68, 42, 5000, 0),
	(68, 43, 5000, 0),
	(68, 44, 5000, 0),
	(68, 45, 5000, 0),
	(69, 10, 5000, 0),
	(69, 1, 5000, 0),
	(69, 2, 5000, 0),
	(69, 3, 5000, 0),
	(69, 4, 5000, 0),
	(69, 5, 5000, 0),
	(69, 6, 5000, 0),
	(69, 7, 5000, 0),
	(69, 8, 5000, 0),
	(69, 9, 5000, 0),
	(69, 11, 5000, 0),
	(69, 12, 5000, 0),
	(69, 13, 5000, 0),
	(69, 14, 5000, 0),
	(69, 15, 5000, 0),
	(69, 16, 5000, 0),
	(69, 17, 5000, 0),
	(69, 18, 5000, 0),
	(69, 19, 5000, 0),
	(69, 20, 5000, 0),
	(69, 21, 5000, 0),
	(69, 22, 5000, 0),
	(69, 23, 5000, 0),
	(69, 24, 5000, 0),
	(69, 25, 5000, 0),
	(69, 26, 5000, 0),
	(69, 27, 5000, 0),
	(69, 28, 5000, 0),
	(69, 29, 5000, 0),
	(69, 30, 5000, 0),
	(69, 31, 5000, 0),
	(69, 32, 5000, 0),
	(69, 33, 5000, 0),
	(69, 34, 5000, 0),
	(69, 35, 5000, 0),
	(69, 36, 5000, 0),
	(69, 37, 5000, 0),
	(69, 38, 5000, 0),
	(69, 39, 5000, 0),
	(69, 40, 5000, 0),
	(69, 41, 5000, 0),
	(69, 42, 5000, 0),
	(69, 43, 5000, 0),
	(69, 44, 5000, 0),
	(69, 45, 5000, 0),
	(70, 1, 5000, 0),
	(70, 2, 5000, 0),
	(70, 3, 5000, 0),
	(70, 4, 5000, 0),
	(70, 5, 5000, 0),
	(70, 6, 5000, 0),
	(70, 7, 5000, 0),
	(70, 8, 5000, 0),
	(70, 9, 5000, 0),
	(70, 10, 5000, 0),
	(70, 11, 5000, 0),
	(70, 12, 5000, 0),
	(70, 13, 5000, 0),
	(70, 14, 5000, 0),
	(70, 15, 5000, 0),
	(70, 16, 5000, 0),
	(70, 17, 5000, 0),
	(70, 18, 5000, 0),
	(70, 19, 5000, 0),
	(70, 20, 5000, 0),
	(70, 21, 5000, 0),
	(70, 22, 5000, 0),
	(70, 23, 5000, 0),
	(70, 24, 5000, 0),
	(70, 25, 5000, 0),
	(70, 26, 5000, 0),
	(70, 27, 5000, 0),
	(70, 28, 5000, 0),
	(70, 29, 5000, 0),
	(70, 30, 5000, 0),
	(70, 31, 5000, 0),
	(70, 32, 5000, 0),
	(70, 33, 5000, 0),
	(70, 34, 5000, 0),
	(70, 35, 5000, 0),
	(70, 36, 5000, 0),
	(70, 37, 5000, 0),
	(70, 38, 5000, 0),
	(70, 39, 5000, 0),
	(70, 40, 5000, 0),
	(70, 41, 5000, 0),
	(70, 42, 5000, 0),
	(70, 43, 5000, 0),
	(70, 44, 5000, 0),
	(70, 45, 5000, 0);
/*!40000 ALTER TABLE `char_skills` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
