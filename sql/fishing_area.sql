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

-- Dumping structure for table tpzdb.fishing_area
CREATE TABLE IF NOT EXISTS `fishing_area` (
  `zoneid` smallint(5) unsigned NOT NULL,
  `areaid` smallint(5) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `bound_type` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `bound_height` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `bound_radius` smallint(5) unsigned NOT NULL DEFAULT 0,
  `bounds` blob DEFAULT NULL,
  `center_x` float(7,3) NOT NULL DEFAULT 0.000,
  `center_y` float(7,3) NOT NULL DEFAULT 0.000,
  `center_z` float(7,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`zoneid`,`areaid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.fishing_area: 169 rows
/*!40000 ALTER TABLE `fishing_area` DISABLE KEYS */;
INSERT INTO `fishing_area` (`zoneid`, `areaid`, `name`, `bound_type`, `bound_height`, `bound_radius`, `bounds`, `center_x`, `center_y`, `center_z`) VALUES
	(1, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(2, 1, 'South Landing', 1, 20, 150, _binary '', 172.250, -2.000, -475.286),
	(2, 2, 'Other Waterside South', 1, 20, 60, _binary '', -101.576, 0.000, -484.401),
	(2, 3, 'Other Waterside Center', 1, 20, 60, _binary '', -221.249, 0.000, -283.157),
	(2, 4, 'Other Waterside North', 1, 20, 20, _binary '', -179.219, 1.000, -131.611),
	(2, 5, 'Central Landing', 1, 20, 80, _binary '', -164.099, 0.000, 59.123),
	(2, 6, 'North Landing', 1, 20, 150, _binary '', -332.920, -2.000, 564.747),
	(3, 1, 'Dhalmel Rock', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(3, 2, 'Maliyakaleya Reef', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(3, 3, 'Purgonorgo Isle', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(4, 1, 'PI - South Beach', 2, 20, 0, _binary 0x0000DCC300000000000057C4000082C300000000000057C4000082C300000000000075C40000E1C300000000000075C4, 0.000, 0.000, 0.000),
	(4, 2, 'PI - North Beach', 1, 20, 150, _binary '', -360.000, 0.000, -390.000),
	(4, 3, 'PI - West Beach', 1, 20, 150, _binary '', -660.000, 0.000, -680.000),
	(4, 4, 'PI - East Beach', 1, 20, 150, _binary '', -110.000, 0.000, -640.000),
	(4, 5, 'BB - South Seaside', 1, 50, 40, _binary '', 309.000, -10.000, 186.000),
	(4, 6, 'BB - Other Seaside', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(11, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(24, 1, 'Leremieu Lagoon', 1, 20, 50, _binary '', 96.000, -5.000, 28.000),
	(24, 2, 'Seaside', 1, 20, 60, _binary '', 0.000, 0.000, -320.000),
	(24, 3, 'Rafeloux River', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(25, 1, 'Cascade Edellaine', 1, 20, 62, _binary '', -192.000, -15.000, 640.000),
	(25, 2, 'Seaside', 1, 20, 100, _binary '', 700.000, 0.000, -535.000),
	(25, 3, 'Rafeloux River', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(26, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(27, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(46, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(47, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(48, 1, 'Whole Zone', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(50, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(51, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(52, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(53, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(54, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(57, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(58, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(59, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(61, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(65, 1, 'Pond', 1, 20, 60, _binary '', -103.000, 11.000, -65.000),
	(65, 2, 'Other Waterside', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(68, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(79, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(100, 1, 'Knightwell', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(101, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(102, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(103, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(104, 1, 'Crystalwater Spring', 1, 20, 20, _binary '', 300.000, 1.000, -179.833),
	(104, 2, 'Lake Mechieume - Mouth', 1, 20, 31, _binary '', 19.458, 3.000, 334.528),
	(104, 3, 'Lake Mechieume - Main', 2, 20, 0, _binary 0xC1CA2BC30000000010981544DF4F0B430000000064D3114477DE0D4300000000EC41A143235B30C3000000006871A343, 0.000, 5.000, 0.000),
	(104, 4, 'Maidens Spring', 1, 20, 22, _binary '', -496.682, 9.000, 298.057),
	(104, 5, 'River', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(105, 1, 'North Seaside', 1, 20, 200, _binary '', 291.891, 7.000, 198.639),
	(105, 2, 'South Seaside', 1, 20, 150, _binary '', 102.172, 8.000, -489.808),
	(106, 1, 'Basin of Waterfall', 1, 20, 27, _binary '', -230.433, 96.000, 462.000),
	(106, 2, 'River', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(107, 1, 'Hot Springs', 1, 20, 150, _binary '', -485.042, 44.000, -415.916),
	(107, 2, 'Seaside', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(109, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(110, 1, 'Small Fountain 1', 1, 20, 20, _binary '', -538.750, -14.000, -179.103),
	(110, 2, 'Fountain of Promises', 1, 20, 70, _binary '', -670.355, -21.000, -175.250),
	(110, 3, 'Fountain of Partings', 1, 20, 60, _binary '', -721.715, -26.000, -423.003),
	(110, 4, 'Small Fountain 2', 1, 20, 20, _binary '', 257.238, -30.000, -258.576),
	(111, 1, 'Seaside', 1, 20, 150, _binary '', 435.000, -1.000, -92.000),
	(111, 2, 'Ponds', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(113, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(114, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(115, 1, 'Pond', 1, 20, 25, _binary '', 110.000, -1.000, -200.000),
	(115, 2, 'Seaside', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(116, 1, 'Seaside', 2, 20, 0, _binary 0x6666E2C1000000000A372AC49A9941C1000000005C3F32C43333BEC200000000D79333C4004006C300000000F6F825C4291C03C3000000009AA920C4, 0.000, 9.000, 0.000),
	(116, 2, 'Other Waterside (south)', 1, 20, 25, _binary '', -144.690, -5.000, -360.580),
	(116, 3, 'Other Waterside (west)', 1, 20, 25, _binary '', -237.236, -1.000, -224.762),
	(116, 4, 'Other Waterside (rivers)', 2, 50, 0, _binary 0x7B146DC2000000007B1477C2D763A7C300000000CDCC78C2C355A3C300000000CD6C3644B89E054400000000F638364400800644000000009A597BC348E158C200000000AE074CC3, 0.000, -12.000, 0.000),
	(116, 5, 'Lake Tepokalipuka', 2, 20, 0, _binary 0x0000B4C30000000000004CC30000B4C300000000000096C2A4707FC300000000000096C233F36BC300000000EC51E6C2523894C200000000F628E7C266E6A2C2000000003D8A2AC37BD478C3000000007B1429C3CD8C83C3000000005CCF46C3, 0.000, -1.000, 0.000),
	(118, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(120, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(121, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(122, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(123, 1, 'Northeast Pond', 1, 20, 15, _binary '', 380.000, 21.000, 296.000),
	(123, 2, 'Gremini Falls', 1, 20, 32, _binary '', 428.000, 20.000, 278.000),
	(123, 3, 'Southwest Pond', 1, 20, 15, _binary '', -340.000, 16.000, -456.000),
	(123, 4, 'Southwest Waterfall - South', 1, 20, 28, _binary '', -458.000, 17.000, -446.000),
	(123, 5, 'Southwest Waterfall - North', 1, 20, 45, _binary '', -446.000, 17.000, -379.000),
	(123, 6, 'Other Waterside', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(124, 1, 'Front of Temple - East Side', 1, 20, 33, _binary '', 332.000, 3.500, -514.000),
	(124, 2, 'Front of Temple - West Side', 1, 20, 32, _binary '', 275.000, 3.500, -514.000),
	(124, 3, 'Teardrop Spring', 1, 20, 20, _binary '', 539.000, 0.000, -420.000),
	(124, 4, 'Underground Pool 1', 1, 10, 10, _binary '', 106.000, 9.000, -577.000),
	(124, 5, 'Bloodlet Spring', 1, 20, 20, _binary '', 219.000, -1.000, 60.000),
	(124, 6, 'Underground Pool 3', 1, 10, 10, _binary '', -496.000, 9.000, -186.000),
	(124, 7, 'Underground Pool 2', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(125, 1, 'Oasis of Hubol', 1, 20, 50, _binary '', -640.000, 2.000, -313.000),
	(125, 2, 'Central Spring', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(126, 1, 'Northwest Seaside', 1, 20, 80, _binary '', -100.000, -21.000, 390.000),
	(126, 2, 'Southwest Seaside', 1, 20, 90, _binary '', 15.000, -19.000, -83.000),
	(126, 3, 'Other Seaside', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(130, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(140, 1, 'Pond North', 1, 20, 12, _binary '', -174.165, -21.000, 414.486),
	(140, 2, 'Pond South', 1, 20, 15, _binary '', -215.293, -10.000, 25.168),
	(140, 3, 'River', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(142, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(143, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(145, 1, 'Giddeus Spring', 1, 20, 15, _binary '', 224.758, -2.000, -296.078),
	(145, 2, 'Pond - West', 1, 20, 15, _binary '', -254.810, -2.000, -255.620),
	(145, 3, 'Pond - North', 1, 20, 20, _binary '', -100.000, 1.500, -140.000),
	(145, 4, 'Misc Puddles', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(149, 1, 'Basin of a Waterfall', 1, 20, 10, _binary '', 180.240, 3.000, -384.460),
	(149, 2, 'Wailing Pond', 1, 20, 20, _binary '', 382.240, 0.000, -180.410),
	(149, 3, 'Pond', 1, 20, 50, _binary '', 198.750, 2.000, -107.220),
	(149, 4, 'Other Waterside', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(151, 1, 'PLD AF Fishing Spot', 1, 10, 15, _binary '', -80.000, 24.000, -40.000),
	(151, 2, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(153, 1, 'Waterfall Basin', 1, 20, 27, _binary '', 45.000, -18.000, -173.000),
	(153, 2, 'Waterfall Basin - Hidden', 1, 20, 20, _binary '', -244.000, 10.000, -278.000),
	(153, 3, 'Other Waterside', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(154, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(157, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(158, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(159, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(160, 1, 'Pool E-8', 1, 20, 20, _binary '', 175.000, 17.000, 176.000),
	(160, 2, 'Pool F-11', 1, 20, 20, _binary '', -24.000, 17.000, -216.000),
	(160, 3, 'Misc Water', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(166, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(167, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(172, 1, 'River', 1, 20, 20, _binary '', -100.310, -1.000, 20.168),
	(172, 2, 'Pool', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(173, 1, 'Salt Water', 2, 20, 0, _binary 0x000090C20000000000001643000034C20000000000001643000034C200000000000050C2000090C200000000000050C2, 0.000, -2.000, 0.000),
	(173, 2, 'Fresh Water', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(174, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(176, 1, 'Other Seaside', 1, 20, 20, _binary '', 26.600, 10.000, 182.000),
	(176, 2, 'Pond Under a Bridge', 1, 20, 22, _binary '', 100.000, 10.000, -19.000),
	(176, 3, 'Interior of Hidden Door - Mythril', 1, 20, 20, _binary '', -306.000, 21.000, -62.000),
	(176, 4, 'Interior of Hidden Door - Gold', 1, 20, 20, _binary '', -256.000, 51.000, -345.000),
	(176, 5, 'Misc Puddles', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(178, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(184, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(191, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(193, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(196, 1, 'Pool Upper West', 1, 20, 12, _binary '', -136.705, -59.000, -99.459),
	(196, 2, 'Pool Upper East', 1, 20, 12, _binary '', 216.119, -59.000, -100.126),
	(196, 3, 'Pool Lower East', 1, 20, 12, _binary '', 176.517, -39.000, -19.909),
	(196, 4, 'Interior Pool West', 1, 20, 25, _binary '', -80.224, -27.000, 446.559),
	(196, 5, 'Interior Pool Center', 1, 20, 25, _binary '', 39.236, -11.000, 446.130),
	(196, 6, 'Interior Pool East', 1, 20, 25, _binary '', 120.311, -19.000, 446.192),
	(204, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(208, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(212, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(213, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(220, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(221, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(227, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(228, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(231, 1, 'Whole Zone', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(232, 1, 'Whole Zone', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(234, 1, 'Whole Zone', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(235, 1, 'North Side', 2, 20, 0, _binary 0xE32E85C3000000008262F4C11CEB1CC1000000007446D4C1098AF1C000000000D22FEDC2DDA404C300000000D676EFC2219039C3000000001EB6BCC221D058C3000000007328C1C254A363C300000000FFB2E9C2DC5778C3000000001846EFC2DC8F86C3000000008FD3DBC2, 0.000, -6.000, 0.000),
	(235, 2, 'South Side', 0, 0, 0, _binary '', 0.000, -6.000, 0.000),
	(236, 1, 'Whole Zone', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(237, 1, 'Whole Zone', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(238, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(239, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(240, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(241, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(242, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(245, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(246, 1, 'Whole Zone', 0, 0, 0, _binary '', 0.000, 0.000, 0.000),
	(247, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(248, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(249, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(250, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000),
	(252, 1, 'Whole Zone', 0, 0, 0, NULL, 0.000, 0.000, 0.000);
/*!40000 ALTER TABLE `fishing_area` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
