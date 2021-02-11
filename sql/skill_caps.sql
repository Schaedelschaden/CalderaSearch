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

-- Dumping structure for table tpzdb.skill_caps
CREATE TABLE IF NOT EXISTS `skill_caps` (
  `level` tinyint(2) unsigned NOT NULL,
  `r0` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r1` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r2` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r3` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r4` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r5` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r6` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r7` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r8` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r9` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r10` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r11` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r12` smallint(3) unsigned NOT NULL DEFAULT 0,
  `r13` smallint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=32 PACK_KEYS=1 ROW_FORMAT=FIXED;

-- Dumping data for table tpzdb.skill_caps: 100 rows
/*!40000 ALTER TABLE `skill_caps` DISABLE KEYS */;
INSERT INTO `skill_caps` (`level`, `r0`, `r1`, `r2`, `r3`, `r4`, `r5`, `r6`, `r7`, `r8`, `r9`, `r10`, `r11`, `r12`, `r13`) VALUES
	(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1, 0, 6, 6, 5, 5, 5, 5, 5, 5, 4, 4, 4, 3, 4),
	(2, 0, 9, 9, 7, 7, 7, 7, 7, 7, 6, 6, 6, 5, 6),
	(3, 0, 12, 12, 10, 10, 10, 10, 10, 10, 9, 9, 8, 7, 9),
	(4, 0, 15, 15, 13, 13, 13, 13, 13, 13, 12, 11, 10, 9, 12),
	(5, 0, 18, 18, 16, 16, 16, 16, 16, 16, 14, 14, 13, 11, 14),
	(6, 0, 21, 21, 19, 19, 19, 19, 19, 19, 17, 16, 15, 13, 17),
	(7, 0, 24, 24, 22, 22, 22, 21, 21, 21, 20, 19, 17, 15, 20),
	(8, 0, 27, 27, 25, 25, 25, 24, 24, 24, 22, 21, 20, 17, 22),
	(9, 0, 30, 30, 28, 28, 28, 27, 27, 27, 25, 24, 22, 19, 25),
	(10, 0, 33, 33, 31, 31, 31, 30, 30, 30, 28, 26, 24, 21, 28),
	(11, 0, 36, 36, 34, 34, 34, 33, 33, 33, 31, 29, 27, 23, 31),
	(12, 0, 39, 39, 36, 36, 36, 35, 35, 35, 33, 31, 29, 25, 33),
	(13, 0, 42, 42, 39, 39, 39, 38, 38, 38, 36, 34, 31, 27, 36),
	(14, 0, 45, 45, 42, 42, 42, 41, 41, 41, 39, 36, 33, 29, 39),
	(15, 0, 48, 48, 45, 45, 45, 44, 44, 44, 41, 39, 36, 31, 41),
	(16, 0, 51, 51, 48, 48, 48, 47, 47, 47, 44, 41, 38, 33, 44),
	(17, 0, 54, 54, 51, 51, 51, 49, 49, 49, 47, 44, 40, 35, 47),
	(18, 0, 57, 57, 54, 54, 54, 52, 52, 52, 49, 46, 43, 37, 49),
	(19, 0, 60, 60, 57, 57, 57, 55, 55, 55, 52, 49, 45, 39, 52),
	(20, 0, 63, 63, 60, 60, 60, 58, 58, 58, 55, 51, 47, 41, 55),
	(21, 0, 66, 66, 63, 63, 63, 61, 61, 61, 58, 54, 50, 43, 58),
	(22, 0, 69, 69, 65, 65, 65, 63, 63, 63, 60, 56, 52, 45, 60),
	(23, 0, 72, 72, 68, 68, 68, 66, 66, 66, 63, 59, 54, 47, 63),
	(24, 0, 75, 75, 71, 71, 71, 69, 69, 69, 66, 61, 56, 49, 66),
	(25, 0, 78, 78, 74, 74, 74, 72, 72, 72, 68, 64, 59, 51, 68),
	(26, 0, 81, 81, 77, 77, 77, 75, 75, 75, 71, 66, 61, 53, 71),
	(27, 0, 84, 84, 80, 80, 80, 77, 77, 77, 74, 69, 63, 55, 74),
	(28, 0, 87, 87, 83, 83, 83, 80, 80, 80, 76, 71, 66, 57, 76),
	(29, 0, 90, 90, 86, 86, 86, 83, 83, 83, 79, 74, 68, 59, 79),
	(30, 0, 93, 93, 89, 89, 89, 86, 86, 86, 82, 76, 70, 61, 82),
	(31, 0, 96, 96, 92, 92, 92, 89, 89, 89, 85, 79, 73, 63, 85),
	(32, 0, 99, 99, 94, 94, 94, 91, 91, 91, 87, 81, 75, 65, 87),
	(33, 0, 102, 102, 97, 97, 97, 94, 94, 94, 90, 84, 77, 67, 90),
	(34, 0, 105, 105, 100, 100, 100, 97, 97, 97, 93, 86, 79, 69, 93),
	(35, 0, 108, 108, 103, 103, 103, 100, 100, 100, 95, 89, 82, 71, 95),
	(36, 0, 111, 111, 106, 106, 106, 103, 103, 103, 98, 91, 84, 73, 98),
	(37, 0, 114, 114, 109, 109, 109, 105, 105, 105, 101, 94, 86, 75, 101),
	(38, 0, 117, 117, 112, 112, 112, 108, 108, 108, 103, 96, 89, 77, 103),
	(39, 0, 120, 120, 115, 115, 115, 111, 111, 111, 106, 99, 91, 79, 106),
	(40, 0, 123, 123, 118, 118, 118, 114, 114, 114, 109, 101, 93, 81, 109),
	(41, 0, 126, 126, 121, 121, 121, 117, 117, 117, 112, 104, 96, 83, 112),
	(42, 0, 129, 129, 123, 123, 123, 119, 119, 119, 114, 106, 98, 85, 114),
	(43, 0, 132, 132, 126, 126, 126, 122, 122, 122, 117, 109, 100, 87, 117),
	(44, 0, 135, 135, 129, 129, 129, 125, 125, 125, 120, 111, 102, 89, 120),
	(45, 0, 138, 138, 132, 132, 132, 128, 128, 128, 122, 114, 105, 91, 122),
	(46, 0, 141, 141, 135, 135, 135, 131, 131, 131, 125, 116, 107, 93, 125),
	(47, 0, 144, 144, 138, 138, 138, 133, 133, 133, 128, 119, 109, 95, 128),
	(48, 0, 147, 147, 141, 141, 141, 136, 136, 136, 130, 121, 112, 97, 130),
	(49, 0, 150, 150, 144, 144, 144, 139, 139, 139, 133, 124, 114, 99, 133),
	(50, 0, 153, 153, 147, 147, 147, 142, 142, 142, 136, 126, 116, 101, 136),
	(51, 0, 158, 158, 151, 151, 151, 146, 146, 146, 140, 130, 120, 104, 140),
	(52, 0, 163, 163, 156, 156, 156, 151, 151, 151, 145, 135, 124, 107, 145),
	(53, 0, 168, 168, 161, 161, 161, 156, 156, 156, 150, 139, 128, 110, 150),
	(54, 0, 173, 173, 166, 166, 166, 161, 161, 161, 154, 144, 133, 113, 154),
	(55, 0, 178, 178, 171, 171, 171, 166, 166, 166, 159, 148, 137, 116, 159),
	(56, 0, 183, 183, 176, 176, 176, 170, 170, 170, 164, 153, 141, 119, 164),
	(57, 0, 188, 188, 181, 181, 181, 175, 175, 175, 168, 157, 146, 122, 168),
	(58, 0, 193, 193, 186, 186, 186, 180, 180, 180, 173, 162, 150, 125, 173),
	(59, 0, 198, 198, 191, 191, 191, 185, 185, 185, 178, 166, 154, 128, 178),
	(60, 0, 203, 203, 196, 196, 196, 190, 190, 190, 183, 171, 159, 131, 183),
	(61, 0, 207, 207, 199, 199, 198, 192, 192, 192, 184, 172, 161, 134, 184),
	(62, 0, 212, 211, 203, 202, 201, 195, 194, 194, 186, 174, 163, 137, 186),
	(63, 0, 217, 215, 207, 205, 204, 197, 196, 196, 188, 176, 165, 140, 188),
	(64, 0, 222, 219, 210, 208, 206, 200, 199, 198, 190, 178, 167, 143, 190),
	(65, 0, 227, 223, 214, 212, 209, 202, 201, 200, 192, 180, 169, 146, 192),
	(66, 0, 232, 227, 218, 215, 212, 205, 203, 202, 194, 182, 171, 149, 194),
	(67, 0, 236, 231, 221, 218, 214, 207, 205, 204, 195, 184, 173, 152, 195),
	(68, 0, 241, 235, 225, 221, 217, 210, 208, 206, 197, 186, 175, 155, 197),
	(69, 0, 246, 239, 229, 225, 220, 212, 210, 208, 199, 188, 177, 158, 199),
	(70, 0, 251, 244, 233, 228, 223, 215, 212, 210, 201, 190, 179, 161, 201),
	(71, 0, 256, 249, 237, 232, 226, 218, 214, 212, 203, 192, 181, 163, 202),
	(72, 0, 261, 254, 241, 236, 229, 221, 217, 214, 205, 194, 183, 165, 204),
	(73, 0, 266, 259, 246, 240, 232, 224, 219, 216, 207, 196, 185, 167, 206),
	(74, 0, 271, 264, 251, 245, 236, 227, 222, 218, 208, 198, 187, 169, 208),
	(75, 0, 276, 269, 256, 250, 240, 230, 225, 220, 210, 200, 189, 171, 210),
	(76, 0, 281, 274, 261, 255, 245, 235, 230, 225, 214, 203, 191, 173, 214),
	(77, 0, 286, 279, 266, 260, 250, 240, 235, 230, 218, 206, 193, 175, 218),
	(78, 0, 291, 284, 271, 265, 255, 245, 240, 235, 222, 209, 195, 177, 222),
	(79, 0, 296, 289, 276, 270, 260, 250, 245, 240, 226, 212, 197, 179, 226),
	(80, 0, 301, 294, 281, 275, 265, 255, 250, 245, 230, 215, 199, 181, 230),
	(81, 0, 307, 300, 287, 281, 271, 261, 256, 251, 235, 219, 202, 183, 235),
	(82, 0, 313, 306, 293, 287, 277, 267, 262, 257, 240, 223, 205, 185, 240),
	(83, 0, 319, 312, 299, 293, 283, 273, 268, 263, 245, 227, 208, 187, 245),
	(84, 0, 325, 318, 305, 299, 289, 279, 274, 269, 250, 231, 211, 189, 250),
	(85, 0, 331, 324, 311, 305, 295, 285, 280, 275, 255, 235, 214, 191, 255),
	(86, 0, 337, 330, 317, 311, 301, 291, 286, 281, 260, 239, 217, 193, 260),
	(87, 0, 343, 336, 323, 317, 307, 297, 292, 287, 265, 243, 220, 195, 265),
	(88, 0, 349, 342, 329, 323, 313, 303, 298, 293, 270, 247, 223, 197, 270),
	(89, 0, 355, 348, 335, 329, 319, 309, 304, 299, 275, 251, 226, 199, 275),
	(90, 0, 361, 354, 341, 335, 325, 315, 310, 305, 280, 255, 229, 201, 280),
	(91, 0, 368, 361, 348, 342, 332, 322, 317, 312, 286, 260, 233, 204, 286),
	(92, 0, 375, 368, 355, 349, 339, 329, 324, 319, 292, 265, 237, 207, 292),
	(93, 0, 382, 375, 362, 356, 346, 336, 331, 326, 298, 270, 241, 210, 298),
	(94, 0, 389, 382, 369, 363, 353, 343, 338, 333, 304, 275, 245, 213, 304),
	(95, 0, 396, 389, 376, 370, 360, 350, 345, 340, 310, 280, 249, 216, 310),
	(96, 0, 403, 396, 383, 377, 367, 357, 352, 347, 316, 285, 253, 219, 316),
	(97, 0, 410, 403, 390, 384, 374, 364, 359, 354, 322, 290, 257, 222, 322),
	(98, 0, 417, 410, 397, 391, 381, 371, 366, 361, 328, 295, 261, 225, 328),
	(99, 0, 424, 417, 404, 398, 388, 378, 373, 368, 334, 300, 265, 228, 344);
/*!40000 ALTER TABLE `skill_caps` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
