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

-- Dumping structure for table tpzdb.item_mods_pet
CREATE TABLE IF NOT EXISTS `item_mods_pet` (
  `itemId` smallint(5) unsigned NOT NULL,
  `modId` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL DEFAULT 0,
  `petType` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemId`,`modId`,`petType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 PACK_KEYS=1;

-- Dumping data for table tpzdb.item_mods_pet: 851 rows
/*!40000 ALTER TABLE `item_mods_pet` DISABLE KEYS */;
INSERT INTO `item_mods_pet` (`itemId`, `modId`, `value`, `petType`) VALUES
	(10296, 25, 3, 3),
	(10296, 26, 3, 3),
	(10296, 30, 3, 3),
	(10299, 288, 2, 0),
	(10370, 28, 3, 1),
	(10370, 30, 3, 1),
	(10370, 126, 3, 1),
	(10440, 384, 600, 3),
	(10530, 28, 5, 1),
	(10531, 28, 5, 1),
	(10532, 28, 5, 1),
	(10537, 23, 9, 1),
	(10537, 126, 4, 1),
	(10542, 23, 12, 1),
	(10542, 126, 5, 1),
	(10664, 28, 4, 1),
	(10664, 346, 3, 1),
	(10684, 165, 6, 1),
	(10684, 346, 3, 1),
	(10724, 30, 5, 1),
	(10744, 562, 5, 1),
	(10817, 384, 500, 0),
	(10914, 27, -2, 0),
	(10915, 27, -3, 0),
	(10972, 161, -3, 0),
	(11052, 126, 3, 1),
	(11098, 126, 10, 1),
	(11118, 25, 15, 1),
	(11138, 345, 500, 1),
	(11158, 30, 5, 1),
	(11198, 126, 5, 1),
	(11218, 25, 10, 1),
	(11238, 345, 250, 1),
	(11258, 30, 5, 1),
	(11261, 12, 10, 3),
	(11261, 13, 10, 3),
	(11297, 2, 20, 4),
	(11297, 5, 20, 4),
	(14523, 2, 18, 6),
	(14523, 2, 16, 7),
	(14523, 5, 24, 7),
	(14523, 2, 24, 5),
	(11298, 25, 10, 3),
	(11299, 25, 10, 3),
	(11338, 25, 3, 0),
	(11338, 289, 3, 0),
	(11388, 28, 5, 3),
	(11389, 28, 5, 3),
	(11470, 72, 3, 3),
	(11470, 71, 3, 3),
	(11471, 370, 1, 3),
	(11472, 370, 1, 3),
	(11497, 384, 500, 0),
	(11531, 73, 3, 0),
	(11555, 25, 10, 0),
	(11564, 28, 1, 1),
	(11571, 25, 12, 3),
	(11612, 28, 2, 1),
	(11617, 288, 2, 0),
	(11619, 368, 25, 1),
	(11711, 25, 3, 0),
	(11720, 23, 2, 3),
	(11720, 24, 3, 3),
	(11720, 28, 3, 3),
	(11739, 27, 2, 1),
	(11739, 28, 2, 1),
	(11987, 126, 5, 1),
	(11987, 370, 1, 1),
	(12520, 27, -3, 1),
	(12649, 370, 1, 2),
	(12650, 27, -2, 1),
	(13974, 25, 5, 2),
	(13975, 27, -2, 1),
	(14103, 27, -2, 1),
	(14103, 68, 5, 1),
	(14227, 3, 10, 2),
	(14228, 25, 10, 1),
	(14228, 27, -2, 1),
	(14405, 2, 65, 2),
	(14405, 72, 65, 2),
	(14468, 27, 5, 1),
	(14486, 370, 1, 2),
	(14514, 165, 4, 1),
	(14523, 2, 20, 4),
	(14523, 5, 20, 4),
	(17857, 5, 60, 7),
	(17857, 2, 40, 7),
	(17857, 2, 45, 6),
	(17857, 2, 60, 5),
	(14872, 2, 10, 2),
	(14903, 25, 5, 2),
	(14904, 27, -2, 1),
	(14923, 25, 14, 1),
	(14958, 63, 5, 0),
	(15031, 384, 300, 3),
	(15032, 384, 300, 3),
	(15101, 165, 3, 1),
	(15116, 25, 7, 1),
	(15146, 23, 7, 1),
	(15146, 357, -2, 1),
	(15239, 27, -3, 1),
	(15267, 72, 3, 3),
	(15267, 71, 3, 3),
	(15366, 27, -4, 1),
	(15366, 68, 5, 1),
	(15367, 2, 30, 2),
	(15574, 3, 15, 2),
	(15575, 25, 14, 1),
	(15575, 27, -2, 1),
	(15594, 27, 2, 1),
	(15602, 374, 5, 3),
	(15602, 168, 10, 3),
	(15647, 1, 10, 0),
	(15649, 1, 10, 0),
	(15661, 2, 50, 2),
	(15679, 23, 10, 1),
	(15679, 27, 2, 1),
	(15679, 357, -2, 1),
	(15910, 1, 5, 0),
	(15910, 27, 3, 0),
	(15944, 163, -7, 0),
	(16173, 1, 10, 0),
	(16245, 23, 15, 3),
	(16270, 2, 50, 2),
	(28457, 384, 400, 0),
	(16351, 374, 5, 3),
	(16351, 168, 10, 3),
	(16352, 30, 5, 3),
	(16353, 30, 7, 3),
	(16368, 25, 10, 0),
	(16654, 368, 10, 0),
	(16843, 25, 10, 2),
	(16843, 23, 10, 2),
	(17579, 2, 50, 2),
	(17857, 2, 50, 4),
	(17857, 5, 50, 4),
	(11297, 2, 18, 6),
	(11297, 2, 16, 7),
	(11297, 5, 24, 7),
	(11297, 2, 24, 5),
	(17961, 1, 10, 0),
	(18547, 370, 3, 0),
	(18745, 3, 1, 3),
	(18746, 3, 2, 3),
	(18778, 369, 1, 3),
	(18778, 370, 1, 3),
	(18780, 368, 10, 3),
	(18791, 2, 30, 3),
	(18791, 23, 9, 3),
	(18791, 24, 9, 3),
	(18792, 2, 40, 3),
	(18792, 23, 10, 3),
	(18792, 24, 10, 3),
	(18999, 23, 40, 0),
	(19005, 28, 20, 1),
	(19068, 23, 50, 0),
	(19074, 28, 25, 1),
	(19088, 23, 60, 0),
	(19094, 28, 30, 1),
	(19620, 23, 70, 0),
	(19626, 28, 35, 1),
	(19718, 23, 70, 0),
	(19724, 28, 35, 1),
	(19772, 28, 1, 1),
	(19827, 23, 80, 0),
	(19833, 28, 40, 1),
	(19956, 23, 80, 0),
	(19962, 28, 40, 1),
	(20792, 23, 80, 0),
	(20793, 23, 80, 0),
	(20822, 27, 6, 0),
	(20822, 68, 40, 0),
	(20831, 288, 2, 0),
	(20832, 288, 3, 0),
	(20944, 370, 2, 2),
	(20944, 161, -3, 2),
	(21141, 126, 40, 1),
	(21142, 126, 40, 1),
	(21155, 30, 35, 1),
	(21155, 28, 110, 1),
	(21155, 126, 3, 1),
	(21167, 30, 20, 1),
	(21167, 28, 120, 1),
	(21167, 27, 10, 1),
	(21183, 28, 114, 1),
	(21361, 28, 6, 0),
	(21526, 25, 50, 3),
	(21526, 26, 50, 3),
	(21526, 30, 50, 3),
	(21715, 25, 30, 0),
	(21715, 26, 30, 0),
	(21715, 30, 30, 0),
	(21716, 25, 40, 0),
	(21716, 26, 40, 0),
	(21716, 30, 40, 0),
	(21717, 25, 50, 0),
	(21717, 26, 50, 0),
	(21717, 30, 50, 0),
	(21751, 23, 80, 0),
	(21865, 370, 5, 2),
	(21866, 370, 8, 2),
	(22015, 30, 10, 1),
	(22016, 30, 15, 1),
	(22054, 28, 115, 1),
	(22054, 30, 35, 1),
	(22063, 126, 40, 1),
	(22074, 126, 3, 1),
	(22075, 126, 5, 1),
	(22096, 25, 50, 1),
	(22096, 26, 50, 1),
	(22096, 30, 50, 1),
	(22210, 126, 3, 1),
	(22211, 126, 5, 1),
	(23057, 25, 31, 3),
	(23057, 369, 1, 3),
	(23057, 370, 3, 3),
	(23057, 384, 600, 3),
	(23120, 370, 10, 2),
	(23121, 25, 35, 1),
	(23121, 30, 35, 1),
	(23121, 126, 14, 1),
	(23124, 2, 165, 3),
	(23124, 5, 165, 3),
	(23124, 384, 400, 3),
	(23191, 25, 32, 3),
	(23191, 384, 500, 3),
	(23325, 28, 20, 3),
	(23325, 30, 40, 3),
	(23325, 384, 400, 3),
	(23392, 25, 41, 3),
	(23392, 369, 2, 3),
	(23392, 370, 6, 3),
	(23392, 384, 700, 3),
	(23455, 370, 15, 2),
	(23254, 3, 25, 2),
	(23258, 5, 75, 3),
	(23258, 160, -3, 3),
	(23258, 374, 14, 3),
	(23258, 384, 400, 3),
	(23456, 25, 45, 1),
	(23456, 30, 45, 1),
	(23456, 126, 16, 1),
	(23459, 2, 220, 3),
	(23459, 5, 220, 3),
	(23459, 384, 500, 3),
	(23526, 25, 42, 3),
	(23526, 384, 500, 3),
	(23589, 3, 27, 2),
	(23593, 5, 75, 3),
	(23593, 160, -6, 3),
	(23593, 374, 14, 3),
	(23593, 384, 600, 3),
	(23660, 28, 25, 3),
	(23660, 30, 50, 3),
	(23660, 384, 500, 3),
	(23674, 68, 38, 0),
	(23674, 161, -5, 0),
	(23679, 2, 290, 2),
	(23679, 370, 10, 2),
	(23680, 23, 89, 1),
	(23680, 25, 36, 1),
	(23680, 562, 13, 1),
	(23683, 28, 57, 3),
	(23683, 30, 43, 3),
	(25465, 25, 15, 0),
	(25465, 26, 15, 0),
	(25465, 30, 15, 0),
	(25466, 25, 20, 0),
	(25466, 26, 20, 0),
	(25466, 30, 20, 0),
	(25467, 25, 25, 0),
	(25467, 26, 25, 0),
	(25467, 30, 25, 0),
	(25501, 25, 15, 1),
	(25501, 26, 15, 1),
	(25501, 30, 15, 1),
	(25502, 25, 20, 1),
	(25502, 26, 20, 1),
	(25502, 30, 20, 1),
	(25503, 25, 25, 1),
	(25503, 26, 25, 1),
	(25503, 30, 25, 1),
	(25519, 25, 15, 3),
	(25519, 26, 15, 3),
	(25519, 30, 15, 3),
	(25520, 25, 20, 3),
	(25520, 26, 20, 3),
	(25520, 30, 20, 3),
	(25521, 25, 25, 3),
	(25521, 26, 25, 3),
	(25521, 30, 25, 3),
	(25563, 25, 40, 0),
	(25563, 26, 40, 0),
	(25563, 27, 8, 0),
	(25563, 384, 600, 0),
	(25564, 25, 50, 0),
	(25564, 26, 50, 0),
	(25564, 27, 10, 0),
	(25564, 384, 600, 0),
	(25565, 368, 3, 1),
	(25566, 368, 4, 1),
	(26201, 23, 23, 0),
	(26201, 24, 23, 0),
	(26201, 25, 22, 0),
	(26201, 26, 22, 0),
	(26201, 384, 400, 0),
	(26201, 160, -4, 0),
	(26652, 28, 20, 1),
	(26653, 28, 23, 1),
	(26658, 369, 2, 3),
	(26658, 370, 3, 3),
	(26659, 369, 3, 3),
	(26659, 370, 3, 3),
	(26774, 345, 525, 3),
	(26775, 345, 550, 3),
	(26828, 165, 8, 1),
	(26829, 165, 12, 1),
	(26834, 25, 18, 3),
	(26834, 26, 18, 3),
	(26834, 73, 12, 3),
	(26835, 25, 21, 3),
	(26835, 26, 21, 3),
	(26835, 73, 13, 3),
	(26888, 27, 14, 1),
	(26926, 126, 10, 1),
	(26927, 126, 11, 1),
	(27004, 25, 20, 1),
	(27004, 384, 200, 1),
	(27005, 25, 28, 1),
	(27005, 384, 300, 1),
	(27010, 289, 7, 3),
	(27010, 384, 400, 3),
	(27011, 289, 9, 3),
	(27011, 384, 500, 3),
	(27044, 2, 50, 2),
	(27080, 25, 20, 1),
	(27081, 25, 30, 1),
	(27086, 8, 13, 3),
	(27086, 9, 13, 3),
	(27086, 11, 13, 3),
	(27087, 8, 16, 3),
	(27087, 9, 16, 3),
	(27087, 11, 16, 3),
	(27180, 30, 10, 1),
	(27181, 30, 13, 1),
	(27186, 30, 15, 3),
	(27186, 170, 7, 3),
	(27187, 30, 18, 3),
	(27187, 170, 8, 3),
	(27221, 27, 4, 1),
	(27221, 126, 7, 1),
	(27265, 345, 550, 1),
	(27266, 345, 600, 1),
	(27356, 23, 28, 1),
	(27356, 562, 7, 1),
	(27357, 23, 28, 1),
	(27357, 562, 9, 1),
	(27362, 28, 15, 3),
	(27362, 30, 12, 3),
	(27363, 28, 18, 3),
	(27363, 30, 15, 3),
	(27439, 30, 17, 1),
	(27440, 30, 27, 1),
	(27445, 12, 17, 3),
	(27445, 13, 17, 3),
	(27446, 12, 20, 3),
	(27446, 13, 20, 3),
	(27677, 27, 4, 1),
	(27680, 71, 6, 3),
	(27680, 72, 6, 3),
	(27680, 384, 500, 3),
	(27698, 27, 4, 1),
	(27701, 71, 8, 3),
	(27701, 72, 8, 3),
	(27701, 384, 500, 3),
	(27820, 370, 2, 2),
	(27821, 126, 11, 1),
	(27824, 2, 85, 3),
	(27824, 5, 85, 3),
	(27824, 384, 300, 3),
	(27841, 370, 3, 2),
	(27842, 126, 12, 1),
	(27845, 2, 110, 3),
	(27845, 5, 110, 3),
	(27845, 384, 300, 3),
	(27957, 27, 5, 1),
	(27960, 384, 300, 3),
	(27978, 27, 5, 1),
	(27981, 384, 400, 3),
	(28025, 25, 20, 0),
	(28025, 26, 20, 0),
	(28025, 30, 20, 0),
	(28025, 384, 600, 0),
	(28103, 3, 20, 2),
	(28104, 25, 20, 1),
	(28104, 27, 4, 1),
	(28107, 5, 40, 3),
	(28107, 374, 10, 3),
	(28107, 384, 300, 3),
	(28119, 23, 20, 0),
	(28124, 3, 23, 2),
	(28125, 25, 20, 1),
	(28125, 27, 4, 1),
	(28128, 5, 50, 3),
	(28128, 374, 12, 3),
	(28128, 384, 300, 3),
	(28141, 25, 20, 0),
	(28141, 23, 10, 0),
	(28141, 26, 20, 0),
	(28141, 24, 10, 0),
	(28141, 68, 20, 0),
	(28141, 384, 300, 0),
	(28211, 23, 15, 1),
	(28211, 384, 200, 1),
	(28213, 23, 13, 2),
	(28214, 68, 5, 0),
	(28219, 68, 2, 0),
	(28231, 23, 10, 0),
	(28231, 25, 10, 0),
	(28237, 27, 5, 1),
	(28237, 68, 20, 1),
	(28237, 126, 5, 1),
	(28240, 384, 300, 3),
	(28252, 23, 10, 0),
	(28252, 25, 10, 0),
	(28258, 27, 5, 1),
	(28258, 68, 20, 1),
	(28258, 126, 6, 1),
	(28261, 384, 300, 3),
	(28356, 28, 5, 1),
	(28432, 25, 15, 3),
	(28432, 26, 15, 3),
	(28432, 30, 15, 3),
	(28432, 384, 500, 3),
	(28432, 170, 5, 3),
	(28495, 384, 300, 0),
	(28495, 27, 5, 0),
	(28495, 160, -1, 0),
	(28588, 23, 15, 3),
	(28588, 25, 15, 3),
	(28588, 68, 10, 3),
	(28605, 25, 7, 1),
	(28605, 30, 7, 1),
	(28643, 12, 8, 3),
	(28643, 13, 8, 3),
	(28643, 30, 3, 3),
	(21751, 587, 500, 2),
	(23406, 384, 600, 0),
	(23540, 161, -6, 0),
	(23607, 384, 600, 0),
	(23607, 73, 7, 0),
	(23545, 163, -11, 2),
	(23612, 161, -11, 2),
	(23412, 23, 62, 1),
	(23412, 28, 60, 1),
	(23479, 288, 15, 1),
	(23479, 165, 20, 1),
	(23546, 25, 52, 1),
	(23546, 684, 900, 1),
	(23613, 30, 45, 1),
	(23613, 28, 51, 1),
	(21395, 126, 15, 1),
	(21395, 25, 20, 1),
	(21395, 26, 20, 1),
	(21395, 30, 20, 1),
	(21394, 25, 15, 1),
	(21394, 26, 15, 1),
	(21394, 126, 10, 1),
	(21394, 30, 15, 1),
	(25610, 23, 35, 0),
	(25610, 384, 600, 0),
	(25683, 28, 35, 0),
	(25683, 160, -4, 0),
	(27114, 23, 35, 0),
	(27114, 73, 7, 0),
	(27299, 288, 5, 0),
	(27299, 165, 5, 0),
	(27299, 3, 21, 2),
	(27470, 370, 5, 0),
	(27470, 512, 6, 2),
	(22261, 8, 89, 3),
	(22261, 9, 89, 3),
	(22261, 10, 89, 3),
	(22261, 11, 89, 3),
	(22261, 12, 89, 3),
	(22261, 13, 89, 3),
	(22261, 14, 89, 3),
	(21452, 8, 89, 3),
	(21452, 9, 89, 3),
	(21452, 10, 89, 3),
	(21452, 11, 89, 3),
	(21452, 12, 89, 3),
	(21452, 13, 89, 3),
	(21452, 14, 89, 3),
	(21456, 8, 104, 3),
	(21456, 9, 104, 3),
	(21456, 10, 104, 3),
	(21456, 11, 104, 3),
	(21456, 12, 104, 3),
	(21456, 13, 104, 3),
	(21456, 14, 104, 3),
	(21457, 8, 109, 3),
	(21457, 9, 109, 3),
	(21457, 10, 109, 3),
	(21457, 11, 109, 3),
	(21457, 12, 109, 3),
	(21457, 13, 109, 3),
	(21457, 14, 109, 3),
	(21458, 8, 104, 3),
	(21458, 9, 104, 3),
	(21458, 10, 104, 3),
	(21458, 11, 104, 3),
	(21458, 12, 104, 3),
	(21458, 13, 104, 3),
	(21458, 14, 104, 3),
	(21459, 8, 109, 3),
	(21459, 9, 109, 3),
	(21459, 10, 109, 3),
	(21459, 11, 109, 3),
	(21459, 12, 109, 3),
	(21459, 13, 109, 3),
	(21459, 14, 109, 3),
	(23415, 25, 37, 3),
	(23415, 23, 57, 3),
	(23415, 26, 37, 3),
	(23415, 24, 57, 3),
	(23415, 370, 5, 3),
	(23415, 369, 5, 3),
	(23482, 25, 50, 3),
	(23482, 23, 60, 3),
	(23482, 26, 50, 3),
	(23482, 24, 60, 3),
	(23482, 73, 15, 3),
	(23549, 384, 700, 3),
	(23549, 289, 11, 3),
	(23616, 30, 48, 3),
	(23616, 28, 51, 3),
	(23616, 170, 10, 3),
	(23418, 2, 600, 8),
	(23686, 370, 5, 8),
	(21070, 160, -25, 8),
	(21080, 160, -25, 8),
	(21372, 160, -5, 8),
	(23473, 288, 5, 0),
	(23473, 384, 700, 0),
	(27253, 2978, 2, 0),
	(11232, 2978, 2, 0),
	(11132, 2978, 2, 0),
	(20542, 3, 8, 3),
	(20542, 6, 16, 3),
	(27254, 2978, 4, 0),
	(11072, 2975, 10, 0),
	(11172, 2975, 5, 0),
	(26756, 2975, 22, 0),
	(26757, 2975, 24, 0),
	(11212, 2974, 250, 0),
	(11112, 2974, 500, 0),
	(27068, 2974, 550, 0),
	(27069, 2974, 600, 0),
	(26766, 512, 12, 2),
	(26767, 512, 14, 2),
	(11177, 512, 8, 2),
	(11077, 512, 10, 2),
	(25949, 126, 9, 1),
	(21751, 587, 500, 0),
	(11238, 587, 250, 0),
	(11138, 587, 500, 0),
	(27265, 587, 550, 0),
	(27266, 587, 600, 0),
	(11181, 587, 250, 3),
	(11081, 587, 500, 3),
	(26774, 587, 525, 3),
	(26775, 587, 550, 3),
	(11221, 8, 10, 3),
	(11221, 9, 10, 3),
	(11221, 11, 10, 3),
	(11121, 8, 13, 3),
	(11121, 9, 13, 3),
	(11121, 11, 13, 3),
	(11161, 12, 13, 3),
	(11161, 13, 13, 3),
	(20807, 370, 3, 0),
	(20806, 370, 2, 0),
	(20799, 23, 20, 0),
	(20799, 24, 20, 0),
	(20799, 28, 15, 0),
	(20800, 23, 21, 0),
	(20800, 24, 21, 0),
	(20800, 28, 16, 0),
	(27106, 28, 25, 1),
	(27107, 28, 26, 1),
	(27108, 30, 25, 1),
	(27109, 30, 26, 1),
	(21083, 370, 3, 8),
	(21083, 160, -3, 8),
	(20944, 366, 200, 2),
	(26887, 27, 13, 1),
	(26887, 28, 30, 1),
	(26888, 28, 30, 1),
	(28490, 161, -3, 0),
	(28491, 161, -4, 0),
	(21454, 8, 46, 3),
	(21454, 9, 46, 3),
	(21454, 10, 46, 3),
	(21454, 11, 46, 3),
	(21454, 12, 46, 3),
	(21454, 13, 46, 3),
	(21454, 14, 46, 3),
	(21453, 8, 77, 3),
	(21453, 9, 77, 3),
	(21453, 10, 77, 3),
	(21453, 11, 77, 3),
	(21453, 12, 77, 3),
	(21453, 13, 77, 3),
	(21453, 14, 77, 3),
	(22260, 8, 46, 3),
	(22260, 9, 46, 3),
	(22260, 10, 46, 3),
	(22260, 11, 46, 3),
	(22260, 12, 46, 3),
	(22260, 13, 46, 3),
	(22260, 14, 46, 3),
	(21433, 366, 10, 3),
	(26780, 370, 2, 8),
	(26781, 370, 3, 8),
	(25609, 23, 25, 0),
	(25609, 384, 500, 0),
	(25682, 28, 25, 0),
	(25682, 160, -3, 0),
	(27113, 23, 25, 0),
	(27113, 73, 6, 0),
	(27298, 3, 20, 2),
	(27298, 165, 4, 0),
	(27298, 288, 4, 0),
	(27469, 370, 4, 0),
	(27469, 512, 5, 2),
	(25590, 25, 26, 0),
	(25590, 26, 26, 0),
	(25590, 30, 26, 0),
	(25590, 73, 4, 0),
	(25591, 25, 38, 0),
	(25591, 26, 38, 0),
	(25591, 30, 38, 0),
	(25591, 73, 6, 0),
	(25573, 25, 42, 0),
	(25573, 26, 42, 0),
	(25573, 30, 42, 0),
	(25573, 73, 7, 0),
	(25764, 25, 28, 0),
	(25764, 26, 28, 0),
	(25764, 30, 28, 0),
	(25765, 25, 40, 0),
	(25765, 26, 40, 0),
	(25765, 30, 40, 0),
	(25796, 25, 46, 0),
	(25796, 26, 46, 0),
	(25796, 30, 46, 0),
	(25812, 25, 25, 0),
	(25812, 26, 25, 0),
	(25812, 30, 25, 0),
	(25813, 25, 37, 0),
	(25813, 26, 37, 0),
	(25813, 30, 37, 0),
	(25834, 25, 43, 0),
	(25834, 26, 43, 0),
	(25834, 30, 43, 0),
	(25871, 25, 27, 0),
	(25871, 26, 27, 0),
	(25871, 30, 27, 0),
	(25871, 160, -3, 0),
	(25872, 25, 39, 0),
	(25872, 26, 39, 0),
	(25872, 30, 39, 0),
	(25872, 160, -4, 0),
	(25885, 25, 45, 0),
	(25885, 26, 45, 0),
	(25885, 30, 45, 0),
	(25885, 160, -5, 0),
	(25937, 25, 24, 0),
	(25937, 26, 24, 0),
	(25937, 30, 24, 0),
	(25937, 384, 600, 0),
	(25938, 25, 36, 0),
	(25938, 26, 36, 0),
	(25938, 30, 36, 0),
	(25938, 384, 700, 0),
	(25952, 25, 42, 0),
	(25952, 26, 42, 0),
	(25952, 30, 42, 0),
	(25952, 384, 700, 0),
	(26210, 25, 6, 0),
	(26210, 26, 6, 0),
	(26210, 30, 6, 0),
	(26676, 2, 100, 1),
	(26676, 25, 25, 1),
	(26676, 27, 9, 1),
	(26852, 2, 150, 1),
	(27028, 2, 80, 1),
	(27028, 25, 28, 1),
	(27028, 30, 28, 1),
	(27204, 2, 100, 1),
	(27204, 27, 5, 1),
	(27204, 126, 6, 1),
	(27380, 2, 80, 1),
	(27380, 126, 1, 1),
	(26082, 25, 15, 1),
	(26082, 26, 15, 1),
	(26082, 30, 15, 1),
	(26082, 126, 10, 1),
	(27528, 126, 5, 1),
	(20826, 25, 30, 0),
	(20826, 384, 300, 0),
	(27099, 23, 20, 0),
	(27099, 24, 20, 0),
	(27284, 25, 20, 0),
	(27284, 26, 20, 0),
	(26792, 25, 20, 0),
	(26792, 23, 20, 0),
	(26792, 26, 20, 0),
	(26792, 24, 20, 0),
	(26948, 288, 3, 0),
	(27098, 2, 150, 2),
	(27283, 23, 23, 0),
	(27283, 24, 23, 0),
	(27458, 25, 17, 0),
	(27458, 26, 17, 0),
	(26796, 28, 20, 1),
	(27102, 30, 20, 1),
	(27287, 160, -4, 0),
	(27462, 25, 20, 1),
	(27462, 23, 20, 1),
	(27462, 288, 3, 1),
	(28625, 23, 20, 0),
	(28630, 2, 100, 2),
	(28630, 23, 20, 2),
	(20801, 27, 5, 0),
	(20801, 288, 2, 0),
	(21156, 28, 110, 0),
	(27605, 23, 20, 0),
	(27605, 24, 20, 0),
	(27605, 73, 4, 0),
	(27605, 384, 200, 0),
	(21504, 25, 10, 3),
	(21504, 30, 10, 3),
	(21505, 30, 15, 3),
	(21505, 25, 15, 3),
	(21704, 25, 10, 0),
	(21705, 25, 15, 0),
	(26260, 126, 5, 1),
	(27141, 23, 20, 1),
	(27141, 28, 20, 1),
	(27141, 27, 5, 1),
	(27141, 126, 5, 1),
	(27778, 28, 10, 1),
	(27778, 30, 10, 1),
	(20516, 370, 4, 3),
	(20516, 369, 4, 3),
	(26000, 25, 5, 1),
	(26000, 30, 5, 1),
	(26000, 27, 5, 1),
	(21183, 30, 10, 1),
	(10687, 25, 15, 3),
	(10687, 73, 10, 3),
	(20606, 370, 2, 0),
	(20536, 23, 15, 3),
	(20813, 68, 15, 0),
	(21178, 23, 15, 1),
	(21178, 28, 100, 1),
	(21178, 370, 2, 1),
	(28017, 160, -4, 0),
	(27236, 30, 15, 1),
	(27236, 126, 6, 1),
	(21455, 8, 70, 3),
	(21455, 9, 70, 3),
	(21455, 10, 70, 3),
	(21455, 11, 70, 3),
	(21455, 12, 70, 3),
	(21455, 13, 70, 3),
	(21455, 14, 70, 3),
	(21455, 28, 40, 3),
	(28066, 160, -10, 8),
	(25992, 370, 5, 1),
	(25993, 370, 6, 1),
	(25973, 370, 5, 1),
	(25905, 370, 7, 1),
	(28505, 27, 5, 0),
	(28505, 288, 3, 0),
	(27985, 160, -11, 8),
	(27368, 370, 2, 8),
	(27369, 370, 3, 8),
	(28323, 25, 32, 3),
	(28323, 23, 15, 3),
	(28323, 26, 32, 3),
	(28323, 24, 15, 3),
	(20812, 384, 200, 0),
	(20812, 27, 7, 0),
	(20812, 160, -5, 0),
	(28451, 68, 10, 0),
	(28451, 289, 5, 0),
	(28451, 370, 1, 0),
	(28451, 160, -3, 0),
	(23071, 384, 500, 0),
	(23138, 288, 3, 0),
	(23138, 384, 600, 0),
	(23205, 161, -5, 0),
	(23272, 384, 500, 0),
	(23272, 73, 4, 0),
	(23339, 68, 28, 0),
	(23339, 161, -4, 0),
	(28642, 370, 1, 3),
	(28642, 369, 1, 3),
	(23210, 163, -10, 2),
	(23277, 161, -10, 2),
	(23344, 2, 260, 2),
	(23344, 370, 7, 2),
	(23077, 23, 47, 1),
	(23077, 28, 53, 1),
	(23144, 288, 10, 1),
	(23144, 165, 16, 1),
	(23211, 25, 42, 1),
	(23211, 384, 600, 1),
	(23278, 30, 35, 1),
	(23278, 28, 44, 1),
	(23345, 25, 26, 1),
	(23345, 23, 74, 1),
	(23345, 562, 11, 1),
	(16297, 160, -2, 0),
	(23083, 2, 500, 8),
	(23351, 370, 4, 8),
	(23080, 25, 27, 3),
	(23080, 23, 47, 3),
	(23080, 26, 27, 3),
	(23080, 24, 47, 3),
	(23080, 370, 4, 3),
	(23080, 369, 4, 3),
	(23147, 25, 40, 3),
	(23147, 23, 50, 3),
	(23147, 26, 40, 3),
	(23147, 24, 50, 3),
	(23147, 73, 14, 3),
	(23214, 384, 600, 3),
	(23214, 289, 10, 3),
	(23281, 30, 38, 3),
	(23281, 28, 44, 3),
	(23281, 170, 9, 3),
	(23348, 30, 33, 3),
	(23348, 28, 50, 3),
	(27323, 288, 3, 1),
	(27323, 165, 5, 1),
	(27323, 345, 650, 1),
	(27323, 126, 12, 1);
/*!40000 ALTER TABLE `item_mods_pet` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
