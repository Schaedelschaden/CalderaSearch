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

-- Dumping structure for table tpzdb.char_merit
CREATE TABLE IF NOT EXISTS `char_merit` (
  `charid` int(10) unsigned NOT NULL,
  `meritid` smallint(5) unsigned NOT NULL,
  `upgrades` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `idx_char_merit_meritid_charid` (`meritid`,`charid`),
  KEY `char_merits_charid_index` (`charid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tpzdb.char_merit: ~76 rows (approximately)
/*!40000 ALTER TABLE `char_merit` DISABLE KEYS */;
INSERT INTO `char_merit` (`charid`, `meritid`, `upgrades`) VALUES
	(5, 64, 1),
	(10, 198, 8),
	(5, 278, 8),
	(5, 324, 5),
	(5, 838, 5),
	(5, 896, 5),
	(5, 1032, 5),
	(5, 1344, 5),
	(5, 1346, 5),
	(5, 1606, 1),
	(5, 1668, 8),
	(5, 1670, 1),
	(5, 1686, 1),
	(5, 1728, 3),
	(5, 1730, 1),
	(5, 1736, 1),
	(5, 1792, 2),
	(5, 1794, 2),
	(5, 1796, 2),
	(5, 1798, 2),
	(5, 1800, 2),
	(5, 2048, 1),
	(5, 2050, 1),
	(1, 2112, 3),
	(5, 2112, 4),
	(1, 2114, 4),
	(5, 2114, 5),
	(5, 2116, 1),
	(5, 2176, 5),
	(5, 2178, 5),
	(5, 2368, 1),
	(5, 2370, 1),
	(5, 2432, 1),
	(5, 2434, 1),
	(5, 2496, 5),
	(5, 2498, 5),
	(5, 2560, 1),
	(5, 2562, 1),
	(5, 2564, 5),
	(5, 2624, 1),
	(5, 2626, 1),
	(5, 2688, 1),
	(5, 2690, 1),
	(5, 2692, 5),
	(5, 2752, 1),
	(5, 2754, 1),
	(5, 2816, 1),
	(5, 2880, 5),
	(5, 2882, 1),
	(5, 2884, 1),
	(5, 2944, 5),
	(5, 2946, 1),
	(5, 2948, 1),
	(5, 2950, 1),
	(5, 2952, 1),
	(5, 2954, 1),
	(5, 3008, 1),
	(5, 3010, 1),
	(5, 3014, 5),
	(5, 3072, 5),
	(5, 3074, 2),
	(5, 3076, 1),
	(5, 3078, 1),
	(5, 3136, 1),
	(5, 3138, 1),
	(5, 3200, 1),
	(5, 3202, 1),
	(10, 3202, 2),
	(5, 3204, 1),
	(10, 3204, 2),
	(5, 3264, 1),
	(5, 3266, 1),
	(5, 3268, 1),
	(5, 3270, 1),
	(5, 3272, 1),
	(5, 3274, 1);
/*!40000 ALTER TABLE `char_merit` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
