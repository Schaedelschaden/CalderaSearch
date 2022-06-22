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

-- Dumping structure for table tpzdb.bcnm_info
CREATE TABLE IF NOT EXISTS `bcnm_info` (
  `bcnmId` smallint(5) unsigned NOT NULL,
  `zoneId` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `name` varchar(30) NOT NULL,
  `fastestName` varchar(15) DEFAULT 'Not Set!',
  `fastestPartySize` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `fastestTime` int(10) unsigned DEFAULT 1,
  `timeLimit` smallint(5) unsigned NOT NULL DEFAULT 1800,
  `levelCap` smallint(5) unsigned NOT NULL DEFAULT 75,
  `partySize` smallint(5) unsigned NOT NULL DEFAULT 6,
  `lootDropId` smallint(5) unsigned NOT NULL DEFAULT 0,
  `rules` smallint(5) unsigned NOT NULL DEFAULT 0,
  `isMission` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`bcnmId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=56;

-- Dumping data for table tpzdb.bcnm_info: 246 rows
/*!40000 ALTER TABLE `bcnm_info` DISABLE KEYS */;
INSERT INTO `bcnm_info` (`bcnmId`, `zoneId`, `name`, `fastestName`, `fastestPartySize`, `fastestTime`, `timeLimit`, `levelCap`, `partySize`, `lootDropId`, `rules`, `isMission`) VALUES
	(0, 139, 'rank_2_mission', 'Zahabi', 1, 152, 1800, 0, 6, 0, 5, 1),
	(1, 139, 'tails_of_woe', 'nobody', 0, 1800, 1800, 0, 6, 1, 15, 0),
	(2, 139, 'dismemberment_brigade', 'nobody', 0, 1800, 1800, 0, 6, 2, 15, 0),
	(3, 139, 'the_secret_weapon', 'Jasnah', 1, 66, 1800, 0, 6, 0, 5, 1),
	(4, 139, 'hostile_herbivores', 'nobody', 0, 1800, 1800, 0, 6, 4, 15, 0),
	(5, 139, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(6, 139, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(7, 139, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(8, 139, 'carapace_combatants', 'nobody', 0, 900, 900, 0, 3, 8, 15, 0),
	(9, 139, 'shooting_fish', 'nobody', 0, 900, 900, 0, 3, 9, 15, 0),
	(10, 139, 'dropping_like_flies', 'nobody', 0, 1800, 1800, 0, 6, 10, 15, 0),
	(11, 139, 'horns_of_war', 'Khalum', 1, 50, 1800, 0, 18, 11, 15, 0),
	(12, 139, 'under_observation', 'nobody', 0, 900, 900, 0, 3, 12, 15, 0),
	(13, 139, 'eye_of_the_tiger', 'Tierkaintwo', 1, 43, 1800, 0, 6, 13, 15, 0),
	(14, 139, 'shots_in_the_dark', 'nobody', 0, 900, 900, 0, 3, 14, 15, 0),
	(15, 139, 'double_dragonian', 'Vengeanceace', 4, 113, 1800, 0, 6, 15, 15, 0),
	(16, 139, 'todays_horoscope', 'nobody', 0, 1800, 1800, 0, 6, 16, 15, 0),
	(17, 139, 'contaminated_colosseum', 'nobody', 0, 1800, 1800, 0, 6, 17, 15, 0),
	(18, 139, 'kindergarten_cap', 'nobody', 0, 900, 900, 0, 3, 18, 15, 0),
	(19, 139, 'last_orc-shunned_hero', 'nobody', 0, 1800, 1800, 0, 6, 19, 15, 0),
	(20, 139, 'beyond_infinity', 'nobody', 0, 600, 600, 0, 6, 0, 5, 0),
	(32, 140, 'save_the_children', 'Jasnah', 1, 56, 600, 0, 6, 0, 5, 0),
	(33, 140, 'holy_crest', 'nobody', 0, 600, 600, 0, 6, 0, 7, 0),
	(34, 140, 'wings_of_fury', 'nobody', 0, 900, 900, 0, 3, 34, 15, 0),
	(35, 140, 'petrifying_pair', 'nobody', 0, 900, 900, 0, 3, 35, 15, 0),
	(36, 140, 'toadal_recall', 'nobody', 0, 1800, 1800, 0, 6, 36, 15, 0),
	(37, 140, 'mirror_mirror', 'nobody', 0, 900, 900, 0, 3, 0, 7, 0),
	(64, 144, 'rank_2_mission', 'Althanos', 2, 95, 1800, 0, 6, 0, 5, 1),
	(65, 144, 'worms_turn', 'nobody', 0, 1800, 1800, 0, 6, 65, 15, 0),
	(66, 144, 'grimshell_shocktroopers', 'nobody', 0, 1800, 1800, 0, 6, 66, 15, 0),
	(67, 144, 'on_my_way', 'Quinn', 1, 115, 1800, 0, 6, 0, 5, 1),
	(68, 144, 'thief_in_norg', 'nobody', 0, 1800, 1800, 0, 6, 0, 7, 0),
	(69, 144, '3_2_1', 'nobody', 0, 1800, 1800, 0, 6, 69, 15, 0),
	(70, 144, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(71, 144, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(72, 144, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(73, 144, 'birds_of_a_feather', 'nobody', 0, 900, 900, 0, 3, 73, 15, 0),
	(74, 144, 'crustacean_conundrum', 'nobody', 0, 900, 900, 0, 3, 74, 15, 0),
	(75, 144, 'grove_guardians', 'Khalum', 1, 45, 1800, 0, 6, 75, 15, 0),
	(76, 144, 'hills_are_alive', 'Tierkaintwo', 1, 33, 1800, 0, 18, 76, 15, 0),
	(77, 144, 'royal_jelly', 'nobody', 0, 900, 900, 0, 3, 77, 15, 0),
	(78, 144, 'final_bout', 'nobody', 0, 180, 180, 0, 3, 78, 15, 0),
	(79, 144, 'up_in_arms', 'Khalum', 1, 37, 1800, 0, 6, 79, 15, 0),
	(80, 144, 'copycat', 'nobody', 0, 1800, 1800, 0, 6, 80, 15, 0),
	(81, 144, 'operation_desert_swarm', 'Altana', 3, 97, 1800, 0, 6, 81, 15, 0),
	(82, 144, 'prehistoric_pigeons', 'Tierkaintwo', 1, 61, 1800, 0, 6, 82, 15, 0),
	(83, 144, 'palborough_project', 'nobody', 0, 900, 900, 0, 3, 83, 15, 0),
	(84, 144, 'shell_shocked', 'nobody', 0, 1800, 1800, 0, 6, 84, 15, 0),
	(85, 144, 'beyond_infinity', 'nobody', 0, 600, 600, 0, 6, 0, 5, 0),
	(96, 146, 'rank_2_mission', 'Jasnah', 1, 110, 1800, 0, 6, 0, 5, 1),
	(97, 146, 'steamed_sprouts', 'nobody', 0, 1800, 1800, 0, 6, 97, 15, 0),
	(98, 146, 'divine_punishers', 'nobody', 0, 1800, 1800, 0, 6, 98, 15, 0),
	(99, 146, 'saintly_invitation', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 1),
	(100, 146, 'treasure_and_tribulations', 'nobody', 0, 1800, 1800, 0, 6, 100, 15, 0),
	(101, 146, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(102, 146, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(103, 146, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(104, 146, 'creeping_doom', 'nobody', 0, 900, 900, 0, 3, 104, 15, 0),
	(105, 146, 'charming_trio', 'Fujin', 1, 46, 900, 0, 3, 105, 15, 0),
	(106, 146, 'harem_scarem', 'nobody', 0, 1800, 1800, 0, 6, 106, 15, 0),
	(107, 146, 'early_bird_catches_the_wyrm', 'Khalum', 1, 202, 1800, 0, 18, 107, 15, 0),
	(108, 146, 'royal_succession', 'Khalum', 1, 37, 1800, 0, 6, 108, 15, 0),
	(109, 146, 'rapid_raptors', 'nobody', 0, 900, 900, 0, 3, 109, 15, 0),
	(110, 146, 'wild_wild_whiskers', 'Shiroi', 2, 46, 1800, 0, 6, 110, 15, 0),
	(111, 146, 'seasons_greetings', 'nobody', 0, 1800, 1800, 0, 6, 111, 15, 0),
	(112, 146, 'royale_ramble', 'nobody', 0, 1800, 1800, 0, 6, 112, 15, 0),
	(113, 146, 'moa_constrictors', 'nobody', 0, 1800, 1800, 0, 6, 113, 15, 0),
	(114, 146, 'v_formation', 'nobody', 0, 900, 900, 0, 3, 114, 15, 0),
	(115, 146, 'avian_apostates', 'nobody', 0, 1800, 1800, 0, 6, 115, 15, 0),
	(116, 146, 'beyond_infinity', 'nobody', 0, 600, 600, 0, 6, 0, 5, 0),
	(128, 163, 'temple_of_uggalepih', 'Lowexpectations', 1, 216, 1800, 0, 6, 0, 5, 1),
	(129, 163, 'jungle_boogymen', 'nobody', 0, 1800, 1800, 0, 6, 129, 15, 0),
	(130, 163, 'amphibian_assault', 'nobody', 0, 1800, 1800, 0, 6, 130, 15, 0),
	(131, 163, 'project_shantottofication', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(132, 163, 'whom_wilt_thou_call', 'nobody', 0, 1800, 1800, 0, 6, 132, 15, 0),
	(160, 165, 'shadow_lord_battle', 'Meredie', 1, 94, 1800, 0, 6, 0, 5, 1),
	(161, 165, 'where_two_paths_converge', 'Shadow', 3, 116, 1800, 0, 6, 0, 5, 1),
	(162, 165, 'kindred_spirits', 'nobody', 0, 1800, 1800, 0, 6, 162, 15, 0),
	(163, 165, 'survival_of_the_wisest', 'nobody', 0, 600, 600, 0, 1, 0, 6, 0),
	(164, 165, 'smash_a_malevolent_menace', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(192, 168, 'through_the_quicksand_caves', 'Lowexpectations', 1, 218, 1800, 0, 6, 0, 5, 1),
	(193, 168, 'legion_xi_comitatensis', 'Tierkaintwo', 1, 69, 1800, 0, 6, 193, 15, 0),
	(194, 168, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(195, 168, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(196, 168, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(197, 168, 'cactuar_suave', 'nobody', 0, 1800, 1800, 0, 6, 197, 15, 0),
	(198, 168, 'eye_of_the_storm', 'Altana', 3, 135, 1800, 0, 6, 198, 15, 0),
	(199, 168, 'scarlet_king', 'nobody', 0, 1800, 1800, 0, 6, 199, 15, 0),
	(200, 168, 'cat_burglar_bares_fangs', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(201, 168, 'dragon_scales', 'nobody', 0, 600, 600, 0, 1, 0, 6, 0),
	(224, 170, 'moonlit_path', 'Tierkaintwo', 1, 211, 1800, 0, 6, 0, 5, 0),
	(225, 170, 'moon_reading', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 1),
	(226, 170, 'waking_the_beast_fullmoon', 'Khalum', 1, 149, 1800, 0, 18, 0, 5, 0),
	(227, 170, 'battaru_royale', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(256, 179, 'return_to_delkfutts_tower', 'Tierkaintwo', 1, 104, 1800, 0, 6, 0, 5, 0),
	(257, 179, 'indomitable_triumvirate_vs3', 'nobody', 0, 900, 900, 0, 6, 0, 4, 0),
	(258, 179, 'dauntless_duo_vs2', 'nobody', 0, 900, 900, 0, 6, 0, 4, 0),
	(259, 179, 'solitary_demolisher_vs1', 'nobody', 0, 900, 900, 0, 6, 0, 4, 0),
	(260, 179, 'heroines_combat', 'nobody', 0, 900, 900, 0, 6, 0, 4, 0),
	(261, 179, 'mercenary_camp', 'nobody', 0, 900, 900, 0, 6, 0, 4, 0),
	(262, 179, 'ode_of_life_bestowing', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(288, 180, 'ark_angels_1', 'Ericnuke', 6, 284, 1800, 0, 6, 0, 5, 0),
	(289, 180, 'ark_angels_2', 'Shiroi', 1, 169, 1800, 0, 6, 0, 5, 0),
	(290, 180, 'ark_angels_3', 'Pheliont', 6, 374, 1800, 0, 6, 0, 5, 0),
	(291, 180, 'ark_angels_4', 'Khalum', 1, 61, 1800, 0, 6, 0, 5, 0),
	(292, 180, 'ark_angels_5', 'Khalum', 1, 151, 1800, 0, 6, 0, 5, 0),
	(293, 180, 'divine_might', 'Khalum', 1, 109, 1800, 0, 18, 0, 5, 1),
	(320, 181, 'celestial_nexus', 'Gigabite', 6, 477, 1800, 0, 6, 0, 5, 1),
	(352, 156, 'fiat_lux', 'nobody', 0, 1800, 1800, 0, 6, 352, 15, 0),
	(353, 156, 'darkness_descends', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(354, 156, 'bonds_of_mythril', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(385, 182, 'maiden_of_the_dusk', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(416, 201, 'trial_by_wind', 'Anemone', 3, 175, 1800, 0, 6, 0, 5, 0),
	(417, 201, 'carbuncle_debacle', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(418, 201, 'trial-size_trial_by_wind', 'nobody', 0, 900, 900, 0, 1, 0, 5, 0),
	(419, 201, 'waking_the_beast', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(420, 201, 'sugar-coated_directive', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(448, 202, 'trial_by_lightning', 'Tierkaintwo', 1, 167, 1800, 0, 6, 0, 5, 0),
	(449, 202, 'carbuncle_debacle', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(450, 202, 'trial-size_trial_by_lightning', 'nobody', 0, 900, 900, 0, 1, 0, 5, 0),
	(451, 202, 'waking_the_beast', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(452, 202, 'sugar-coated_directive', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(480, 203, 'trial_by_ice', 'Fujin', 3, 124, 1800, 0, 6, 0, 5, 0),
	(481, 203, 'class_reunion', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(482, 203, 'trial-size_trial_by_ice', 'nobody', 0, 900, 900, 0, 1, 0, 5, 0),
	(483, 203, 'waking_the_beast', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(484, 203, 'sugar-coated_directive', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(512, 206, 'rank_5_mission', 'Althanos', 2, 67, 900, 0, 6, 0, 5, 1),
	(513, 206, 'come_into_my_parlor', 'nobody', 0, 1800, 1800, 0, 6, 513, 15, 0),
	(514, 206, 'e-vase-ive_action', 'nobody', 0, 1800, 1800, 0, 6, 514, 15, 0),
	(515, 206, 'infernal_swarm', 'nobody', 0, 1800, 1800, 0, 6, 515, 15, 0),
	(516, 206, 'heir_to_the_light', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 1),
	(517, 206, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(518, 206, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(519, 206, 'shattering_stars', 'nobody', 0, 600, 600, 99, 1, 0, 22, 0),
	(520, 206, 'demolition_squad', 'Khalum', 3, 254, 1800, 0, 6, 520, 15, 0),
	(521, 206, 'die_by_the_sword', 'Khalum', 1, 61, 1800, 0, 6, 521, 15, 0),
	(522, 206, 'let_sleeping_dogs_die', 'Tierkaintwo', 1, 61, 1800, 0, 6, 522, 15, 0),
	(523, 206, 'brothers_d_aurphe', 'Khalum', 1, 55, 1800, 0, 6, 523, 15, 0),
	(524, 206, 'undying_promise', 'nobody', 0, 900, 900, 0, 3, 524, 15, 0),
	(525, 206, 'factory_rejects', 'nobody', 0, 1800, 1800, 0, 6, 525, 15, 0),
	(526, 206, 'idol_thoughts', 'nobody', 0, 1800, 1800, 0, 6, 526, 15, 0),
	(527, 206, 'awful_autopsy', 'nobody', 0, 900, 900, 0, 3, 527, 15, 0),
	(528, 206, 'celery', 'nobody', 0, 900, 900, 0, 3, 528, 15, 0),
	(529, 206, 'mirror_images', 'nobody', 0, 900, 900, 0, 1, 0, 7, 0),
	(530, 206, 'furious_finale', 'nobody', 0, 600, 600, 0, 1, 0, 6, 0),
	(531, 206, 'clash_of_the_comrades', 'nobody', 0, 600, 600, 0, 1, 0, 7, 0),
	(532, 206, 'those_who_lurk_in_shadows', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(533, 206, 'beyond_infinity', 'nobody', 0, 600, 600, 0, 6, 0, 5, 0),
	(544, 207, 'trial_by_fire', 'Khalum', 1, 109, 1800, 0, 6, 0, 5, 0),
	(545, 207, 'trial-size_trial_by_fire', 'nobody', 0, 900, 900, 0, 1, 0, 5, 0),
	(546, 207, 'waking_the_beast', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(547, 207, 'sugar-coated_directive', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(576, 209, 'trial_by_earth', 'Fujin', 3, 278, 1800, 0, 6, 0, 5, 0),
	(577, 209, 'puppet_master', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(578, 209, 'trial-size_trial_by_earth', 'nobody', 0, 900, 900, 0, 1, 0, 5, 0),
	(579, 209, 'waking_the_beast', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(580, 209, 'sugar-coated_directive', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(608, 211, 'trial_by_water', 'Pldtest', 1, 242, 1800, 0, 6, 0, 5, 0),
	(609, 211, 'trial-size_trial_by_water', 'nobody', 0, 900, 900, 0, 1, 0, 5, 0),
	(610, 211, 'waking_the_beast', 'nobody', 0, 1800, 1800, 0, 18, 0, 5, 0),
	(611, 211, 'sugar-coated_directive', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(640, 6, 'flames_for_the_dead', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 0),
	(641, 6, 'follow_the_white_rabbit', 'nobody', 0, 1800, 1800, 0, 18, 641, 15, 0),
	(642, 6, 'when_hell_freezes_over', 'nobody', 0, 900, 900, 0, 18, 642, 15, 0),
	(643, 6, 'brothers', 'nobody', 0, 1800, 1800, 0, 18, 643, 15, 0),
	(644, 6, 'holy_cow', 'nobody', 0, 1800, 1800, 0, 18, 644, 15, 0),
	(672, 8, 'head_wind', 'Pldtest', 1, 672, 1800, 0, 6, 0, 5, 1),
	(673, 8, 'like_the_wind', 'nobody', 0, 900, 900, 0, 18, 673, 15, 0),
	(674, 8, 'sheep_in_antlions_clothing', 'nobody', 0, 1800, 1800, 0, 18, 674, 15, 0),
	(675, 8, 'shell_we_dance', 'nobody', 0, 1800, 1800, 0, 18, 675, 15, 0),
	(676, 8, 'totentanz', 'nobody', 0, 1800, 1800, 0, 18, 676, 15, 0),
	(677, 8, 'tango_with_a_tracker', 'nobody', 0, 1800, 1800, 0, 6, 0, 7, 0),
	(678, 8, 'requiem_of_a_sin', 'nobody', 0, 1800, 1800, 0, 6, 0, 7, 0),
	(679, 8, 'antagonistic_ambuscade', 'nobody', 0, 900, 900, 0, 6, 679, 15, 0),
	(704, 10, 'darkness_named', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 1),
	(705, 10, 'test_your_mite', 'nobody', 0, 1800, 1800, 0, 18, 705, 15, 0),
	(706, 10, 'waking_dreams', 'Khalum', 1, 59, 1800, 0, 18, 0, 5, 0),
	(736, 13, 'century_of_hardship', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 1),
	(737, 13, 'return_to_the_depths', 'nobody', 0, 1800, 1800, 0, 6, 0, 7, 0),
	(738, 13, 'bionic_bug', 'nobody', 0, 1800, 1800, 0, 18, 738, 15, 0),
	(739, 13, 'pulling_the_strings', 'nobody', 0, 900, 900, 0, 1, 739, 15, 0),
	(740, 13, 'automaton_assault', 'nobody', 0, 900, 900, 0, 6, 740, 15, 0),
	(741, 13, 'mobline_comedy', 'nobody', 0, 900, 900, 0, 6, 741, 15, 0),
	(768, 17, 'ancient_flames_beckon', 'Jasnah', 1, 38, 1800, 0, 6, 0, 5, 1),
	(769, 17, 'simulant', 'nobody', 0, 1800, 1800, 0, 18, 769, 15, 0),
	(770, 17, 'empty_hopes', 'nobody', 0, 900, 900, 0, 6, 0, 5, 0),
	(800, 19, 'ancient_flames_beckon', 'Jasnah', 1, 43, 1800, 0, 6, 0, 5, 1),
	(801, 19, 'you_are_what_you_eat', 'nobody', 0, 1800, 1800, 0, 18, 801, 15, 0),
	(802, 19, 'empty_dreams', 'nobody', 0, 900, 900, 0, 6, 0, 5, 0),
	(832, 21, 'ancient_flames_beckon', 'Jasnah', 1, 39, 1800, 0, 6, 0, 5, 1),
	(833, 21, 'playing_host', 'nobody', 0, 1800, 1800, 0, 18, 833, 15, 0),
	(834, 21, 'empty_desires', 'nobody', 0, 900, 900, 0, 6, 0, 5, 0),
	(864, 23, 'desires_of_emptiness', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 1),
	(865, 23, 'pulling_the_plug', 'nobody', 0, 1800, 1800, 0, 18, 865, 15, 0),
	(866, 23, 'empty_aspirations', 'nobody', 0, 900, 900, 0, 6, 0, 5, 0),
	(896, 29, 'storms_of_fate', 'nobody', 0, 1800, 1800, 0, 18, 0, 7, 0),
	(897, 29, 'wyrmking_descends', 'nobody', 0, 3600, 3600, 0, 18, 897, 7, 0),
	(928, 30, 'ouryu_cometh', 'nobody', 0, 3600, 3600, 0, 18, 928, 7, 0),
	(960, 31, 'ancient_vows', 'Olokun', 1, 428, 1800, 0, 6, 0, 5, 1),
	(961, 31, 'savage', 'Pldtest', 1, 0, 1800, 0, 6, 0, 5, 1),
	(962, 31, 'fire_in_the_sky', 'nobody', 0, 900, 900, 0, 18, 962, 15, 0),
	(963, 31, 'bad_seed', 'nobody', 0, 1800, 1800, 0, 18, 963, 15, 0),
	(964, 31, 'bugard_in_the_clouds', 'nobody', 0, 900, 900, 0, 18, 964, 15, 0),
	(965, 31, 'beloved_of_the_atlantes', 'nobody', 0, 1800, 1800, 0, 18, 965, 15, 0),
	(966, 31, 'uninvited_guests', 'nobody', 0, 1800, 1800, 0, 18, 0, 7, 0),
	(967, 31, 'nest_of_nightmares', 'nobody', 0, 900, 900, 0, 6, 967, 15, 0),
	(992, 32, 'one_to_be_feared', 'Khalum', 1, 441, 2700, 0, 6, 0, 5, 1),
	(993, 32, 'warriors_path', 'Tierkaintwo', 1, 32, 1800, 0, 6, 0, 5, 1),
	(1024, 35, 'when_angels_fall', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 1),
	(1056, 36, 'dawn', 'nobody', 0, 1800, 1800, 0, 6, 0, 5, 1),
	(1057, 36, 'apocalypse_nigh', 'nobody', 0, 1800, 1800, 0, 6, 0, 7, 0),
	(1088, 57, 'call_to_arms', 'nobody', 0, 1800, 1800, 0, 6, 1088, 15, 0),
	(1089, 57, 'compliments_to_the_chef', 'nobody', 0, 1800, 1800, 0, 6, 1089, 15, 0),
	(1090, 57, 'puppetmaster_blues', 'nobody', 0, 1800, 1800, 0, 6, 0, 7, 0),
	(1091, 57, 'breaking_the_bonds_of_fate', 'nobody', 0, 600, 600, 0, 1, 0, 6, 0),
	(1092, 57, 'legacy_of_the_lost', 'Jasnah', 1, 0, 1800, 0, 6, 0, 5, 0),
	(1120, 64, 'tough_nut_to_crack', 'nobody', 0, 1800, 1800, 0, 6, 1120, 15, 0),
	(1121, 64, 'happy_caster', 'nobody', 0, 1800, 1800, 0, 6, 1121, 15, 0),
	(1122, 64, 'omens', 'nobody', 0, 1800, 1800, 0, 18, 0, 7, 0),
	(1123, 64, 'achieving_true_power', 'nobody', 0, 600, 600, 0, 1, 0, 6, 0),
	(1124, 64, 'shield_of_diplomacy', 'Jasnah', 1, 62, 1800, 0, 6, 0, 5, 0),
	(1152, 67, 'making_a_mockery', 'nobody', 0, 1800, 1800, 0, 6, 1152, 15, 0),
	(1153, 67, 'shadows_of_the_mind', 'nobody', 0, 1800, 1800, 0, 6, 1153, 15, 0),
	(1154, 67, 'beast_within', 'nobody', 0, 600, 600, 0, 1, 0, 6, 0),
	(1155, 67, 'moment_of_truth', 'nobody', 0, 1800, 1800, 0, 6, 0, 7, 0),
	(1156, 67, 'puppet_in_peril', 'Jasnah', 1, 52, 1800, 0, 6, 0, 5, 0),
	(1184, 78, 'rider_cometh', 'nobody', 0, 900, 900, 0, 6, 0, 5, 0),
	(1290, 38, 'nw_apollyon', 'nobody', 0, 1800, 3600, 0, 18, 0, 7, 0),
	(1291, 38, 'sw_apollyon', 'Zillion', 0, 295, 3600, 0, 18, 0, 7, 0),
	(1292, 38, 'ne_apollyon', 'nobody', 0, 1800, 3600, 0, 18, 0, 7, 0),
	(1293, 38, 'se_apollyon', 'Meredie', 1, 1788, 3600, 0, 18, 0, 7, 0),
	(1294, 38, 'cs_apollyon', 'nobody', 0, 1200, 1200, 0, 18, 0, 7, 0),
	(1295, 38, 'cs_apollyon_ii', 'nobody', 0, 1200, 1200, 0, 18, 0, 7, 0),
	(1296, 38, 'central_apollyon', 'nobody', 0, 1800, 1800, 0, 18, 0, 7, 0),
	(1297, 38, 'central_apollyon_ii', 'nobody', 0, 1800, 1800, 0, 18, 0, 7, 0),
	(1298, 37, 'temenos_western_tower', 'nobody', 0, 1800, 1800, 0, 18, 0, 7, 0),
	(1299, 37, 'temenos_northern_tower', 'nobody', 0, 1800, 1800, 0, 18, 0, 7, 0),
	(1300, 37, 'temenos_eastern_tower', 'nobody', 0, 1800, 1800, 0, 18, 0, 7, 0),
	(1301, 37, 'central_temenos_basement', 'nobody', 0, 900, 900, 0, 18, 0, 7, 0),
	(1302, 37, 'central_temenos_basement_ii', 'nobody', 0, 900, 900, 0, 18, 0, 7, 0),
	(1303, 37, 'central_temenos_1st_floor', 'nobody', 0, 2700, 2700, 0, 18, 0, 7, 0),
	(1304, 37, 'central_temenos_2nd_floor', 'nobody', 0, 2700, 2700, 0, 18, 0, 7, 0),
	(1305, 37, 'central_temenos_3rd_floor', 'nobody', 0, 2700, 2700, 0, 18, 0, 7, 0),
	(1306, 37, 'central_temenos_4th_floor', 'nobody', 0, 3600, 3600, 0, 18, 0, 7, 0),
	(1307, 37, 'central_temenos_4th_floor_ii', 'nobody', 0, 3600, 3600, 0, 18, 0, 7, 0);
/*!40000 ALTER TABLE `bcnm_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
