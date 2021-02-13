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

-- Dumping structure for table tpzdb.char_effects
CREATE TABLE IF NOT EXISTS `char_effects` (
  `charid` int(10) unsigned NOT NULL,
  `effectid` smallint(5) unsigned NOT NULL,
  `icon` smallint(5) unsigned NOT NULL DEFAULT 0,
  `power` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tick` int(10) unsigned NOT NULL DEFAULT 0,
  `duration` int(10) unsigned NOT NULL DEFAULT 0,
  `subid` smallint(5) unsigned NOT NULL DEFAULT 0,
  `subpower` smallint(5) NOT NULL DEFAULT 0,
  `tier` smallint(5) unsigned NOT NULL DEFAULT 0,
  `flags` int(8) unsigned NOT NULL DEFAULT 0,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  KEY `charid` (`charid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.char_effects: 271 rows
/*!40000 ALTER TABLE `char_effects` DISABLE KEYS */;
INSERT INTO `char_effects` (`charid`, `effectid`, `icon`, `power`, `tick`, `duration`, `subid`, `subpower`, `tier`, `flags`, `timestamp`) VALUES
	(6, 249, 249, 150, 0, 38391, 0, 26806, 0, 0, 1606099898),
	(6, 253, 253, 1, 0, 23727, 0, 0, 0, 16777216, 1606099898),
	(17, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1599191133),
	(17, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1599191133),
	(17, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1599191133),
	(17, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1599191133),
	(17, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1599191133),
	(17, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1599191133),
	(17, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1599191133),
	(17, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1599191133),
	(17, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1599191133),
	(17, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1599191133),
	(13, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1605971526),
	(13, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1605971526),
	(13, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1605971526),
	(13, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1605971526),
	(13, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1605971526),
	(13, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1605971526),
	(13, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1605971526),
	(13, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1605971526),
	(13, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1605971526),
	(13, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1605971526),
	(13, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1605971526),
	(13, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1605971526),
	(15, 253, 253, 0, 0, 10545, 0, 0, 0, 16777216, 1599438269),
	(65, 249, 249, 100, 0, 16136, 0, 27940, 0, 0, 1610559456),
	(65, 253, 253, 1, 0, 23516, 0, 0, 0, 16777216, 1610559456),
	(59, 786, 0, 4, 0, 0, 0, 0, 0, 768, 1611180538),
	(59, 781, 0, 400, 0, 0, 0, 0, 0, 768, 1611180883),
	(16, 541, 541, 2, 3, 1, 0, 0, 0, 8389152, 1610435825),
	(16, 251, 251, 0, 0, 9810, 6465, 0, 0, 8421408, 1610435697),
	(17, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1599191133),
	(17, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1599191133),
	(19, 253, 253, 1, 0, 12874, 0, 0, 0, 16777216, 1604016195),
	(43, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1602281592),
	(38, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1608016411),
	(56, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1607823434),
	(56, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1607823434),
	(34, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1600037865),
	(34, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1600037865),
	(34, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1600037865),
	(34, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1600037865),
	(34, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1600037865),
	(34, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1600037865),
	(56, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1607823434),
	(56, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1607823434),
	(56, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1607823434),
	(56, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1607823434),
	(14, 253, 253, 0, 0, 37296, 0, 0, 0, 16777216, 1605909551),
	(24, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1611444575),
	(24, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1611444575),
	(24, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1611444575),
	(24, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1611444575),
	(24, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1611444575),
	(24, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1611444575),
	(24, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1611444575),
	(24, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1611444575),
	(24, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1611444575),
	(24, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1611444575),
	(56, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1607823434),
	(56, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1607823434),
	(24, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1611444575),
	(24, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1611444575),
	(29, 253, 253, 1, 0, 28740, 0, 0, 0, 16777216, 1599941933),
	(29, 42, 42, 3, 0, 28740, 0, 0, 0, 41, 1599941933),
	(29, 43, 43, 3, 0, 28740, 0, 0, 0, 41, 1599941933),
	(30, 253, 253, 1, 0, 28603, 0, 0, 0, 16777216, 1599942280),
	(20, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1600238925),
	(20, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1600238925),
	(33, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1610415223),
	(33, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1610415223),
	(20, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1600238925),
	(20, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1600238925),
	(20, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1600238925),
	(20, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1600238925),
	(20, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1600238925),
	(20, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1600238925),
	(20, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1600238925),
	(20, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1600238925),
	(20, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1600238925),
	(33, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1610415223),
	(9, 251, 251, 0, 0, 42, 6225, 0, 0, 8421408, 1611289726),
	(34, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1600037865),
	(34, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1600037865),
	(34, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1600037865),
	(34, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1600037865),
	(34, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1600037865),
	(34, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1600037865),
	(34, 253, 253, 1, 0, 22816, 0, 0, 0, 16777216, 1600037865),
	(34, 249, 249, 3000, 3, 37583, 0, 0, 0, 0, 1600037865),
	(45, 42, 42, 1000, 0, 0, 0, 0, 0, 41, 1604893460),
	(45, 43, 43, 100, 0, 0, 0, 0, 0, 41, 1604893460),
	(20, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1600238925),
	(42, 253, 253, 1, 0, 21818, 0, 0, 0, 16777216, 1601858369),
	(45, 170, 170, 10, 0, 0, 0, 0, 0, 40, 1604893460),
	(45, 152, 152, 1000, 0, 0, 0, 0, 0, 41, 1604893460),
	(45, 150, 150, 1000, 0, 0, 0, 0, 0, 41, 1604893460),
	(43, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1602281592),
	(43, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1602281592),
	(43, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1602281592),
	(43, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1602281592),
	(43, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1602281592),
	(43, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1602281592),
	(43, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1602281592),
	(43, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1602281592),
	(43, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1602281592),
	(43, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1602281592),
	(43, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1602281592),
	(54, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1609364051),
	(43, 253, 253, 1, 0, 27057, 0, 0, 0, 16777216, 1602281592),
	(58, 253, 253, 1, 0, 13004, 0, 0, 0, 16777216, 1611177753),
	(56, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1607823434),
	(38, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1608016411),
	(18, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1611915996),
	(18, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1611915996),
	(18, 152, 152, 1000, 0, 0, 0, 0, 0, 41, 1611915996),
	(18, 150, 150, 1000, 0, 0, 0, 0, 0, 41, 1611915996),
	(18, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1611915996),
	(18, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1611915996),
	(18, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1611915996),
	(18, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1611915996),
	(18, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1611915996),
	(18, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1611915996),
	(38, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1608016411),
	(18, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1611915996),
	(18, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1611915996),
	(18, 43, 43, 100, 0, 0, 0, 0, 0, 41, 1611915996),
	(18, 42, 42, 1000, 0, 0, 0, 0, 0, 41, 1611915996),
	(56, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1607823434),
	(39, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1608679708),
	(39, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1608679708),
	(1, 170, 170, 10, 0, 0, 0, 0, 0, 40, 1612990927),
	(54, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1609364051),
	(54, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1609364051),
	(54, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1609364051),
	(56, 253, 253, 1, 0, 25348, 0, 0, 0, 16777216, 1607823434),
	(56, 113, 113, 2, 0, 895, 0, 0, 0, 41, 1607823434),
	(56, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1607823434),
	(54, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1609364051),
	(54, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1609364051),
	(54, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1609364051),
	(53, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1612102347),
	(53, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1612102347),
	(54, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1609364051),
	(53, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1612102347),
	(53, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1612102347),
	(53, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1612102347),
	(53, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1612102347),
	(57, 580, 580, 30000, 3, 30716, 0, 0, 0, 8388640, 1608239875),
	(57, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1608239875),
	(57, 228, 228, 30000, 3, 31216, 0, 0, 0, 32, 1608239875),
	(57, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1608239875),
	(57, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1608239875),
	(54, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1609364051),
	(54, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1609364051),
	(54, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1609364051),
	(1, 152, 152, 2, 0, 0, 0, 0, 0, 41, 1612990927),
	(39, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1608679708),
	(53, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1612102347),
	(53, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1612102347),
	(54, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1609364051),
	(53, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1612102347),
	(53, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1612102347),
	(53, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1612102347),
	(53, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1612102347),
	(56, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1607823434),
	(39, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1608679708),
	(39, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1608679708),
	(61, 249, 249, 100, 0, 20245, 0, 30000, 0, 0, 1608512082),
	(38, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1608016411),
	(38, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1608016411),
	(38, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1608016411),
	(38, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1608016411),
	(38, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1608016411),
	(38, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1608016411),
	(38, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1608016411),
	(38, 216, 216, 37, 0, 115, 38, 8, 1, 65833, 1608016533),
	(38, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1608016411),
	(57, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1608239875),
	(57, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1608239875),
	(57, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1608239875),
	(57, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1608239875),
	(57, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1608239875),
	(62, 249, 249, 100, 0, 16990, 0, 18239, 0, 0, 1609308478),
	(38, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1608016411),
	(33, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1610415223),
	(57, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1608239875),
	(57, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1608239875),
	(57, 253, 253, 0, 0, 42099, 0, 0, 0, 16777216, 1608239875),
	(57, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1608239875),
	(57, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1608239875),
	(58, 43, 43, 3, 0, 13004, 0, 0, 0, 41, 1611177753),
	(39, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1608679708),
	(39, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1608679708),
	(33, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1610415223),
	(55, 420, 420, 10, 15, 2, 0, 10, 0, 289, 1610397992),
	(39, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1608679708),
	(39, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1608679708),
	(62, 253, 253, 1, 0, 26707, 0, 0, 0, 16777216, 1609308478),
	(1, 150, 150, 2, 0, 0, 0, 0, 0, 41, 1612990927),
	(1, 43, 43, 100, 0, 0, 0, 0, 0, 41, 1612990927),
	(39, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1608679708),
	(39, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1608679708),
	(39, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1608679708),
	(59, 474, 474, 2, 0, 0, 0, 0, 0, 768, 1611180883),
	(33, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1610415223),
	(33, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1610415223),
	(59, 249, 249, 100, 0, 6650, 0, 12808, 0, 0, 1611180134),
	(33, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1610415223),
	(59, 253, 253, 1, 0, 25299, 0, 0, 0, 16777216, 1611180134),
	(33, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1610415223),
	(33, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1610415223),
	(33, 253, 253, 0, 0, 31889, 0, 0, 0, 16777216, 1610415223),
	(4, 170, 170, 10, 0, 0, 0, 0, 0, 40, 1612036580),
	(4, 152, 152, 2, 0, 0, 0, 0, 0, 41, 1612036580),
	(4, 150, 150, 2, 0, 0, 0, 0, 0, 41, 1612036580),
	(4, 43, 43, 100, 0, 0, 0, 0, 0, 41, 1612036580),
	(4, 42, 42, 1000, 0, 0, 0, 0, 0, 41, 1612036580),
	(62, 43, 43, 3, 0, 26707, 0, 0, 0, 41, 1609308478),
	(33, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1610415223),
	(63, 249, 249, 100, 0, 20521, 0, 27638, 0, 0, 1610375451),
	(63, 253, 253, 0, 0, 21227, 0, 0, 0, 16777216, 1610375451),
	(62, 42, 42, 3, 0, 26707, 0, 0, 0, 41, 1609308478),
	(62, 100, 100, 55, 0, 30, 0, 0, 0, 41, 1609308478),
	(33, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1610415223),
	(60, 417, 417, 8, 0, 7119, 0, 0, 0, 289, 1611182273),
	(62, 41, 41, 11, 0, 1281, 0, 0, 1, 41, 1609308478),
	(62, 40, 40, 50, 0, 1286, 0, 0, 2, 41, 1609308478),
	(60, 253, 253, 1, 0, 9064, 0, 0, 0, 16777216, 1611180152),
	(59, 43, 43, 3, 0, 25299, 0, 0, 0, 41, 1611180134),
	(59, 42, 42, 3, 0, 25299, 0, 0, 0, 41, 1611180134),
	(65, 43, 43, 3, 0, 23516, 0, 0, 0, 41, 1610559456),
	(65, 42, 42, 3, 0, 23516, 0, 0, 0, 41, 1610559456),
	(1, 42, 42, 1000, 0, 0, 0, 0, 0, 41, 1612990927),
	(59, 41, 41, 29, 0, 864, 0, 0, 5, 41, 1611182176),
	(60, 43, 43, 3, 0, 9064, 0, 0, 0, 41, 1611180152),
	(58, 42, 42, 3, 0, 13004, 0, 0, 0, 41, 1611177753),
	(9, 43, 43, 6, 0, 56, 0, 0, 0, 41, 1611291390),
	(60, 42, 42, 3, 0, 9064, 0, 0, 0, 41, 1611180152),
	(59, 40, 40, 220, 0, 873, 0, 0, 5, 41, 1611182185),
	(67, 41, 41, 29, 0, 762, 0, 0, 5, 41, 1613199001),
	(58, 41, 41, 29, 0, 218, 0, 0, 5, 41, 1611177753),
	(8, 251, 251, 0, 0, 340, 6461, 0, 0, 8421408, 1612134458),
	(58, 40, 40, 220, 0, 224, 0, 0, 5, 41, 1611177753),
	(60, 39, 39, 6, 0, 198, 0, 0, 0, 41, 1611182252),
	(60, 37, 37, 500, 0, 183, 0, 0, 4, 41, 1611182238),
	(60, 41, 41, 29, 0, 1273, 0, 0, 5, 41, 1611181827),
	(60, 40, 40, 220, 0, 1263, 0, 0, 5, 41, 1611181817),
	(60, 36, 36, 4, 0, 140, 0, 0, 0, 41, 1611182194),
	(66, 522, 522, 1, 0, 0, 0, 0, 0, 32, 1613104517),
	(66, 170, 170, 300, 0, 0, 0, 0, 0, 40, 1613104517),
	(66, 89, 89, 1000, 0, 0, 0, 0, 0, 41, 1613104517),
	(66, 88, 88, 1000, 0, 0, 0, 0, 0, 41, 1613104517),
	(66, 50, 50, 1, 0, 0, 0, 0, 0, 32, 1613104517),
	(66, 49, 49, 1, 0, 0, 0, 0, 0, 32, 1613104517),
	(66, 48, 48, 1, 0, 0, 0, 0, 0, 32, 1613104517),
	(66, 47, 47, 1, 0, 0, 0, 0, 0, 32, 1613104517),
	(66, 46, 46, 1, 0, 0, 0, 0, 0, 32, 1613104517),
	(66, 44, 44, 1, 0, 0, 0, 0, 0, 32, 1613104517),
	(66, 43, 43, 99, 0, 0, 0, 0, 0, 41, 1613104517),
	(66, 42, 42, 99, 0, 0, 0, 0, 0, 41, 1613104517),
	(10, 254, 254, 107, 0, 0, 69, 1, 0, 8912896, 1613076627),
	(67, 40, 40, 220, 0, 768, 0, 0, 5, 41, 1613199001),
	(73, 113, 113, 3, 0, 2471, 0, 0, 0, 41, 1613199017),
	(73, 41, 41, 29, 0, 735, 0, 0, 5, 41, 1613199017),
	(73, 40, 40, 220, 0, 741, 0, 0, 5, 41, 1613199017),
	(5, 170, 170, 10, 0, 0, 0, 0, 0, 40, 1613252036),
	(68, 417, 417, 8, 0, 6695, 0, 0, 0, 289, 1613199097),
	(68, 401, 401, 0, 0, 6685, 0, 0, 0, 288, 1613199087),
	(5, 152, 152, 2, 0, 0, 0, 0, 0, 41, 1613252036),
	(68, 188, 188, 422, 0, 6599, 0, 0, 0, 4194336, 1613199001),
	(68, 41, 41, 29, 0, 752, 0, 0, 5, 41, 1613199001),
	(68, 40, 40, 220, 0, 758, 0, 0, 5, 41, 1613199001),
	(5, 150, 150, 2, 0, 0, 0, 0, 0, 41, 1613252036),
	(5, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1613252036),
	(5, 43, 43, 100, 0, 0, 0, 0, 0, 41, 1613252036),
	(5, 42, 42, 1000, 0, 0, 0, 0, 0, 41, 1613252036);
/*!40000 ALTER TABLE `char_effects` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
