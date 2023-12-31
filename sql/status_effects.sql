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

-- Dumping structure for table tpzdb.status_effects
CREATE TABLE IF NOT EXISTS `status_effects` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `flags` int(8) unsigned NOT NULL DEFAULT 0,
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `negative_id` smallint(5) unsigned DEFAULT 0,
  `overwrite` smallint(5) unsigned NOT NULL DEFAULT 0,
  `block_id` smallint(5) unsigned DEFAULT 0,
  `remove_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `element` smallint(5) unsigned NOT NULL DEFAULT 0,
  `min_duration` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sort_key` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.status_effects: 639 rows
/*!40000 ALTER TABLE `status_effects` DISABLE KEYS */;
INSERT INTO `status_effects` (`id`, `name`, `flags`, `type`, `negative_id`, `overwrite`, `block_id`, `remove_id`, `element`, `min_duration`, `sort_key`) VALUES
	(0, 'ko', 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(1, 'weakness', 8388608, 0, 0, 3, 0, 0, 0, 1, 0),
	(2, 'sleep', 8388656, 2, 19, 1, 193, 0, 8, 1, 0),
	(3, 'poison', 8405024, 0, 0, 2, 0, 0, 3, 1, 0),
	(4, 'paralysis', 8405024, 0, 0, 1, 0, 0, 5, 1, 0),
	(5, 'blindness', 8405024, 0, 0, 1, 0, 0, 8, 1, 0),
	(6, 'silence', 8405024, 0, 0, 2, 0, 0, 4, 1, 0),
	(7, 'petrification', 8388640, 7, 0, 2, 10, 0, 2, 1, 0),
	(8, 'disease', 8409120, 8, 0, 2, 0, 0, 1, 1, 0),
	(9, 'curse', 8405024, 9, 0, 2, 0, 0, 8, 1, 0),
	(10, 'stun', 8388642, 0, 0, 2, 7, 0, 6, 1, 0),
	(11, 'bind', 8405026, 0, 0, 2, 0, 0, 5, 1, 0),
	(12, 'weight', 8405026, 0, 32, 1, 0, 0, 4, 1, 0),
	(13, 'slow', 8405026, 0, 33, 1, 0, 0, 2, 1, 0),
	(14, 'charm', 8388640, 0, 0, 2, 0, 0, 3, 0, 0),
	(15, 'doom', 8388640, 0, 0, 2, 0, 0, 8, 1, 0),
	(16, 'amnesia', 8388640, 0, 0, 2, 0, 0, 1, 1, 0),
	(17, 'charm', 8388640, 0, 0, 2, 0, 0, 3, 0, 0),
	(18, 'gradual_petrification', 8388640, 7, 0, 2, 0, 0, 2, 1, 0),
	(19, 'sleep', 8388656, 2, 0, 1, 0, 0, 8, 1, 0),
	(20, 'curse', 8392736, 9, 0, 2, 0, 0, 8, 1, 0),
	(21, 'addle', 8405026, 0, 0, 2, 0, 0, 1, 1, 0),
	(22, 'intimidate', 32, 0, 0, 2, 0, 0, 0, 1, 0),
	(23, 'kaustra', 8388640, 0, 228, 0, 0, 0, 0, 0, 0),
	(28, 'terror', 8388640, 7, 0, 0, 0, 0, 8, 1, 0),
	(29, 'mute', 8388640, 0, 0, 2, 0, 6, 4, 1, 0),
	(30, 'bane', 8405024, 0, 0, 2, 0, 9, 8, 1, 0),
	(31, 'plague', 8409120, 8, 0, 2, 0, 0, 1, 1, 0),
	(32, 'flee', 41, 0, 12, 0, 0, 0, 4, 0, 0),
	(33, 'haste', 41, 0, 13, 0, 0, 0, 4, 0, 100),
	(34, 'blaze_spikes', 41, 34, 0, 0, 0, 0, 1, 0, 800),
	(35, 'ice_spikes', 41, 34, 0, 0, 0, 0, 5, 0, 800),
	(36, 'blink', 41, 36, 0, 0, 66, 0, 4, 0, 50),
	(37, 'stoneskin', 41, 0, 0, 5, 0, 0, 2, 0, 600),
	(38, 'shock_spikes', 41, 34, 0, 0, 0, 0, 6, 0, 800),
	(39, 'aquaveil', 41, 0, 0, 0, 0, 0, 3, 0, 650),
	(40, 'protect', 41, 0, 0, 0, 0, 0, 7, 0, 200),
	(41, 'shell', 41, 0, 0, 0, 0, 0, 7, 0, 250),
	(42, 'regen', 41, 0, 0, 0, 0, 0, 7, 0, 700),
	(43, 'refresh', 41, 0, 0, 0, 0, 0, 7, 0, 750),
	(44, 'mighty_strikes', 32, 0, 0, 0, 0, 0, 1, 0, 0),
	(45, 'boost', 45, 0, 0, 0, 0, 0, 1, 0, 0),
	(46, 'hundred_fists', 32, 0, 0, 0, 0, 0, 6, 0, 0),
	(47, 'manafont', 32, 0, 0, 0, 0, 0, 3, 0, 0),
	(48, 'chainspell', 32, 0, 0, 0, 0, 0, 6, 0, 0),
	(49, 'perfect_dodge', 32, 0, 0, 0, 0, 0, 4, 0, 0),
	(50, 'invincible', 32, 0, 0, 0, 0, 0, 2, 0, 0),
	(51, 'blood_weapon', 32, 94, 0, 0, 0, 0, 8, 0, 0),
	(52, 'soul_voice', 32, 0, 0, 0, 0, 0, 7, 0, 0),
	(53, 'eagle_eye_shot', 32, 0, 0, 0, 0, 0, 6, 0, 0),
	(54, 'meikyo_shisui', 32, 0, 0, 0, 0, 0, 6, 0, 0),
	(55, 'astral_flow', 32, 0, 0, 0, 0, 0, 6, 0, 0),
	(56, 'berserk', 41, 56, 0, 0, 0, 0, 1, 0, 0),
	(57, 'defender', 33, 56, 0, 0, 0, 0, 2, 0, 0),
	(58, 'aggressor', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(59, 'focus', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(60, 'dodge', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(61, 'counterstance', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(62, 'sentinel', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(63, 'souleater', 40, 0, 0, 0, 0, 0, 0, 0, 0),
	(64, 'last_resort', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(65, 'sneak_attack', 37, 0, 0, 0, 0, 0, 0, 0, 0),
	(66, 'copy_image', 33, 0, 0, 0, 0, 36, 4, 0, 50),
	(67, 'third_eye', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(68, 'warcry', 41, 0, 0, 0, 0, 0, 0, 0, 400),
	(69, 'invisible', 3429, 0, 0, 2, 0, 0, 4, 0, 850),
	(70, 'deodorize', 2341, 0, 0, 2, 0, 0, 4, 0, 1100),
	(71, 'sneak', 2341, 0, 0, 2, 0, 0, 4, 0, 1150),
	(72, 'sharpshot', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(73, 'barrage', 33, 73, 0, 0, 0, 0, 0, 0, 0),
	(74, 'holy_circle', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(75, 'arcane_circle', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(76, 'hide', 3429, 0, 0, 0, 0, 0, 0, 0, 0),
	(77, 'camouflage', 3425, 0, 0, 0, 0, 0, 0, 0, 0),
	(78, 'divine_seal', 161, 0, 0, 0, 0, 0, 0, 0, 0),
	(79, 'elemental_seal', 161, 0, 0, 0, 0, 0, 0, 0, 0),
	(80, 'str_boost', 41, 0, 136, 0, 0, 0, 1, 0, 0),
	(81, 'dex_boost', 41, 0, 137, 0, 0, 0, 6, 0, 0),
	(82, 'vit_boost', 41, 0, 138, 0, 0, 0, 2, 0, 0),
	(83, 'agi_boost', 41, 0, 139, 0, 0, 0, 4, 0, 0),
	(84, 'int_boost', 41, 0, 140, 0, 0, 0, 5, 0, 0),
	(85, 'mnd_boost', 41, 0, 141, 0, 0, 0, 3, 0, 0),
	(86, 'chr_boost', 41, 0, 142, 0, 0, 0, 7, 0, 0),
	(87, 'trick_attack', 37, 0, 0, 0, 0, 0, 0, 0, 0),
	(88, 'max_hp_boost', 41, 0, 144, 0, 0, 0, 7, 0, 0),
	(89, 'max_mp_boost', 41, 0, 145, 0, 0, 0, 8, 0, 0),
	(90, 'accuracy_boost', 41, 0, 146, 0, 0, 0, 6, 0, 0),
	(91, 'attack_boost', 41, 0, 147, 0, 0, 0, 1, 0, 0),
	(92, 'evasion_boost', 41, 0, 148, 0, 0, 0, 4, 0, 0),
	(93, 'defense_boost', 41, 0, 149, 0, 0, 0, 2, 0, 0),
	(94, 'enfire', 41, 94, 51, 0, 0, 0, 1, 0, 1200),
	(95, 'enblizzard', 41, 94, 51, 0, 0, 0, 5, 0, 1200),
	(96, 'enaero', 41, 94, 51, 0, 0, 0, 4, 0, 1200),
	(97, 'enstone', 41, 94, 51, 0, 0, 0, 2, 0, 1200),
	(98, 'enthunder', 41, 94, 51, 0, 0, 0, 6, 0, 1200),
	(99, 'enwater', 41, 94, 51, 0, 0, 0, 3, 0, 1200),
	(100, 'barfire', 41, 100, 0, 0, 0, 0, 3, 0, 500),
	(101, 'barblizzard', 41, 100, 0, 0, 0, 0, 1, 0, 500),
	(102, 'baraero', 41, 100, 0, 0, 0, 0, 5, 0, 500),
	(103, 'barstone', 41, 100, 0, 0, 0, 0, 4, 0, 500),
	(104, 'barthunder', 41, 100, 0, 0, 0, 0, 2, 0, 500),
	(105, 'barwater', 41, 100, 0, 0, 0, 0, 6, 0, 500),
	(106, 'barsleep', 41, 106, 0, 0, 0, 0, 7, 0, 500),
	(107, 'barpoison', 41, 106, 0, 0, 0, 0, 6, 0, 500),
	(108, 'barparalyze', 41, 106, 0, 0, 0, 0, 1, 0, 500),
	(109, 'barblind', 41, 106, 0, 0, 0, 0, 7, 0, 500),
	(110, 'barsilence', 41, 106, 0, 0, 0, 0, 5, 0, 500),
	(111, 'barpetrify', 41, 106, 0, 0, 0, 0, 4, 0, 500),
	(112, 'barvirus', 41, 106, 0, 0, 0, 0, 3, 0, 500),
	(113, 'reraise', 41, 0, 0, 0, 0, 0, 7, 0, 900),
	(114, 'cover', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(115, 'unlimited_shot', 32, 73, 0, 0, 0, 0, 0, 0, 0),
	(116, 'phalanx', 33, 0, 0, 0, 0, 0, 7, 0, 1050),
	(117, 'warding_circle', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(118, 'ancient_circle', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(119, 'str_boost', 41, 0, 0, 0, 0, 0, 1, 0, 0),
	(120, 'dex_boost', 41, 0, 0, 0, 0, 0, 6, 0, 0),
	(121, 'vit_boost', 41, 0, 0, 0, 0, 0, 2, 0, 0),
	(122, 'agi_boost', 41, 0, 0, 0, 0, 0, 4, 0, 0),
	(123, 'int_boost', 41, 0, 0, 0, 0, 0, 5, 0, 0),
	(124, 'mnd_boost', 41, 0, 0, 0, 0, 0, 3, 0, 0),
	(125, 'chr_boost', 41, 0, 0, 0, 0, 0, 7, 0, 0),
	(126, 'spirit_surge', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(127, 'costume', 164, 0, 0, 0, 0, 0, 0, 0, 0),
	(128, 'burn', 8405026, 0, 0, 0, 133, 129, 1, 0, 0),
	(129, 'frost', 8405026, 0, 0, 0, 128, 130, 5, 0, 0),
	(130, 'choke', 8405026, 0, 0, 0, 129, 131, 4, 0, 0),
	(131, 'rasp', 8405026, 0, 0, 0, 130, 132, 2, 0, 0),
	(132, 'shock', 8405026, 0, 0, 0, 131, 133, 6, 0, 0),
	(133, 'drown', 8405026, 0, 0, 0, 132, 128, 3, 0, 0),
	(134, 'dia', 8405026, 0, 134, 1, 0, 0, 7, 0, 0),
	(135, 'bio', 8405026, 0, 134, 1, 0, 0, 8, 0, 0),
	(136, 'str_down', 8405026, 0, 0, 0, 0, 80, 3, 0, 0),
	(137, 'dex_down', 8405026, 0, 0, 0, 0, 81, 2, 0, 0),
	(138, 'vit_down', 8405026, 0, 0, 0, 0, 82, 4, 0, 0),
	(139, 'agi_down', 8405026, 0, 0, 0, 0, 83, 5, 0, 0),
	(140, 'int_down', 8405026, 0, 0, 0, 0, 84, 1, 0, 0),
	(141, 'mnd_down', 8405026, 0, 0, 0, 0, 85, 6, 0, 0),
	(142, 'chr_down', 8405026, 0, 0, 0, 0, 86, 8, 0, 0),
	(143, 'level_restriction', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(144, 'max_hp_down', 8405026, 0, 0, 0, 0, 88, 8, 0, 0),
	(145, 'max_mp_down', 8405026, 0, 0, 0, 0, 89, 7, 0, 0),
	(146, 'accuracy_down', 8405026, 0, 0, 0, 0, 90, 2, 0, 0),
	(147, 'attack_down', 8405026, 0, 0, 0, 0, 91, 3, 0, 0),
	(148, 'evasion_down', 8405026, 0, 0, 0, 0, 92, 5, 0, 0),
	(149, 'defense_down', 8405026, 0, 0, 0, 0, 93, 4, 0, 0),
	(150, 'physical_shield', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(151, 'arrow_shield', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(152, 'magic_shield', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(153, 'damage_spikes', 41, 34, 0, 0, 0, 0, 0, 0, 800),
	(154, 'shining_ruby', 41, 0, 0, 0, 0, 0, 0, 0, 0),
	(155, 'medicine', 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(156, 'flash', 8405026, 0, 0, 1, 0, 0, 7, 0, 0),
	(157, 'sj_restriction', 8388864, 0, 0, 0, 0, 0, 0, 0, 0),
	(158, 'provoke', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(159, 'penalty', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(160, 'preparations', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(161, 'sprint', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(162, 'enchantment', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(163, 'azure_lore', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(164, 'chain_affinity', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(165, 'burst_affinity', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(166, 'overdrive', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(167, 'magic_def_down', 16418, 0, 0, 0, 0, 0, 0, 0, 0),
	(168, 'inhibit_tp', 32, 0, 0, 0, 0, 0, 8, 0, 0),
	(169, 'potency', 40, 0, 0, 0, 0, 0, 0, 0, 0),
	(170, 'regain', 40, 0, 0, 0, 0, 0, 7, 0, 0),
	(171, 'pax', 40, 0, 0, 0, 0, 0, 0, 0, 0),
	(172, 'intension', 40, 0, 0, 0, 0, 0, 0, 0, 0),
	(173, 'dread_spikes', 41, 34, 0, 0, 0, 0, 0, 0, 800),
	(174, 'magic_acc_down', 16418, 0, 0, 0, 0, 0, 1, 0, 0),
	(175, 'magic_atk_down', 16418, 0, 0, 0, 0, 0, 2, 0, 0),
	(176, 'quickening', 172, 0, 0, 0, 0, 0, 0, 0, 0),
	(177, 'encumbrance', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(178, 'firestorm', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(179, 'hailstorm', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(180, 'windstorm', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(181, 'sandstorm', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(182, 'thunderstorm', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(183, 'rainstorm', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(184, 'aurorastorm', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(185, 'voidstorm', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(186, 'helix', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(187, 'sublimation_activated', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(188, 'sublimation_complete', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(189, 'max_tp_down', 16418, 0, 0, 0, 0, 0, 8, 0, 0),
	(190, 'magic_atk_boost', 41, 0, 0, 0, 0, 0, 5, 0, 0),
	(191, 'magic_def_boost', 41, 0, 0, 0, 0, 0, 3, 0, 0),
	(192, 'requiem', 65570, 0, 0, 1, 0, 0, 7, 0, 2000),
	(193, 'lullaby', 65584, 2, 19, 2, 2, 0, 7, 1, 2000),
	(194, 'elegy', 65570, 0, 0, 0, 0, 0, 2, 0, 2000),
	(195, 'paeon', 65833, 0, 0, 4, 0, 0, 7, 0, 2000),
	(196, 'ballad', 65833, 0, 0, 4, 0, 0, 7, 0, 2000),
	(197, 'minne', 65833, 0, 0, 4, 0, 0, 2, 0, 2000),
	(198, 'minuet', 65833, 0, 0, 4, 0, 0, 1, 0, 2000),
	(199, 'madrigal', 65833, 0, 0, 4, 0, 0, 6, 0, 2000),
	(200, 'prelude', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(201, 'mambo', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(202, 'aubade', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(203, 'pastoral', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(204, 'hum', 65832, 0, 0, 4, 0, 0, 0, 0, 2000),
	(205, 'fantasia', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(206, 'operetta', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(207, 'capriccio', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(208, 'serenade', 65832, 0, 0, 4, 0, 0, 0, 0, 2000),
	(209, 'round', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(210, 'gavotte', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(211, 'fugue', 65832, 0, 0, 4, 0, 0, 0, 0, 2000),
	(212, 'rhapsody', 65832, 0, 0, 4, 0, 0, 0, 0, 2000),
	(213, 'aria', 65832, 0, 0, 4, 0, 0, 0, 0, 2000),
	(214, 'march', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(215, 'etude', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(216, 'carol', 65833, 0, 0, 4, 0, 0, 0, 0, 2000),
	(217, 'threnody', 66088, 0, 0, 1, 0, 0, 0, 0, 2000),
	(218, 'hymnus', 65832, 0, 0, 4, 0, 0, 0, 0, 2000),
	(219, 'mazurka', 65846, 0, 0, 0, 0, 0, 0, 0, 2000),
	(220, 'sirvente', 288, 0, 0, 4, 0, 0, 0, 0, 2000),
	(221, 'dirge', 288, 0, 0, 4, 0, 0, 0, 0, 2000),
	(222, 'scherzo', 288, 0, 0, 4, 0, 0, 0, 0, 2000),
	(223, 'nocturne', 288, 0, 0, 4, 0, 0, 0, 0, 2000),
	(227, 'store_tp', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(228, 'embrava', 32, 0, 23, 0, 0, 0, 0, 0, 0),
	(229, 'manawell', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(230, 'spontaneity', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(231, 'marcato', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(233, 'auto-regen', 32, 0, 0, 4, 0, 0, 0, 0, 0),
	(234, 'auto-refresh', 32, 0, 0, 4, 0, 0, 0, 0, 0),
	(235, 'fishing_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(236, 'woodworking_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(237, 'smithing_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(238, 'goldsmithing_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(239, 'clothcraft_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(240, 'leathercraft_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(241, 'bonecraft_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(242, 'alchemy_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(243, 'cooking_imagery', 262176, 0, 0, 0, 0, 0, 0, 0, 0),
	(244, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0, 0),
	(245, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0, 0),
	(246, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0, 0),
	(247, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0, 0),
	(248, '(imagery)', 32, 244, 0, 0, 0, 0, 0, 0, 0),
	(249, 'dedication', 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(250, 'ef_badge', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(251, 'food', 8421408, 0, 0, 2, 0, 0, 0, 0, 0),
	(252, 'mounted', 164, 0, 0, 0, 0, 0, 0, 0, 0),
	(253, 'signet', 16777216, 0, 0, 0, 0, 0, 0, 0, 1000),
	(254, 'battlefield', 8913152, 0, 0, 0, 0, 0, 0, 0, 0),
	(256, 'sanction', 16777216, 0, 0, 0, 0, 0, 0, 0, 1000),
	(257, 'besieged', 524544, 0, 0, 0, 0, 0, 0, 0, 0),
	(258, 'illusion', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(259, 'encumbrance', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(260, 'obliviscence', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(261, 'impairment', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(262, 'omerta', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(263, 'debilitation', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(264, 'pathos', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(265, 'flurry', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(266, 'concentration', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(267, 'allied_tags', 8912928, 0, 0, 0, 0, 0, 0, 0, 0),
	(268, 'sigil', 16777216, 0, 0, 0, 0, 0, 0, 0, 0),
	(269, 'level_sync', 8388608, 0, 0, 0, 0, 0, 0, 0, 0),
	(270, 'aftermath_lv1', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(271, 'aftermath_lv2', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(272, 'aftermath_lv3', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(273, 'aftermath', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(274, 'enlight', 41, 94, 51, 0, 0, 0, 7, 0, 0),
	(275, 'auspice', 32, 94, 51, 0, 0, 0, 7, 0, 0),
	(276, 'confrontation', 8912928, 0, 0, 0, 0, 0, 0, 0, 0),
	(277, 'enfire_ii', 41, 94, 51, 0, 0, 0, 1, 0, 0),
	(278, 'enblizzard_ii', 41, 94, 51, 0, 0, 0, 5, 0, 0),
	(279, 'enaero_ii', 41, 94, 51, 0, 0, 0, 4, 0, 0),
	(280, 'enstone_ii', 41, 94, 51, 0, 0, 0, 2, 0, 0),
	(281, 'enthunder_ii', 41, 94, 51, 0, 0, 0, 6, 0, 0),
	(282, 'enwater_ii', 41, 94, 51, 0, 0, 0, 3, 0, 0),
	(283, 'perfect_defense', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(284, 'egg', 8388896, 0, 0, 0, 0, 0, 0, 0, 0),
	(285, 'visitant', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(286, 'baramnesia', 41, 106, 0, 0, 0, 0, 0, 0, 500),
	(287, 'atma', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(288, 'endark', 41, 94, 51, 0, 0, 0, 8, 0, 0),
	(289, 'enmity_boost', 32, 0, 0, 0, 0, 0, 1, 0, 0),
	(290, 'subtle_blow_plus', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(291, 'enmity_down', 16418, 0, 0, 0, 0, 0, 3, 0, 0),
	(292, 'pennant', 524320, 0, 0, 0, 0, 0, 0, 0, 0),
	(293, 'negate_petrify', 289, 0, 0, 0, 7, 0, 0, 0, 0),
	(294, 'negate_terror', 289, 0, 0, 0, 28, 0, 0, 0, 0),
	(295, 'negate_amnesia', 289, 0, 0, 0, 16, 0, 0, 0, 0),
	(296, 'negate_doom', 289, 0, 0, 0, 15, 0, 0, 0, 0),
	(297, 'negate_poison', 289, 0, 0, 0, 3, 0, 0, 0, 0),
	(298, 'critical_hit_evasion_down', 8405026, 0, 0, 0, 0, 0, 0, 0, 0),
	(299, 'overload', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(300, 'fire_maneuver', 5243680, 0, 0, 4, 0, 0, 0, 0, 3000),
	(301, 'ice_maneuver', 5243680, 0, 0, 4, 0, 0, 0, 0, 3000),
	(302, 'wind_maneuver', 5243680, 0, 0, 4, 0, 0, 0, 0, 3000),
	(303, 'earth_maneuver', 5243680, 0, 0, 4, 0, 0, 0, 0, 3000),
	(304, 'thunder_maneuver', 5243680, 0, 0, 4, 0, 0, 0, 0, 3000),
	(305, 'water_maneuver', 5243680, 0, 0, 4, 0, 0, 0, 0, 3000),
	(306, 'light_maneuver', 5243680, 0, 0, 4, 0, 0, 0, 0, 3000),
	(307, 'dark_maneuver', 5243680, 0, 0, 4, 0, 0, 0, 0, 3000),
	(308, 'double-up_chance', 288, 0, 0, 0, 0, 0, 0, 0, 2050),
	(309, 'bust', 8388896, 0, 0, 4, 0, 0, 0, 0, 2050),
	(310, 'fighters_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(311, 'monks_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(312, 'healers_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(313, 'wizards_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(314, 'warlocks_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(315, 'rogues_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(316, 'gallants_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(317, 'chaos_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(318, 'beast_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(319, 'choral_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(320, 'hunters_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(321, 'samurai_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(322, 'ninja_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(323, 'drachen_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(324, 'evokers_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(325, 'maguss_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(326, 'corsairs_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(327, 'puppet_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(328, 'dancers_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(329, 'scholars_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(330, 'bolters_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(331, 'casters_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(332, 'coursers_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(333, 'blitzers_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(334, 'tacticians_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(335, 'allies_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(336, 'misers_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(337, 'companions_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(338, 'avengers_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(339, 'naturalists_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 2000),
	(340, 'warriors_charge', 37, 0, 0, 0, 0, 0, 0, 0, 0),
	(341, 'formless_strikes', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(342, 'assassins_charge', 37, 0, 0, 0, 0, 0, 0, 0, 0),
	(343, 'feint', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(344, 'fealty', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(345, 'dark_seal', 161, 0, 0, 0, 0, 0, 0, 0, 0),
	(346, 'diabolic_eye', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(347, 'nightingale', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(348, 'troubadour', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(349, 'killer_instinct', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(350, 'stealth_shot', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(351, 'flashy_shot', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(352, 'sange', 32, 73, 0, 0, 0, 0, 0, 0, 0),
	(353, 'hasso', 41, 353, 0, 0, 0, 0, 0, 0, 0),
	(354, 'seigan', 41, 353, 0, 0, 0, 0, 0, 0, 0),
	(355, 'convergence', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(356, 'diffusion', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(357, 'snake_eye', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(358, 'light_arts', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(359, 'dark_arts', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(360, 'penury', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(361, 'parsimony', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(362, 'celerity', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(363, 'alacrity', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(364, 'rapture', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(365, 'ebullience', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(366, 'accession', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(367, 'manifestation', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(368, 'drain_samba', 40, 368, 0, 0, 0, 0, 0, 0, 0),
	(369, 'aspir_samba', 40, 368, 0, 0, 0, 0, 0, 0, 0),
	(370, 'haste_samba', 40, 368, 0, 0, 0, 0, 0, 0, 0),
	(371, 'velocity_shot', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(375, 'building_flourish', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(376, 'trance', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(377, 'tabula_rasa', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(378, 'drain_daze', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(379, 'aspir_daze', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(380, 'haste_daze', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(381, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(382, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(383, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(384, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(385, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(386, 'lethargic_daze_1', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(387, 'lethargic_daze_2', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(388, 'lethargic_daze_3', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(389, 'lethargic_daze_4', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(390, 'lethargic_daze_5', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(391, 'sluggish_daze_1', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(392, 'sluggish_daze_2', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(393, 'sluggish_daze_3', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(394, 'sluggish_daze_4', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(395, 'sluggish_daze_5', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(396, 'weakened_daze_1', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(397, 'weakened_daze_2', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(398, 'weakened_daze_3', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(399, 'weakened_daze_4', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(400, 'weakened_daze_5', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(401, 'addendum_white', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(402, 'addendum_black', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(403, 'reprisal', 33, 34, 0, 0, 0, 0, 0, 0, 0),
	(404, 'magic_evasion_down', 8405026, 0, 0, 0, 0, 0, 0, 0, 0),
	(405, 'retaliation', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(406, 'footwork', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(407, 'klimaform', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(408, 'sekkanoki', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(409, 'pianissimo', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(410, 'saber_dance', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(411, 'fan_dance', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(412, 'altruism', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(413, 'focalization', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(414, 'tranquility', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(415, 'equanimity', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(416, 'enlightenment', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(417, 'afflatus_solace', 289, 0, 0, 0, 0, 0, 0, 0, 0),
	(418, 'afflatus_misery', 289, 0, 0, 0, 0, 0, 0, 0, 0),
	(419, 'composure', 289, 0, 0, 0, 0, 0, 0, 0, 0),
	(420, 'yonin', 289, 420, 0, 0, 0, 0, 0, 0, 0),
	(421, 'innin', 289, 420, 0, 0, 0, 0, 0, 0, 0),
	(422, 'carbuncles_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(423, 'ifrits_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(424, 'shivas_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(425, 'garudas_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(426, 'titans_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(427, 'ramuhs_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(428, 'leviathans_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(429, 'fenrirs_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(430, 'diaboloss_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(431, 'avatars_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(432, 'multi_strikes', 4194592, 0, 0, 0, 0, 0, 0, 0, 0),
	(433, 'double_shot', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(434, 'transcendency', 256, 0, 0, 0, 0, 0, 0, 0, 0),
	(435, 'restraint', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(436, 'perfect_counter', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(437, 'mana_wall', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(438, 'divine_emblem', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(439, 'nether_void', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(440, 'sengikori', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(441, 'futae', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(442, 'presto', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(443, 'climactic_flourish', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(444, 'copy_image', 32, 36, 0, 0, 0, 0, 0, 0, 0),
	(445, 'copy_image', 32, 36, 0, 0, 0, 0, 0, 0, 0),
	(446, 'copy_image', 32, 36, 0, 0, 0, 0, 0, 0, 0),
	(447, 'multi_shots', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(448, 'bewildered_daze_1', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(449, 'bewildered_daze_2', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(450, 'bewildered_daze_3', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(451, 'bewildered_daze_4', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(452, 'bewildered_daze_5', 8388640, 0, 0, 0, 0, 0, 0, 0, 0),
	(453, 'divine_caress', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(454, 'saboteur', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(455, 'tenuto', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(456, 'spur', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(457, 'efflux', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(458, 'earthen_armor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(459, 'divine_caress', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(460, 'blood_rage', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(461, 'impetus', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(462, 'conspirator', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(463, 'sepulcher', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(464, 'arcane_crest', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(465, 'hamanoha', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(466, 'dragon_breaker', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(467, 'triple_shot', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(468, 'striking_flourish', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(469, 'perpetuance', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(470, 'immanence', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(471, 'migawari', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(472, 'ternary_flourish', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(473, 'muddle', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(474, 'prowess', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(475, 'voidwatcher', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(476, 'ensphere', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(477, 'sacrosanctity', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(478, 'palisade', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(479, 'scarlet_delirium', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(480, 'scarlet_delirium', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(482, 'decoy_shot', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(483, 'hagakure', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(484, 'issekigan', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(485, 'unbridled_learning', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(486, 'counter_boost', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(487, 'endrain', 32, 94, 0, 4, 0, 0, 0, 0, 0),
	(488, 'enaspir', 32, 94, 0, 4, 0, 0, 0, 0, 0),
	(489, 'afterglow', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(490, 'brazen_rush', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(491, 'inner_strength', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(492, 'asylum', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(493, 'subtle_sorcery', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(494, 'stymie', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(496, 'intervene', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(497, 'soul_enslavement', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(498, 'unleash', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(499, 'clarion_call', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(500, 'overkill', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(501, 'yaegasumi', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(502, 'mikage', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(503, 'fly_high', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(504, 'astral_conduit', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(505, 'unbridled_wisdom', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(507, 'grand_pas', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(508, 'widened_compass', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(509, 'odyllic_subterfuge', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(510, 'ergon_might', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(511, 'reive_mark', 524320, 0, 0, 0, 0, 0, 0, 0, 0),
	(512, 'ionis', 16777216, 0, 0, 0, 0, 0, 0, 0, 0),
	(513, 'bolster', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(515, 'lasting_emanation', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(516, 'ecliptic_attrition', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(517, 'collimated_fervor', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(518, 'dematerialize', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(519, 'theurgic_focus', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(522, 'elemental_sforzo', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(523, 'ignis', 4194336, 0, 0, 4, 0, 0, 0, 0, 0),
	(524, 'gelus', 4194336, 0, 0, 4, 0, 0, 0, 0, 0),
	(525, 'flabra', 4194336, 0, 0, 4, 0, 0, 0, 0, 0),
	(526, 'tellus', 4194336, 0, 0, 4, 0, 0, 0, 0, 0),
	(527, 'sulpor', 4194336, 0, 0, 4, 0, 0, 0, 0, 0),
	(528, 'unda', 4194336, 0, 0, 4, 0, 0, 0, 0, 0),
	(529, 'lux', 4194336, 0, 0, 4, 0, 0, 0, 0, 0),
	(530, 'tenebrae', 4194336, 0, 0, 4, 0, 0, 0, 0, 0),
	(531, 'vallation', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(532, 'swordplay', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(533, 'pflug', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(534, 'emboldened', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(535, 'valiance', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(536, 'gambit', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(537, 'liement', 4194336, 0, 0, 535, 531, 531, 0, 0, 0),
	(538, 'one_for_all', 4194336, 0, 0, 0, 0, 0, 0, 0, 0),
	(539, 'geo_regen', 8388640, 0, 0, 0, 0, 0, 7, 0, 0),
	(540, 'geo_poison', 8388640, 0, 0, 0, 0, 0, 3, 0, 0),
	(541, 'geo_refresh', 8388640, 0, 0, 0, 0, 0, 7, 0, 0),
	(542, 'geo_str_boost', 8388640, 0, 0, 0, 0, 0, 1, 0, 0),
	(543, 'geo_dex_boost', 8388640, 0, 0, 0, 0, 0, 6, 0, 0),
	(544, 'geo_vit_boost', 8388640, 0, 0, 0, 0, 0, 2, 0, 0),
	(545, 'geo_agi_boost', 8388640, 0, 0, 0, 0, 0, 4, 0, 0),
	(546, 'geo_int_boost', 8388640, 0, 0, 0, 0, 0, 5, 0, 0),
	(547, 'geo_mnd_boost', 8388640, 0, 0, 0, 0, 0, 3, 0, 0),
	(548, 'geo_chr_boost', 8388640, 0, 0, 0, 0, 0, 7, 0, 0),
	(549, 'geo_attack_boost', 8388640, 0, 0, 0, 0, 0, 1, 0, 0),
	(550, 'geo_defense_boost', 8388640, 0, 0, 0, 0, 0, 2, 0, 0),
	(551, 'geo_magic_atk_boost', 8388640, 0, 0, 0, 0, 0, 5, 0, 0),
	(552, 'geo_magic_def_boost', 8388640, 0, 0, 0, 0, 0, 3, 0, 0),
	(553, 'geo_accuracy_boost', 8388640, 0, 0, 0, 0, 0, 6, 0, 0),
	(554, 'geo_evasion_boost', 8388640, 0, 0, 0, 0, 0, 4, 0, 0),
	(555, 'geo_magic_acc_boost', 8388640, 0, 0, 0, 0, 0, 8, 0, 0),
	(556, 'geo_magic_evasion_boost', 8388640, 0, 0, 0, 0, 0, 7, 0, 0),
	(557, 'geo_attack_down', 8388640, 0, 0, 0, 0, 0, 3, 0, 0),
	(558, 'geo_defense_down', 8388640, 0, 0, 0, 0, 0, 4, 0, 0),
	(559, 'geo_magic_atk_down', 8388640, 0, 0, 0, 0, 0, 1, 0, 0),
	(560, 'geo_magic_def_down', 8388640, 0, 0, 0, 0, 0, 6, 0, 0),
	(561, 'geo_accuracy_down', 8388640, 0, 0, 0, 0, 0, 2, 0, 0),
	(562, 'geo_evasion_down', 8388640, 0, 0, 0, 0, 0, 5, 0, 0),
	(563, 'geo_magic_acc_down', 8388640, 0, 0, 0, 0, 0, 7, 0, 0),
	(564, 'geo_magic_evasion_down', 8388640, 0, 0, 0, 0, 0, 8, 0, 0),
	(565, 'geo_slow', 8388640, 0, 0, 0, 0, 0, 2, 0, 0),
	(566, 'geo_paralysis', 8388640, 0, 0, 0, 0, 0, 5, 0, 0),
	(567, 'geo_weight', 8388640, 0, 0, 0, 0, 0, 4, 0, 0),
	(568, 'foil', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(569, 'blaze_of_glory', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(570, 'battuta', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(571, 'rayke', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(572, 'avoidance_down', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(573, 'deluge_spikes', 41, 0, 0, 0, 0, 0, 3, 0, 0),
	(574, 'fast_cast', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(575, 'gestation', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(576, 'doubt', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(577, 'cait_siths_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(578, 'fishy_intuition', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(579, 'commitment', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(580, 'geo_haste', 8388640, 0, 0, 0, 0, 0, 4, 0, 0),
	(581, 'flurry_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(583, 'apogee', 2097185, 0, 0, 0, 0, 0, 0, 0, 0),
	(584, 'entrust', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(585, 'costume', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(586, 'curing_conduit', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(587, 'tp_bonus', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(588, 'finishing_move', 288, 0, 0, 0, 0, 0, 0, 0, 0),
	(589, 'firestorm_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(590, 'hailstorm_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(591, 'windstorm_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(592, 'sandstorm_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(593, 'thunderstorm_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(594, 'rainstorm_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(595, 'aurorastorm_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(596, 'voidstorm_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(597, 'inundation', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(598, 'cascade', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(599, 'consume_mana', 33, 0, 0, 0, 0, 0, 0, 0, 0),
	(600, 'runeists_roll', 131368, 0, 0, 0, 0, 0, 0, 0, 0),
	(601, 'crooked_cards', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(602, 'vorseal', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(603, 'elvorseal', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(604, 'mighty_guard', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(605, 'gale_spikes', 41, 34, 0, 0, 0, 0, 4, 0, 800),
	(606, 'clod_spikes', 41, 34, 0, 0, 0, 0, 2, 0, 800),
	(607, 'glint_spikes', 41, 34, 0, 0, 0, 0, 7, 0, 800),
	(608, 'negate_virus', 289, 0, 0, 0, 0, 0, 0, 0, 0),
	(609, 'negate_curse', 289, 0, 0, 0, 0, 0, 0, 0, 0),
	(610, 'negate_charm', 289, 0, 0, 0, 0, 0, 0, 0, 0),
	(611, 'magic_evasion_boost_ii', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(612, 'colure_active', 9437440, 0, 0, 3, 0, 0, 0, 0, 0),
	(623, 'rampart', 5243168, 0, 0, 0, 0, 0, 0, 0, 0),
	(768, 'abyssea_str', 256, 0, 0, 0, 0, 0, 1, 0, 52),
	(769, 'abyssea_dex', 256, 0, 0, 0, 0, 0, 6, 0, 53),
	(770, 'abyssea_vit', 256, 0, 0, 0, 0, 0, 2, 0, 54),
	(771, 'abyssea_agi', 256, 0, 0, 0, 0, 0, 4, 0, 55),
	(772, 'abyssea_int', 256, 0, 0, 0, 0, 0, 5, 0, 56),
	(773, 'abyssea_mnd', 256, 0, 0, 0, 0, 0, 3, 0, 57),
	(774, 'abyssea_chr', 256, 0, 0, 0, 0, 0, 7, 0, 58),
	(775, 'abyssea_hp', 256, 0, 0, 0, 0, 0, 7, 0, 50),
	(776, 'abyssea_mp', 256, 0, 0, 0, 0, 0, 8, 0, 51),
	(777, 'prowess_casket_rate', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(778, 'prowess_skill_rate', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(779, 'prowess_crystal_yeild', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(780, 'prowess_th', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(781, 'prowess_attack_speed', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(782, 'prowess_hp_mp', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(783, 'prowess_acc_racc', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(784, 'prowess_att_ratt', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(785, 'prowess_macc_matk', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(786, 'prowess_cure_potency', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(787, 'prowess_ws_dmg', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(788, 'prowess_killer', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(789, 'field_support_food', 8421408, 0, 0, 2, 0, 0, 0, 0, 0),
	(790, 'mark_of_seed', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(791, 'all_miss', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(792, 'super_buff', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(793, 'ninjutsu_ele_debuff', 544, 0, 0, 0, 0, 0, 0, 0, 0),
	(794, 'healing', 1048948, 0, 0, 0, 0, 0, 0, 0, 0),
	(795, 'leavegame', 1048948, 0, 0, 0, 0, 0, 0, 0, 0),
	(796, 'haste_samba_haste_effect', 320, 0, 0, 0, 0, 0, 0, 0, 0),
	(797, 'teleport', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(798, 'chainbound', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(799, 'skillchain', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(800, 'dynamis', 33554432, 0, 0, 0, 0, 0, 0, 0, 0),
	(801, 'meditate', 32, 0, 0, 0, 0, 0, 7, 0, 0),
	(802, 'elemental_resistance_down', 8389408, 0, 0, 0, 0, 0, 0, 0, 0),
	(621, 'majesty', 289, 0, 0, 0, 0, 0, 0, 0, 0),
	(495, 'run_wild', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(506, 'bounty_shot', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(803, 'full_speed_ahead', 768, 0, 0, 0, 0, 0, 0, 0, 0),
	(625, 'sirens_favor', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(626, 'negate_sleep', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(627, 'mobilization', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(628, 'zealous_snort', 32, 0, 0, 0, 0, 0, 0, 0, 0),
	(629, 'familiar', 32, 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `status_effects` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
