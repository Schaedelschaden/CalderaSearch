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

-- Dumping structure for table tpzdb.blue_spell_list
CREATE TABLE IF NOT EXISTS `blue_spell_list` (
  `spellid` smallint(3) NOT NULL,
  `mob_skill_id` smallint(4) unsigned NOT NULL,
  `set_points` smallint(2) NOT NULL,
  `trait_category` smallint(2) NOT NULL,
  `trait_category_weight` smallint(2) NOT NULL,
  `primary_sc` smallint(2) NOT NULL,
  `secondary_sc` smallint(2) NOT NULL,
  PRIMARY KEY (`spellid`,`mob_skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.blue_spell_list: 195 rows
/*!40000 ALTER TABLE `blue_spell_list` DISABLE KEYS */;
INSERT INTO `blue_spell_list` (`spellid`, `mob_skill_id`, `set_points`, `trait_category`, `trait_category_weight`, `primary_sc`, `secondary_sc`) VALUES
	(513, 1572, 3, 4, 4, 5, 0),
	(515, 462, 5, 4, 4, 5, 0),
	(517, 448, 1, 10, 4, 0, 0),
	(519, 452, 3, 18, 4, 1, 4),
	(521, 421, 4, 0, 1, 2, 0),
	(522, 437, 2, 0, 1, 2, 0),
	(524, 426, 2, 0, 1, 4, 0),
	(527, 513, 3, 7, 4, 6, 0),
	(529, 683, 2, 7, 4, 3, 0),
	(530, 569, 4, 0, 1, 0, 0),
	(531, 676, 3, 13, 4, 7, 0),
	(532, 535, 4, 0, 1, 8, 0),
	(533, 511, 3, 14, 2, 3, 0),
	(534, 523, 4, 10, 4, 6, 0),
	(535, 1646, 1, 14, 1, 7, 0),
	(536, 466, 1, 4, 4, 5, 0),
	(537, 489, 2, 14, 1, 6, 0),
	(538, 530, 4, 6, 4, 0, 0),
	(539, 475, 3, 11, 4, 2, 5),
	(540, 1778, 4, 8, 4, 4, 6),
	(541, 485, 2, 0, 1, 2, 0),
	(542, 433, 2, 0, 1, 2, 0),
	(543, 279, 2, 12, 4, 7, 0),
	(544, 659, 2, 6, 4, 5, 0),
	(545, 810, 4, 20, 4, 2, 0),
	(547, 346, 1, 0, 1, 0, 0),
	(548, 364, 3, 4, 4, 4, 0),
	(549, 335, 1, 5, 4, 0, 0),
	(551, 338, 1, 12, 4, 5, 0),
	(554, 353, 5, 8, 4, 2, 5),
	(555, 791, 3, 13, 4, 4, 0),
	(557, 549, 4, 6, 4, 2, 0),
	(560, 1711, 3, 16, 4, 7, 0),
	(561, 501, 3, 14, 2, 6, 0),
	(563, 560, 3, 10, 4, 6, 0),
	(564, 645, 4, 15, 4, 8, 0),
	(565, 821, 4, 0, 1, 1, 0),
	(567, 622, 2, 0, 1, 1, 0),
	(569, 395, 4, 9, 4, 8, 0),
	(570, 394, 2, 0, 1, 2, 0),
	(572, 410, 1, 6, 4, 3, 0),
	(573, 1701, 3, 4, 4, 6, 0),
	(574, 402, 2, 19, 4, 0, 0),
	(575, 2828, 4, 0, 1, 2, 0),
	(576, 1713, 3, 5, 4, 1, 0),
	(577, 257, 2, 3, 4, 6, 0),
	(578, 323, 3, 5, 4, 0, 0),
	(579, 1707, 4, 14, 3, 6, 0),
	(581, 287, 4, 2, 4, 0, 0),
	(582, 653, 2, 17, 4, 6, 0),
	(584, 264, 2, 2, 4, 1, 0),
	(585, 266, 4, 3, 4, 12, 0),
	(587, 273, 2, 3, 4, 4, 0),
	(588, 497, 2, 4, 4, 3, 0),
	(589, 255, 5, 16, 4, 1, 8),
	(591, 800, 4, 6, 4, 3, 0),
	(592, 292, 2, 0, 1, 1, 0),
	(593, 295, 3, 5, 4, 0, 0),
	(594, 584, 3, 8, 4, 3, 8),
	(595, 322, 5, 1, 4, 1, 0),
	(596, 329, 2, 0, 1, 3, 0),
	(597, 687, 2, 1, 4, 5, 0),
	(598, 434, 4, 4, 4, 2, 0),
	(599, 310, 2, 0, 1, 2, 0),
	(603, 302, 3, 1, 4, 1, 0),
	(604, 319, 5, 22, 4, 4, 0),
	(605, 516, 3, 0, 1, 2, 0),
	(606, 386, 2, 4, 4, 5, 0),
	(608, 377, 3, 17, 4, 7, 0),
	(610, 372, 4, 0, 1, 7, 0),
	(611, 1384, 5, 16, 4, 10, 0),
	(612, 1441, 4, 14, 4, 1, 0),
	(613, 1463, 5, 6, 4, 0, 0),
	(614, 1352, 3, 11, 4, 0, 0),
	(615, 1358, 5, 14, 4, 0, 0),
	(616, 1366, 5, 8, 4, 8, 0),
	(617, 1447, 3, 11, 4, 9, 0),
	(618, 638, 2, 0, 1, 3, 0),
	(620, 609, 3, 8, 4, 8, 0),
	(621, 1727, 2, 4, 4, 2, 0),
	(622, 665, 2, 11, 4, 7, 0),
	(623, 612, 3, 0, 1, 8, 0),
	(626, 591, 3, 0, 1, 3, 0),
	(628, 1081, 3, 15, 4, 8, 0),
	(629, 360, 3, 15, 4, 6, 0),
	(631, 777, 3, 9, 4, 5, 0),
	(632, 1744, 3, 0, 1, 0, 0),
	(633, 1745, 5, 21, 4, 2, 0),
	(634, 785, 5, 14, 2, 1, 0),
	(636, 1734, 4, 4, 4, 0, 0),
	(637, 1733, 5, 17, 4, 3, 0),
	(638, 617, 3, 9, 4, 1, 0),
	(640, 1771, 4, 20, 4, 5, 0),
	(641, 1753, 5, 18, 4, 6, 0),
	(642, 1821, 3, 0, 1, 0, 0),
	(643, 1818, 3, 0, 1, 11, 0),
	(644, 1963, 4, 4, 4, 8, 0),
	(645, 1955, 4, 5, 4, 0, 0),
	(646, 1958, 4, 6, 4, 1, 0),
	(647, 1722, 2, 17, 4, 0, 0),
	(648, 2153, 1, 19, 4, 5, 0),
	(650, 2163, 2, 1, 4, 7, 6),
	(651, 2185, 4, 4, 4, 5, 0),
	(652, 2181, 3, 12, 4, 1, 0),
	(653, 2176, 2, 21, 4, 3, 8),
	(654, 2436, 4, 22, 4, 12, 0),
	(655, 2423, 3, 0, 1, 0, 0),
	(656, 2562, 3, 24, 4, 5, 0),
	(657, 2564, 3, 25, 4, 3, 0),
	(658, 2173, 4, 0, 0, 0, 0),
	(701, 2950, 6, 18, 8, 6, 0),
	(659, 2101, 4, 24, 4, 5, 0),
	(660, 2161, 3, 27, 6, 4, 0),
	(661, 1782, 5, 25, 4, 0, 0),
	(662, 525, 3, 0, 1, 0, 0),
	(663, 331, 4, 27, 6, 6, 0),
	(664, 461, 2, 0, 1, 0, 0),
	(665, 336, 1, 26, 4, 11, 0),
	(666, 590, 3, 23, 6, 11, 8),
	(667, 388, 2, 16, 4, 4, 0),
	(668, 555, 3, 10, 4, 0, 0),
	(669, 514, 2, 26, 4, 4, 6),
	(670, 2629, 4, 23, 6, 9, 8),
	(671, 1220, 4, 22, 4, 6, 0),
	(672, 2631, 5, 13, 4, 2, 0),
	(673, 741, 4, 25, 4, 10, 4),
	(674, 580, 1, 20, 4, 0, 0),
	(675, 1817, 3, 8, 4, 3, 0),
	(677, 1230, 3, 24, 4, 2, 4),
	(678, 301, 3, 6, 4, 2, 0),
	(679, 1255, 3, 18, 4, 0, 0),
	(680, 483, 4, 28, 6, 8, 0),
	(681, 1245, 5, 14, 4, 0, 0),
	(682, 2154, 2, 25, 4, 2, 6),
	(683, 920, 4, 28, 6, 2, 0),
	(684, 2431, 4, 27, 6, 6, 0),
	(685, 1703, 3, 15, 4, 0, 0),
	(686, 502, 4, 25, 4, 0, 0),
	(687, 1959, 2, 17, 4, 5, 0),
	(688, 675, 2, 24, 4, 12, 1),
	(689, 2421, 3, 21, 4, 2, 0),
	(690, 1724, 5, 2, 4, 0, 0),
	(692, 2178, 4, 20, 4, 6, 0),
	(693, 1149, 5, 23, 6, 3, 4),
	(694, 1354, 3, 10, 4, 5, 0),
	(695, 820, 4, 15, 4, 8, 0),
	(696, 2201, 5, 21, 4, 0, 0),
	(697, 1824, 4, 28, 6, 9, 1),
	(698, 644, 2, 22, 4, 6, 0),
	(699, 253, 2, 25, 4, 10, 3),
	(736, 629, 0, 0, 0, 8, 0),
	(737, 807, 0, 0, 0, 0, 0),
	(738, 1305, 0, 0, 0, 0, 0),
	(739, 1790, 0, 0, 0, 3, 0),
	(740, 2024, 0, 0, 0, 13, 12),
	(741, 1831, 0, 0, 0, 0, 0),
	(742, 2118, 0, 0, 0, 14, 9),
	(743, 2106, 0, 0, 0, 14, 10),
	(744, 3005, 0, 0, 0, 6, 0),
	(745, 3014, 0, 0, 0, 0, 0),
	(746, 3020, 0, 0, 0, 2, 0),
	(700, 2945, 6, 16, 8, 0, 0),
	(702, 2958, 6, 13, 8, 5, 0),
	(703, 2967, 6, 8, 8, 4, 0),
	(704, 2970, 6, 23, 8, 9, 0),
	(705, 2974, 4, 29, 8, 5, 0),
	(706, 2988, 2, 15, 4, 12, 0),
	(707, 3030, 4, 17, 8, 1, 0),
	(708, 2930, 6, 6, 8, 6, 0),
	(710, 1952, 6, 22, 8, 0, 0),
	(711, 2041, 7, 15, 8, 0, 0),
	(712, 2040, 6, 27, 8, 1, 0),
	(713, 2054, 6, 20, 8, 1, 0),
	(714, 2073, 6, 30, 8, 9, 5),
	(715, 3063, 6, 25, 8, 6, 0),
	(716, 3099, 6, 1, 8, 5, 0),
	(717, 3131, 6, 3, 8, 9, 10),
	(718, 3221, 6, 11, 8, 2, 0),
	(719, 2735, 8, 8, 8, 3, 0),
	(720, 2737, 8, 6, 8, 7, 0),
	(721, 2739, 8, 16, 8, 8, 0),
	(722, 2741, 8, 11, 8, 4, 0),
	(723, 2991, 7, 31, 8, 11, 12),
	(724, 3153, 7, 0, 8, 2, 0),
	(725, 2736, 8, 0, 8, 1, 0),
	(726, 2738, 8, 13, 8, 5, 0),
	(727, 2740, 8, 18, 8, 6, 0),
	(728, 2742, 8, 0, 8, 2, 0),
	(747, 3059, 0, 0, 0, 1, 0),
	(748, 3073, 0, 0, 0, 8, 0),
	(749, 3137, 0, 0, 0, 7, 0),
	(750, 2667, 0, 0, 0, 0, 0),
	(751, 3304, 0, 0, 0, 0, 0),
	(752, 3372, 0, 0, 0, 5, 0),
	(753, 3363, 0, 0, 0, 6, 0);
/*!40000 ALTER TABLE `blue_spell_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
