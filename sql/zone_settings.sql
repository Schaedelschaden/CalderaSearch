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

-- Dumping structure for table tpzdb.zone_settings
CREATE TABLE IF NOT EXISTS `zone_settings` (
  `zoneid` smallint(3) unsigned NOT NULL DEFAULT 0,
  `zonetype` smallint(5) unsigned NOT NULL DEFAULT 0,
  `zoneip` tinytext NOT NULL,
  `zoneport` smallint(5) unsigned NOT NULL DEFAULT 0,
  `name` tinytext NOT NULL,
  `music_day` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `music_night` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `battlesolo` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `battlemulti` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `restriction` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `tax` float(5,2) unsigned NOT NULL DEFAULT 0.00,
  `misc` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`zoneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20 PACK_KEYS=1 CHECKSUM=1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table tpzdb.zone_settings: 299 rows
/*!40000 ALTER TABLE `zone_settings` DISABLE KEYS */;
INSERT INTO `zone_settings` (`zoneid`, `zonetype`, `zoneip`, `zoneport`, `name`, `music_day`, `music_night`, `battlesolo`, `battlemulti`, `restriction`, `tax`, `misc`) VALUES
	(0, 1, '67.190.190.206', 54230, 'unknown', 0, 0, 0, 0, 0, 0.00, 544),
	(1, 2, '67.190.190.206', 54230, 'Phanauet_Channel', 229, 229, 101, 219, 0, 0.00, 2712),
	(2, 2, '67.190.190.206', 54230, 'Carpenters_Landing', 0, 0, 101, 219, 0, 0.00, 2716),
	(3, 2, '67.190.190.206', 54230, 'Manaclipper', 229, 229, 101, 219, 0, 0.00, 2712),
	(4, 2, '67.190.190.206', 54230, 'Bibiki_Bay', 0, 0, 101, 219, 0, 0.00, 2716),
	(5, 2, '67.190.190.206', 54230, 'Uleguerand_Range', 0, 0, 101, 219, 0, 0.00, 2716),
	(6, 4, '67.190.190.206', 54230, 'Bearclaw_Pinnacle', 0, 0, 220, 220, 0, 0.00, 665),
	(7, 2, '67.190.190.206', 54230, 'Attohwa_Chasm', 0, 0, 101, 219, 0, 0.00, 2716),
	(8, 4, '67.190.190.206', 54230, 'Boneyard_Gully', 0, 0, 220, 220, 0, 0.00, 665),
	(9, 3, '67.190.190.206', 54230, 'PsoXja', 225, 225, 115, 218, 0, 0.00, 2713),
	(10, 4, '67.190.190.206', 54230, 'The_Shrouded_Maw', 0, 0, 220, 220, 0, 0.00, 665),
	(11, 3, '67.190.190.206', 54230, 'Oldton_Movalpolos', 221, 221, 115, 218, 0, 0.00, 2713),
	(12, 3, '67.190.190.206', 54230, 'Newton_Movalpolos', 221, 221, 115, 218, 0, 0.00, 2713),
	(13, 4, '67.190.190.206', 54230, 'Mine_Shaft_2716', 0, 0, 220, 220, 0, 0.00, 2713),
	(14, 3, '67.190.190.206', 54230, 'Hall_of_Transference', 0, 0, 115, 218, 0, 0.00, 2712),
	(15, 2, '67.190.190.206', 54230, 'Abyssea-Konschtat', 51, 51, 52, 52, 0, 0.00, 2718),
	(16, 3, '67.190.190.206', 54230, 'Promyvion-Holla', 222, 222, 115, 218, 30, 0.00, 2713),
	(17, 4, '67.190.190.206', 54230, 'Spire_of_Holla', 0, 0, 220, 220, 0, 0.00, 2713),
	(18, 3, '67.190.190.206', 54230, 'Promyvion-Dem', 222, 222, 115, 218, 30, 0.00, 2713),
	(19, 4, '67.190.190.206', 54230, 'Spire_of_Dem', 0, 0, 220, 220, 0, 0.00, 2713),
	(20, 3, '67.190.190.206', 54230, 'Promyvion-Mea', 222, 222, 115, 218, 30, 0.00, 2713),
	(21, 4, '67.190.190.206', 54230, 'Spire_of_Mea', 0, 0, 220, 220, 0, 0.00, 2713),
	(22, 3, '67.190.190.206', 54230, 'Promyvion-Vahzl', 222, 222, 115, 218, 50, 0.00, 2713),
	(23, 4, '67.190.190.206', 54230, 'Spire_of_Vahzl', 0, 0, 220, 220, 0, 0.00, 2713),
	(24, 2, '67.190.190.206', 54230, 'Lufaise_Meadows', 230, 230, 101, 219, 0, 0.00, 2716),
	(25, 2, '67.190.190.206', 54230, 'Misareaux_Coast', 230, 230, 101, 219, 0, 0.00, 2716),
	(26, 1, '67.190.190.206', 54230, 'Tavnazian_Safehold', 245, 245, 245, 245, 0, 0.00, 616),
	(27, 3, '67.190.190.206', 54230, 'Phomiuna_Aqueducts', 0, 0, 115, 218, 40, 0.00, 2713),
	(28, 3, '67.190.190.206', 54230, 'Sacrarium', 0, 0, 115, 218, 50, 0.00, 2713),
	(29, 3, '67.190.190.206', 54230, 'Riverne-Site_B01', 0, 0, 115, 218, 50, 0.00, 2713),
	(30, 3, '67.190.190.206', 54230, 'Riverne-Site_A01', 0, 0, 115, 218, 40, 0.00, 2713),
	(31, 4, '67.190.190.206', 54230, 'Monarch_Linn', 0, 0, 220, 220, 0, 0.00, 665),
	(32, 1, '67.190.190.206', 54230, 'Sealions_Den', 245, 245, 220, 220, 0, 0.00, 665),
	(33, 2, '67.190.190.206', 54230, 'AlTaieu', 233, 233, 101, 219, 0, 0.00, 2712),
	(34, 3, '67.190.190.206', 54230, 'Grand_Palace_of_HuXzoi', 0, 0, 115, 218, 0, 0.00, 2712),
	(35, 3, '67.190.190.206', 54230, 'The_Garden_of_RuHmet', 228, 228, 115, 218, 0, 0.00, 2713),
	(36, 4, '67.190.190.206', 54230, 'Empyreal_Paradox', 0, 0, 224, 224, 0, 0.00, 665),
	(37, 5, '67.190.190.206', 54230, 'Temenos', 0, 0, 218, 219, 0, 0.00, 664),
	(38, 5, '67.190.190.206', 54230, 'Apollyon', 0, 0, 218, 219, 0, 0.00, 664),
	(39, 5, '67.190.190.206', 54230, 'Dynamis-Valkurm', 121, 121, 121, 121, 0, 0.00, 2712),
	(40, 5, '67.190.190.206', 54230, 'Dynamis-Buburimu', 121, 121, 121, 121, 0, 0.00, 2712),
	(41, 5, '67.190.190.206', 54230, 'Dynamis-Qufim', 121, 121, 121, 121, 0, 0.00, 2712),
	(42, 5, '67.190.190.206', 54230, 'Dynamis-Tavnazia', 121, 121, 121, 121, 0, 0.00, 2712),
	(43, 2, '67.190.190.206', 54230, 'Diorama_Abdhaljs-Ghelsba', 0, 0, 218, 219, 0, 0.00, 664),
	(44, 2, '67.190.190.206', 54230, 'Abdhaljs_Isle-Purgonorgo', 0, 0, 226, 226, 0, 0.00, 664),
	(45, 2, '67.190.190.206', 54230, 'Abyssea-Tahrongi', 51, 51, 52, 52, 0, 0.00, 2718),
	(46, 2, '67.190.190.206', 54230, 'Open_sea_route_to_Al_Zahbi', 147, 147, 101, 138, 0, 0.00, 2712),
	(47, 2, '67.190.190.206', 54230, 'Open_sea_route_to_Mhaura', 147, 147, 101, 138, 0, 0.00, 2712),
	(48, 1, '67.190.190.206', 54230, 'Al_Zahbi', 178, 178, 178, 178, 0, 0.00, 664),
	(49, 0, '67.190.190.206', 54230, '49', 0, 0, 0, 0, 0, 0.00, 0),
	(50, 1, '67.190.190.206', 54230, 'Aht_Urhgan_Whitegate', 178, 178, 178, 178, 0, 0.00, 1544),
	(51, 2, '67.190.190.206', 54230, 'Wajaom_Woodlands', 149, 149, 101, 138, 0, 0.00, 2716),
	(52, 2, '67.190.190.206', 54230, 'Bhaflau_Thickets', 149, 149, 101, 138, 0, 0.00, 2716),
	(53, 2, '67.190.190.206', 54230, 'Nashmau', 175, 175, 175, 175, 0, 0.00, 552),
	(54, 2, '67.190.190.206', 54230, 'Arrapago_Reef', 150, 150, 115, 139, 0, 0.00, 2713),
	(55, 6, '67.190.190.206', 54230, 'Ilrusi_Atoll', 0, 0, 144, 144, 0, 0.00, 2713),
	(56, 6, '67.190.190.206', 54230, 'Periqia', 0, 0, 144, 144, 0, 0.00, 2713),
	(57, 4, '67.190.190.206', 54230, 'Talacca_Cove', 0, 0, 143, 143, 0, 0.00, 2713),
	(58, 2, '67.190.190.206', 54230, 'Silver_Sea_route_to_Nashmau', 147, 147, 101, 138, 0, 0.00, 2712),
	(59, 2, '67.190.190.206', 54230, 'Silver_Sea_route_to_Al_Zahbi', 147, 147, 101, 138, 0, 0.00, 2712),
	(60, 6, '67.190.190.206', 54230, 'The_Ashu_Talif', 172, 172, 143, 143, 0, 0.00, 2704),
	(61, 2, '67.190.190.206', 54230, 'Mount_Zhayolm', 0, 0, 101, 138, 0, 0.00, 2718),
	(62, 3, '67.190.190.206', 54230, 'Halvung', 0, 0, 115, 139, 0, 0.00, 2713),
	(63, 6, '67.190.190.206', 54230, 'Lebros_Cavern', 0, 0, 144, 144, 0, 0.00, 2713),
	(64, 4, '67.190.190.206', 54230, 'Navukgo_Execution_Chamber', 0, 0, 143, 143, 0, 0.00, 2713),
	(65, 3, '67.190.190.206', 54230, 'Mamook', 0, 0, 115, 139, 0, 0.00, 2713),
	(66, 6, '67.190.190.206', 54230, 'Mamool_Ja_Training_Grounds', 0, 0, 144, 144, 0, 0.00, 2713),
	(67, 4, '67.190.190.206', 54230, 'Jade_Sepulcher', 0, 0, 143, 143, 0, 0.00, 2713),
	(68, 3, '67.190.190.206', 54230, 'Aydeewa_Subterrane', 174, 174, 115, 139, 0, 0.00, 2713),
	(69, 6, '67.190.190.206', 54230, 'Leujaoam_Sanctum', 0, 0, 144, 144, 0, 0.00, 2713),
	(70, 1, '67.190.190.206', 54230, 'Chocobo_Circuit', 176, 176, 176, 176, 0, 0.00, 1548),
	(71, 1, '67.190.190.206', 54230, 'The_Colosseum', 0, 0, 139, 139, 0, 0.00, 2712),
	(72, 3, '67.190.190.206', 54230, 'Alzadaal_Undersea_Ruins', 0, 0, 115, 139, 0, 0.00, 2713),
	(73, 6, '67.190.190.206', 54230, 'Zhayolm_Remnants', 148, 148, 115, 139, 0, 0.00, 2713),
	(74, 6, '67.190.190.206', 54230, 'Arrapago_Remnants', 148, 148, 115, 139, 0, 0.00, 2713),
	(75, 6, '67.190.190.206', 54230, 'Bhaflau_Remnants', 148, 148, 115, 139, 0, 0.00, 2713),
	(76, 6, '67.190.190.206', 54230, 'Silver_Sea_Remnants', 148, 148, 115, 139, 0, 0.00, 2713),
	(77, 6, '67.190.190.206', 54230, 'Nyzul_Isle', 148, 148, 144, 144, 0, 0.00, 2713),
	(78, 4, '67.190.190.206', 54230, 'Hazhalm_Testing_Grounds', 0, 0, 0, 0, 0, 0.00, 2712),
	(79, 2, '67.190.190.206', 54230, 'Caedarva_Mire', 173, 173, 101, 138, 0, 0.00, 2716),
	(80, 1, '67.190.190.206', 54230, 'Southern_San_dOria_[S]', 254, 254, 254, 254, 0, 0.00, 584),
	(81, 2, '67.190.190.206', 54230, 'East_Ronfaure_[S]', 251, 251, 101, 215, 0, 0.00, 2716),
	(82, 2, '67.190.190.206', 54230, 'Jugner_Forest_[S]', 0, 0, 101, 215, 0, 0.00, 2716),
	(83, 2, '67.190.190.206', 54230, 'Vunkerl_Inlet_[S]', 0, 0, 101, 215, 0, 0.00, 2716),
	(84, 2, '67.190.190.206', 54230, 'Batallia_Downs_[S]', 252, 252, 101, 215, 0, 0.00, 2716),
	(85, 2, '67.190.190.206', 54230, 'La_Vaule_[S]', 44, 44, 115, 216, 0, 0.00, 2713),
	(86, 6, '67.190.190.206', 54230, 'Everbloom_Hollow', 0, 0, 216, 216, 0, 0.00, 2712),
	(87, 1, '67.190.190.206', 54230, 'Bastok_Markets_[S]', 180, 180, 180, 180, 0, 0.00, 584),
	(88, 2, '67.190.190.206', 54230, 'North_Gustaberg_[S]', 253, 253, 101, 215, 0, 0.00, 2716),
	(89, 2, '67.190.190.206', 54230, 'Grauberg_[S]', 0, 0, 101, 215, 0, 0.00, 2716),
	(90, 2, '67.190.190.206', 54230, 'Pashhow_Marshlands_[S]', 0, 0, 101, 215, 0, 0.00, 2716),
	(91, 2, '67.190.190.206', 54230, 'Rolanberry_Fields_[S]', 252, 252, 101, 215, 0, 0.00, 2716),
	(92, 3, '67.190.190.206', 54230, 'Beadeaux_[S]', 44, 44, 115, 216, 0, 0.00, 2713),
	(93, 6, '67.190.190.206', 54230, 'Ruhotz_Silvermines', 0, 0, 216, 216, 0, 0.00, 2713),
	(94, 1, '67.190.190.206', 54230, 'Windurst_Waters_[S]', 182, 182, 182, 182, 0, 0.00, 584),
	(95, 2, '67.190.190.206', 54230, 'West_Sarutabaruta_[S]', 141, 141, 101, 215, 0, 0.00, 2716),
	(96, 3, '67.190.190.206', 54230, 'Fort_Karugo-Narugo_[S]', 0, 0, 101, 215, 0, 0.00, 2716),
	(97, 2, '67.190.190.206', 54230, 'Meriphataud_Mountains_[S]', 0, 0, 101, 215, 0, 0.00, 2716),
	(98, 2, '67.190.190.206', 54230, 'Sauromugue_Champaign_[S]', 252, 252, 101, 215, 0, 0.00, 2716),
	(99, 3, '67.190.190.206', 54230, 'Castle_Oztroja_[S]', 44, 44, 115, 216, 0, 0.00, 2713),
	(100, 2, '67.190.190.206', 54230, 'West_Ronfaure', 109, 109, 101, 103, 0, 0.00, 2716),
	(101, 2, '67.190.190.206', 54230, 'East_Ronfaure', 109, 109, 101, 103, 0, 0.00, 2716),
	(102, 2, '67.190.190.206', 54230, 'La_Theine_Plateau', 0, 0, 101, 103, 0, 0.00, 2716),
	(103, 2, '67.190.190.206', 54230, 'Valkurm_Dunes', 0, 0, 101, 103, 0, 0.00, 2716),
	(104, 2, '67.190.190.206', 54230, 'Jugner_Forest', 0, 0, 101, 103, 0, 0.00, 2716),
	(105, 2, '67.190.190.206', 54230, 'Batallia_Downs', 114, 114, 101, 103, 0, 0.00, 2716),
	(106, 2, '67.190.190.206', 54230, 'North_Gustaberg', 116, 116, 101, 103, 0, 0.00, 2716),
	(107, 2, '67.190.190.206', 54230, 'South_Gustaberg', 116, 116, 101, 103, 0, 0.00, 2716),
	(108, 2, '67.190.190.206', 54230, 'Konschtat_Highlands', 0, 0, 101, 103, 0, 0.00, 2716),
	(109, 2, '67.190.190.206', 54230, 'Pashhow_Marshlands', 0, 0, 101, 103, 0, 0.00, 2716),
	(110, 2, '67.190.190.206', 54230, 'Rolanberry_Fields', 118, 118, 101, 103, 0, 0.00, 2716),
	(111, 2, '67.190.190.206', 54230, 'Beaucedine_Glacier', 0, 0, 101, 103, 0, 0.00, 2716),
	(112, 2, '67.190.190.206', 54230, 'Xarcabard', 164, 164, 101, 103, 0, 0.00, 2716),
	(113, 2, '67.190.190.206', 54230, 'Cape_Teriggan', 0, 0, 101, 191, 0, 0.00, 2716),
	(114, 2, '67.190.190.206', 54230, 'Eastern_Altepa_Desert', 171, 171, 101, 191, 0, 0.00, 2716),
	(115, 2, '67.190.190.206', 54230, 'West_Sarutabaruta', 113, 113, 101, 103, 0, 0.00, 2716),
	(116, 2, '67.190.190.206', 54230, 'East_Sarutabaruta', 113, 113, 101, 103, 0, 0.00, 2716),
	(117, 2, '67.190.190.206', 54230, 'Tahrongi_Canyon', 0, 0, 101, 103, 0, 0.00, 2716),
	(118, 2, '67.190.190.206', 54230, 'Buburimu_Peninsula', 0, 0, 101, 103, 0, 0.00, 2716),
	(119, 2, '67.190.190.206', 54230, 'Meriphataud_Mountains', 0, 0, 101, 103, 0, 0.00, 2716),
	(120, 2, '67.190.190.206', 54230, 'Sauromugue_Champaign', 158, 158, 101, 103, 0, 0.00, 2716),
	(121, 2, '67.190.190.206', 54230, 'The_Sanctuary_of_ZiTah', 190, 190, 101, 191, 0, 0.00, 2716),
	(122, 2, '67.190.190.206', 54230, 'RoMaeve', 211, 211, 101, 191, 0, 0.00, 2716),
	(123, 2, '67.190.190.206', 54230, 'Yuhtunga_Jungle', 134, 134, 101, 191, 0, 0.00, 2716),
	(124, 2, '67.190.190.206', 54230, 'Yhoator_Jungle', 134, 134, 101, 191, 0, 0.00, 2716),
	(125, 2, '67.190.190.206', 54230, 'Western_Altepa_Desert', 171, 171, 101, 191, 0, 0.00, 2716),
	(126, 2, '67.190.190.206', 54230, 'Qufim_Island', 0, 0, 101, 103, 0, 0.00, 2716),
	(127, 2, '67.190.190.206', 54230, 'Behemoths_Dominion', 0, 0, 101, 103, 0, 0.00, 2716),
	(128, 2, '67.190.190.206', 54230, 'Valley_of_Sorrows', 0, 0, 101, 191, 0, 0.00, 2716),
	(129, 6, '67.190.190.206', 54230, 'Ghoyus_Reverie', 0, 0, 216, 216, 0, 0.00, 2713),
	(130, 2, '67.190.190.206', 54230, 'RuAun_Gardens', 210, 210, 101, 191, 0, 0.00, 2712),
	(131, 3, '67.190.190.206', 54230, 'Mordion_Gaol', 0, 0, 0, 0, 0, 0.00, 0),
	(132, 2, '67.190.190.206', 54230, 'Abyssea-La_Theine', 51, 51, 52, 52, 0, 0.00, 2718),
	(133, 0, '67.190.190.206', 0, '133', 0, 0, 0, 0, 0, 0.00, 0),
	(134, 5, '67.190.190.206', 54230, 'Dynamis-Beaucedine', 121, 121, 121, 121, 0, 0.00, 2712),
	(135, 5, '67.190.190.206', 54230, 'Dynamis-Xarcabard', 119, 119, 119, 119, 0, 0.00, 2712),
	(136, 2, '67.190.190.206', 54230, 'Beaucedine_Glacier_[S]', 0, 0, 101, 215, 0, 0.00, 2716),
	(137, 2, '67.190.190.206', 54230, 'Xarcabard_[S]', 42, 42, 101, 215, 0, 0.00, 2716),
	(138, 3, '67.190.190.206', 54230, 'Castle_Zvahl_Baileys_[S]', 43, 43, 101, 215, 0, 0.00, 2713),
	(139, 4, '67.190.190.206', 54230, 'Horlais_Peak', 0, 0, 125, 125, 0, 0.00, 665),
	(140, 3, '67.190.190.206', 54230, 'Ghelsba_Outpost', 0, 0, 115, 102, 0, 0.00, 2713),
	(141, 3, '67.190.190.206', 54230, 'Fort_Ghelsba', 0, 0, 115, 102, 0, 0.00, 2713),
	(142, 3, '67.190.190.206', 54230, 'Yughott_Grotto', 0, 0, 115, 102, 0, 0.00, 2712),
	(143, 3, '67.190.190.206', 54230, 'Palborough_Mines', 0, 0, 115, 102, 0, 0.00, 2713),
	(144, 4, '67.190.190.206', 54230, 'Waughroon_Shrine', 0, 0, 125, 125, 0, 0.00, 665),
	(145, 3, '67.190.190.206', 54230, 'Giddeus', 0, 0, 115, 102, 0, 0.00, 2713),
	(146, 4, '67.190.190.206', 54230, 'Balgas_Dais', 0, 0, 125, 125, 0, 0.00, 665),
	(147, 3, '67.190.190.206', 54230, 'Beadeaux', 0, 0, 115, 102, 0, 0.00, 2713),
	(148, 3, '67.190.190.206', 54230, 'Qulun_Dome', 0, 0, 115, 102, 0, 0.00, 2713),
	(149, 3, '67.190.190.206', 54230, 'Davoi', 0, 0, 115, 102, 0, 0.00, 2713),
	(150, 3, '67.190.190.206', 54230, 'Monastic_Cavern', 0, 0, 115, 102, 0, 0.00, 2713),
	(151, 3, '67.190.190.206', 54230, 'Castle_Oztroja', 0, 0, 115, 102, 0, 0.00, 2713),
	(152, 3, '67.190.190.206', 54230, 'Altar_Room', 0, 0, 115, 102, 0, 0.00, 2713),
	(153, 3, '67.190.190.206', 54230, 'The_Boyahda_Tree', 0, 0, 115, 192, 0, 0.00, 2713),
	(154, 3, '67.190.190.206', 54230, 'Dragons_Aery', 0, 0, 115, 192, 0, 0.00, 2713),
	(155, 3, '67.190.190.206', 54230, 'Castle_Zvahl_Keep_[S]', 43, 43, 101, 215, 0, 0.00, 2713),
	(156, 4, '67.190.190.206', 54230, 'Throne_Room_[S]', 0, 0, 0, 0, 0, 0.00, 2713),
	(157, 3, '67.190.190.206', 54230, 'Middle_Delkfutts_Tower', 0, 0, 115, 102, 0, 0.00, 2713),
	(158, 3, '67.190.190.206', 54230, 'Upper_Delkfutts_Tower', 0, 0, 115, 102, 0, 0.00, 2713),
	(159, 3, '67.190.190.206', 54230, 'Temple_of_Uggalepih', 0, 0, 115, 192, 0, 0.00, 2713),
	(160, 3, '67.190.190.206', 54230, 'Den_of_Rancor', 0, 0, 115, 192, 0, 0.00, 2713),
	(161, 3, '67.190.190.206', 54230, 'Castle_Zvahl_Baileys', 155, 155, 115, 102, 0, 0.00, 2713),
	(162, 3, '67.190.190.206', 54230, 'Castle_Zvahl_Keep', 155, 155, 115, 102, 0, 0.00, 2713),
	(163, 4, '67.190.190.206', 54230, 'Sacrificial_Chamber', 0, 0, 193, 193, 0, 0.00, 665),
	(164, 3, '67.190.190.206', 54230, 'Garlaige_Citadel_[S]', 0, 0, 115, 216, 0, 0.00, 2713),
	(165, 4, '67.190.190.206', 54230, 'Throne_Room', 155, 155, 119, 119, 0, 0.00, 665),
	(166, 3, '67.190.190.206', 54230, 'Ranguemont_Pass', 0, 0, 115, 102, 0, 0.00, 2713),
	(167, 3, '67.190.190.206', 54230, 'Bostaunieux_Oubliette', 0, 0, 115, 102, 0, 0.00, 2713),
	(168, 4, '67.190.190.206', 54230, 'Chamber_of_Oracles', 0, 0, 193, 193, 0, 0.00, 665),
	(169, 3, '67.190.190.206', 54230, 'Toraimarai_Canal', 0, 0, 115, 102, 0, 0.00, 2713),
	(170, 4, '67.190.190.206', 54230, 'Full_Moon_Fountain', 0, 0, 193, 193, 0, 0.00, 665),
	(171, 3, '67.190.190.206', 54230, 'Crawlers_Nest_[S]', 0, 0, 115, 216, 0, 0.00, 2713),
	(172, 3, '67.190.190.206', 54230, 'Zeruhn_Mines', 0, 0, 115, 102, 0, 0.00, 2712),
	(173, 3, '67.190.190.206', 54230, 'Korroloka_Tunnel', 0, 0, 115, 192, 0, 0.00, 2713),
	(174, 3, '67.190.190.206', 54230, 'Kuftal_Tunnel', 0, 0, 115, 192, 0, 0.00, 2713),
	(175, 3, '67.190.190.206', 54230, 'The_Eldieme_Necropolis_[S]', 0, 0, 115, 216, 0, 0.00, 2713),
	(176, 3, '67.190.190.206', 54230, 'Sea_Serpent_Grotto', 0, 0, 115, 192, 0, 0.00, 2713),
	(177, 3, '67.190.190.206', 54230, 'VeLugannon_Palace', 207, 207, 115, 192, 0, 0.00, 2713),
	(178, 3, '67.190.190.206', 54230, 'The_Shrine_of_RuAvitau', 207, 207, 115, 192, 0, 0.00, 2713),
	(179, 4, '67.190.190.206', 54230, 'Stellar_Fulcrum', 0, 0, 193, 193, 0, 0.00, 665),
	(180, 4, '67.190.190.206', 54230, 'LaLoff_Amphitheater', 0, 0, 196, 196, 0, 0.00, 665),
	(181, 4, '67.190.190.206', 54230, 'The_Celestial_Nexus', 0, 0, 198, 198, 0, 0.00, 665),
	(182, 4, '67.190.190.206', 54230, 'Walk_of_Echoes', 0, 0, 215, 215, 0, 0.00, 0),
	(183, 6, '67.190.190.206', 54230, 'Maquette_Abdhaljs-Legion_A', 0, 0, 143, 143, 0, 0.00, 2714),
	(184, 3, '67.190.190.206', 54230, 'Lower_Delkfutts_Tower', 0, 0, 115, 102, 0, 0.00, 2713),
	(185, 5, '67.190.190.206', 54230, 'Dynamis-San_dOria', 121, 121, 121, 121, 0, 0.00, 2712),
	(186, 5, '67.190.190.206', 54230, 'Dynamis-Bastok', 121, 121, 121, 121, 0, 0.00, 2712),
	(187, 5, '67.190.190.206', 54230, 'Dynamis-Windurst', 121, 121, 121, 121, 0, 0.00, 2712),
	(188, 5, '67.190.190.206', 54230, 'Dynamis-Jeuno', 121, 121, 121, 121, 0, 0.00, 2712),
	(189, 1, '67.190.190.206', 54230, 'Residential_Area', 0, 0, 0, 0, 0, 0.00, 544),
	(190, 3, '67.190.190.206', 54230, 'King_Ranperres_Tomb', 0, 0, 115, 102, 0, 0.00, 2713),
	(191, 3, '67.190.190.206', 54230, 'Dangruf_Wadi', 0, 0, 115, 102, 0, 0.00, 2713),
	(192, 3, '67.190.190.206', 54230, 'Inner_Horutoto_Ruins', 0, 0, 115, 102, 0, 0.00, 2713),
	(193, 3, '67.190.190.206', 54230, 'Ordelles_Caves', 0, 0, 115, 102, 0, 0.00, 2713),
	(194, 3, '67.190.190.206', 54230, 'Outer_Horutoto_Ruins', 0, 0, 115, 102, 0, 0.00, 2713),
	(195, 3, '67.190.190.206', 54230, 'The_Eldieme_Necropolis', 0, 0, 115, 102, 0, 0.00, 2713),
	(196, 3, '67.190.190.206', 54230, 'Gusgen_Mines', 0, 0, 115, 102, 0, 0.00, 2713),
	(197, 3, '67.190.190.206', 54230, 'Crawlers_Nest', 0, 0, 115, 102, 0, 0.00, 2713),
	(198, 3, '67.190.190.206', 54230, 'Maze_of_Shakhrami', 0, 0, 115, 102, 0, 0.00, 2713),
	(199, 1, '67.190.190.206', 54230, 'Residential_Area', 0, 0, 0, 0, 0, 0.00, 544),
	(200, 3, '67.190.190.206', 54230, 'Garlaige_Citadel', 0, 0, 115, 102, 0, 0.00, 2713),
	(201, 4, '67.190.190.206', 54230, 'Cloister_of_Gales', 0, 0, 0, 0, 0, 0.00, 665),
	(202, 4, '67.190.190.206', 54230, 'Cloister_of_Storms', 0, 0, 0, 0, 0, 0.00, 665),
	(203, 4, '67.190.190.206', 54230, 'Cloister_of_Frost', 0, 0, 0, 0, 0, 0.00, 665),
	(204, 3, '67.190.190.206', 54230, 'FeiYin', 0, 0, 115, 102, 0, 0.00, 2713),
	(205, 3, '67.190.190.206', 54230, 'Ifrits_Cauldron', 0, 0, 115, 192, 0, 0.00, 2713),
	(206, 4, '67.190.190.206', 54230, 'QuBia_Arena', 0, 0, 125, 125, 0, 0.00, 665),
	(207, 4, '67.190.190.206', 54230, 'Cloister_of_Flames', 0, 0, 0, 0, 0, 0.00, 665),
	(208, 3, '67.190.190.206', 54230, 'Quicksand_Caves', 0, 0, 115, 192, 0, 0.00, 2713),
	(209, 4, '67.190.190.206', 54230, 'Cloister_of_Tremors', 0, 0, 0, 0, 0, 0.00, 665),
	(210, 0, '67.190.190.206', 54230, 'GM_Home', 0, 0, 0, 0, 0, 0.00, 0),
	(211, 4, '67.190.190.206', 54230, 'Cloister_of_Tides', 0, 0, 0, 0, 0, 0.00, 665),
	(212, 3, '67.190.190.206', 54230, 'Gustav_Tunnel', 0, 0, 115, 192, 0, 0.00, 2713),
	(213, 3, '67.190.190.206', 54230, 'Labyrinth_of_Onzozo', 0, 0, 115, 192, 0, 0.00, 2713),
	(214, 1, '67.190.190.206', 54230, 'Residential_Area', 0, 0, 0, 0, 0, 0.00, 544),
	(215, 2, '67.190.190.206', 54230, 'Abyssea-Attohwa', 51, 51, 52, 52, 0, 0.00, 2718),
	(216, 2, '67.190.190.206', 54230, 'Abyssea-Misareaux', 51, 51, 52, 52, 0, 0.00, 2718),
	(217, 2, '67.190.190.206', 54230, 'Abyssea-Vunkerl', 51, 51, 52, 52, 0, 0.00, 2718),
	(218, 2, '67.190.190.206', 54230, 'Abyssea-Altepa', 51, 51, 52, 52, 0, 0.00, 2718),
	(219, 1, '67.190.190.206', 54230, 'Residential_Area', 0, 0, 0, 0, 0, 0.00, 544),
	(220, 0, '67.190.190.206', 54230, 'Ship_bound_for_Selbina', 106, 106, 101, 103, 0, 0.00, 2712),
	(221, 0, '67.190.190.206', 54230, 'Ship_bound_for_Mhaura', 106, 106, 101, 103, 0, 0.00, 2712),
	(222, 4, '67.190.190.206', 54230, 'Provenance', 56, 56, 56, 56, 0, 0.00, 0),
	(223, 2, '67.190.190.206', 54230, 'San_dOria-Jeuno_Airship', 128, 128, 128, 128, 0, 0.00, 520),
	(224, 2, '67.190.190.206', 54230, 'Bastok-Jeuno_Airship', 128, 128, 128, 128, 0, 0.00, 520),
	(225, 2, '67.190.190.206', 54230, 'Windurst-Jeuno_Airship', 128, 128, 128, 128, 0, 0.00, 520),
	(226, 2, '67.190.190.206', 54230, 'Kazham-Jeuno_Airship', 128, 128, 128, 128, 0, 0.00, 520),
	(227, 2, '67.190.190.206', 54230, 'Ship_bound_for_Selbina_Pirates', 106, 106, 101, 103, 0, 0.00, 2712),
	(228, 2, '67.190.190.206', 54230, 'Ship_bound_for_Mhaura_Pirates', 106, 106, 101, 103, 0, 0.00, 2712),
	(229, 0, '67.190.190.206', 0, '229', 0, 0, 0, 0, 0, 0.00, 0),
	(230, 1, '67.190.190.206', 54230, 'Southern_San_dOria', 107, 107, 107, 107, 0, 0.00, 584),
	(231, 1, '67.190.190.206', 54230, 'Northern_San_dOria', 107, 107, 107, 107, 0, 0.00, 584),
	(232, 1, '67.190.190.206', 54230, 'Port_San_dOria', 107, 107, 107, 107, 0, 0.00, 584),
	(233, 1, '67.190.190.206', 54230, 'Chateau_dOraguille', 156, 156, 156, 156, 0, 0.00, 520),
	(234, 1, '67.190.190.206', 54230, 'Bastok_Mines', 152, 152, 152, 152, 0, 0.00, 584),
	(235, 1, '67.190.190.206', 54230, 'Bastok_Markets', 152, 152, 152, 152, 0, 0.00, 584),
	(236, 1, '67.190.190.206', 54230, 'Port_Bastok', 152, 152, 152, 152, 0, 0.00, 584),
	(237, 1, '67.190.190.206', 54230, 'Metalworks', 154, 154, 154, 154, 0, 0.00, 520),
	(238, 1, '67.190.190.206', 54230, 'Windurst_Waters', 151, 151, 151, 151, 0, 0.00, 584),
	(239, 1, '67.190.190.206', 54230, 'Windurst_Walls', 151, 151, 151, 151, 0, 0.00, 584),
	(240, 1, '67.190.190.206', 54230, 'Port_Windurst', 151, 151, 151, 151, 0, 0.00, 584),
	(241, 1, '67.190.190.206', 54230, 'Windurst_Woods', 151, 151, 151, 151, 0, 0.00, 584),
	(242, 1, '67.190.190.206', 54230, 'Heavens_Tower', 162, 162, 151, 151, 0, 0.00, 520),
	(243, 1, '67.190.190.206', 54230, 'RuLude_Gardens', 117, 117, 117, 117, 0, 0.00, 1608),
	(244, 1, '67.190.190.206', 54230, 'Upper_Jeuno', 110, 110, 110, 110, 0, 0.00, 1608),
	(245, 1, '67.190.190.206', 54230, 'Lower_Jeuno', 110, 110, 110, 110, 0, 0.00, 1608),
	(246, 1, '67.190.190.206', 54230, 'Port_Jeuno', 110, 110, 110, 110, 0, 0.00, 1608),
	(247, 1, '67.190.190.206', 54230, 'Rabao', 208, 208, 208, 208, 0, 0.00, 616),
	(248, 1, '67.190.190.206', 54230, 'Selbina', 112, 112, 112, 112, 0, 0.00, 552),
	(249, 1, '67.190.190.206', 54230, 'Mhaura', 105, 105, 105, 105, 0, 0.00, 552),
	(250, 1, '67.190.190.206', 54230, 'Kazham', 135, 135, 135, 135, 0, 0.00, 552),
	(251, 1, '67.190.190.206', 54230, 'Hall_of_the_Gods', 213, 213, 213, 213, 0, 0.00, 520),
	(252, 1, '67.190.190.206', 54230, 'Norg', 209, 209, 209, 209, 0, 0.00, 616),
	(253, 2, '67.190.190.206', 54230, 'Abyssea-Uleguerand', 51, 51, 52, 52, 0, 0.00, 2718),
	(254, 2, '67.190.190.206', 54230, 'Abyssea-Grauberg', 51, 51, 52, 52, 0, 0.00, 2718),
	(255, 2, '67.190.190.206', 54230, 'Abyssea-Empyreal_Paradox', 51, 51, 52, 52, 0, 0.00, 2718),
	(256, 1, '67.190.190.206', 54230, 'Western_Adoulin', 59, 59, 59, 59, 0, 0.00, 1608),
	(257, 1, '67.190.190.206', 54230, 'Eastern_Adoulin', 63, 63, 63, 63, 0, 0.00, 1608),
	(258, 3, '67.190.190.206', 54230, 'Rala_Waterways', 61, 61, 57, 57, 0, 0.00, 2714),
	(259, 6, '67.190.190.206', 54230, 'Rala_Waterways_U', 61, 61, 57, 57, 0, 0.00, 2714),
	(260, 2, '67.190.190.206', 54230, 'Yahse_Hunting_Grounds', 60, 60, 57, 57, 0, 0.00, 2716),
	(261, 2, '67.190.190.206', 54230, 'Ceizak_Battlegrounds', 60, 60, 57, 57, 0, 0.00, 2716),
	(262, 2, '67.190.190.206', 54230, 'Foret_de_Hennetiel', 60, 60, 57, 57, 0, 0.00, 2716),
	(263, 2, '67.190.190.206', 54230, 'Yorcia_Weald', 61, 61, 57, 57, 0, 0.00, 2716),
	(264, 6, '67.190.190.206', 54230, 'Yorcia_Weald_U', 62, 62, 62, 62, 0, 0.00, 2714),
	(265, 2, '67.190.190.206', 54230, 'Morimar_Basalt_Fields', 60, 60, 57, 57, 0, 0.00, 2716),
	(266, 2, '67.190.190.206', 54230, 'Marjami_Ravine', 60, 60, 57, 57, 0, 0.00, 2716),
	(267, 2, '67.190.190.206', 54230, 'Kamihr_Drifts', 72, 72, 57, 57, 0, 0.00, 2716),
	(268, 3, '67.190.190.206', 54230, 'Sih_Gates', 0, 0, 57, 57, 0, 0.00, 2718),
	(269, 3, '67.190.190.206', 54230, 'Moh_Gates', 0, 0, 57, 57, 0, 0.00, 2718),
	(270, 3, '67.190.190.206', 54230, 'Cirdas_Caverns', 0, 0, 57, 57, 0, 0.00, 2718),
	(271, 6, '67.190.190.206', 54230, 'Cirdas_Caverns_U', 62, 62, 62, 62, 0, 0.00, 2714),
	(272, 3, '67.190.190.206', 54230, 'Dho_Gates', 0, 0, 57, 57, 0, 0.00, 2718),
	(273, 3, '67.190.190.206', 54230, 'Woh_Gates', 0, 0, 57, 57, 0, 0.00, 2718),
	(274, 3, '67.190.190.206', 54230, 'Outer_RaKaznar', 73, 73, 57, 57, 0, 0.00, 2714),
	(275, 0, '67.190.190.206', 54230, 'Outer_RaKaznar_U', 62, 62, 62, 62, 0, 0.00, 2714),
	(276, 0, '67.190.190.206', 54230, 'RaKaznar_Inner_Court', 73, 73, 57, 57, 0, 0.00, 2714),
	(277, 0, '67.190.190.206', 54230, 'RaKaznar_Turris', 0, 0, 0, 0, 0, 0.00, 665),
	(278, 0, '67.190.190.206', 0, '278', 0, 0, 0, 0, 0, 0.00, 0),
	(279, 0, '67.190.190.206', 54230, 'Walk_of_Echoes_[P2]', 0, 0, 0, 0, 0, 0.00, 2712),
	(280, 1, '67.190.190.206', 54230, 'Mog_Garden', 67, 67, 67, 67, 0, 0.00, 544),
	(281, 0, '67.190.190.206', 54230, 'Leafallia', 0, 0, 0, 0, 0, 0.00, 0),
	(282, 0, '67.190.190.206', 54230, 'Mount_Kamihr', 0, 0, 0, 0, 0, 0.00, 0),
	(283, 0, '67.190.190.206', 54230, 'Silver_Knife', 0, 0, 0, 0, 0, 0.00, 0),
	(284, 1, '67.190.190.206', 54230, 'Celennia_Memorial_Library', 63, 63, 0, 0, 0, 0.00, 544),
	(285, 1, '67.190.190.206', 54230, 'Feretory', 0, 0, 0, 0, 0, 0.00, 544),
	(286, 0, '67.190.190.206', 0, '286', 0, 0, 0, 0, 0, 0.00, 0),
	(287, 6, '67.190.190.206', 54230, 'Maquette_Abdhaljs-Legion_B', 0, 0, 143, 143, 0, 0.00, 2714),
	(288, 2, '67.190.190.206', 54230, 'Escha_ZiTah', 80, 80, 80, 80, 0, 0.00, 664),
	(289, 2, '67.190.190.206', 54230, 'Escha_RuAun', 80, 80, 80, 80, 0, 0.00, 664),
	(290, 0, '67.190.190.206', 54230, 'Desuetia_Empyreal_Paradox', 0, 0, 0, 0, 0, 0.00, 2704),
	(291, 0, '67.190.190.206', 54230, 'Reisenjima', 79, 79, 79, 79, 0, 0.00, 2704),
	(292, 0, '67.190.190.206', 54230, 'Reisenjima_Henge', 0, 0, 0, 0, 0, 0.00, 2712),
	(293, 0, '67.190.190.206', 54230, 'Reisenjima_Sanctorium', 0, 0, 0, 0, 0, 0.00, 2704),
	(294, 5, '67.190.190.206', 54230, 'Dynamis-San_dOria_[D]', 88, 88, 88, 88, 0, 0.00, 2960),
	(295, 5, '67.190.190.206', 54230, 'Dynamis-Bastok_[D]', 88, 88, 88, 88, 0, 0.00, 2960),
	(296, 5, '67.190.190.206', 54230, 'Dynamis-Windurst_[D]', 88, 88, 88, 88, 0, 0.00, 2960),
	(297, 5, '67.190.190.206', 54230, 'Dynamis-Jeuno_[D]', 88, 88, 88, 88, 0, 0.00, 2960),
	(298, 0, '67.190.190.206', 54230, 'Walk_of_Echoes_[P1]', 186, 186, 186, 186, 0, 0.00, 2712);
/*!40000 ALTER TABLE `zone_settings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
