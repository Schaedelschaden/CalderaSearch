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

-- Dumping structure for table tpzdb.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `login` varchar(16) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `current_email` varchar(64) NOT NULL DEFAULT '',
  `registration_email` varchar(64) NOT NULL DEFAULT '',
  `timecreate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timelastmodify` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content_ids` tinyint(2) unsigned NOT NULL DEFAULT 16,
  `expansions` smallint(4) unsigned NOT NULL DEFAULT 4094,
  `features` tinyint(2) unsigned NOT NULL DEFAULT 13,
  `status` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `priv` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table tpzdb.accounts: 79 rows
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `login`, `password`, `current_email`, `registration_email`, `timecreate`, `timelastmodify`, `content_ids`, `expansions`, `features`, `status`, `priv`) VALUES
	(1000, 'Schaedelschaden', '*FFC45A45BF9A99F9E0A7E1B85914DB561E2345A6', '', '', '2020-07-04 11:18:16', '2021-03-17 15:52:32', 16, 4094, 13, 1, 1),
	(1001, 'Schaedelschaden1', '*FFC45A45BF9A99F9E0A7E1B85914DB561E2345A6', '', '', '2020-07-18 21:15:11', '2021-03-19 08:06:07', 16, 4094, 13, 1, 1),
	(1002, 'Schaedelschaden2', '*FFC45A45BF9A99F9E0A7E1B85914DB561E2345A6', '', '', '2020-07-18 22:09:27', '2021-03-16 12:16:29', 16, 4094, 13, 1, 1),
	(1003, 'Schaedelschaden3', '*FFC45A45BF9A99F9E0A7E1B85914DB561E2345A6', '', '', '2020-08-20 23:55:24', '2021-02-04 20:51:48', 16, 4094, 13, 1, 1),
	(1004, 'ryuyata', '*2688FB292881661E1F47814A5BA936CEFBA399E2', '', '', '2020-09-02 14:46:59', '2020-09-20 18:57:56', 16, 4094, 13, 1, 1),
	(1005, 'fujin', '*2E5412778993AD420B04A54EBA564B9E92D9B3D2', '', '', '2020-09-02 14:59:57', '2021-03-18 15:41:14', 16, 4094, 13, 1, 1),
	(1006, 'anemone', '*2E5412778993AD420B04A54EBA564B9E92D9B3D2', '', '', '2020-09-02 15:01:41', '2021-03-10 16:54:11', 16, 4094, 13, 1, 1),
	(1007, 'cyjay', '*F79A21D36704627035F3ED5379CEF0909623BFB9', '', '', '2020-09-02 15:13:55', '2021-03-04 13:40:28', 16, 4094, 13, 1, 1),
	(1008, 'hype', '*2E5412778993AD420B04A54EBA564B9E92D9B3D2', '', '', '2020-09-02 15:23:44', '2021-02-06 23:08:42', 16, 4094, 13, 1, 1),
	(1009, 'jirenyata', '*2688FB292881661E1F47814A5BA936CEFBA399E2', '', '', '2020-09-02 15:29:10', '2020-09-20 19:01:48', 16, 4094, 13, 1, 1),
	(1010, 'Hexa', '*1CF60959ED10072089ADD68C26A81A9DE3592A35', '', '', '2020-09-02 16:40:59', '2021-03-13 12:52:32', 16, 4094, 13, 1, 1),
	(1011, 'Mcollazo81', '*E4EE4B526D608DE4FB70690107F751F580EF8B72', '', '', '2020-09-02 16:45:48', '2021-03-14 19:50:36', 16, 4094, 13, 1, 1),
	(1012, 'lowexpectations', '*89536CC5F2288109691C4EC0A04204F536F346C3', '', '', '2020-09-02 18:27:14', '2020-09-06 18:23:55', 16, 4094, 13, 1, 1),
	(1013, 'cyanide', '*3F302BBE16C676EA5920BCFBC3CF2FFB2E44E5F4', '', '', '2020-09-03 13:21:39', '2021-02-23 01:32:56', 16, 4094, 13, 1, 1),
	(1014, 'Kazatar', '*20396E6AE598E7CF044CB5206CE884DB9E7DFC23', '', '', '2020-09-03 15:19:31', '2021-02-23 17:55:56', 16, 4094, 13, 1, 1),
	(1015, 'Mik', '*35EAEFA6F7EFF6CB20EB5D9AF0641EC68A7CC124', '', '', '2020-09-03 16:30:30', '2021-03-16 16:06:04', 16, 4094, 13, 1, 1),
	(1016, 'Wildella', '*0F88422E4D72AB8E66FAE35CBBBB11497239ECCB', '', '', '2020-09-04 13:26:36', '2020-10-29 17:06:17', 16, 4094, 13, 1, 1),
	(1017, 'KOtheki000!', '*16863C23B2E91537AEAEDDE9D1B40DA2A975C5DC', '', '', '2020-09-05 16:25:51', '2020-09-15 23:01:34', 16, 4094, 13, 1, 1),
	(1018, 'Klutix', '*7354F634AED2986B52E02E969BF219590BCC8AD3', '', '', '2020-09-05 16:26:53', '2020-09-19 11:14:14', 16, 4094, 13, 1, 1),
	(1019, 'oka', '*7D9BF2600CD78C1DA01CE2C1FCC2E20E873BBD64', '', '', '2020-09-06 18:16:10', '2020-09-06 18:51:56', 16, 4094, 13, 1, 1),
	(1020, 'cyanide3', '*3F302BBE16C676EA5920BCFBC3CF2FFB2E44E5F4', '', '', '2020-09-08 01:20:49', '2020-09-08 01:20:50', 16, 4094, 13, 1, 1),
	(1021, 'Kiplz', '*35EAEFA6F7EFF6CB20EB5D9AF0641EC68A7CC124', '', '', '2020-09-09 15:15:27', '2021-01-23 16:18:20', 16, 4094, 13, 1, 1),
	(1022, 'Pheliont', '*81AA7616AEF1F3908B19B39B77D217ABFCA59244', '', '', '2020-09-11 19:59:41', '2020-09-11 20:57:04', 16, 4094, 13, 1, 1),
	(1023, 'Phelheal', '*81AA7616AEF1F3908B19B39B77D217ABFCA59244', '', '', '2020-09-11 20:02:31', '2020-09-11 21:02:57', 16, 4094, 13, 1, 1),
	(1024, 'Hotaru', '*FE4C3B8704D27B6E48A8123A5E274733E7F643A6', '', '', '2020-09-12 19:36:11', '2021-02-22 12:01:25', 16, 4094, 13, 1, 1),
	(1025, 'raijin', '*2E5412778993AD420B04A54EBA564B9E92D9B3D2', '', '', '2020-09-13 16:58:36', '2021-02-15 16:37:23', 16, 4094, 13, 1, 1),
	(1026, 'ftest', '*2E5412778993AD420B04A54EBA564B9E92D9B3D2', '', '', '2020-09-14 02:19:56', '2020-09-14 02:19:56', 16, 4094, 13, 1, 1),
	(1027, 'test', '*2E5412778993AD420B04A54EBA564B9E92D9B3D2', '', '', '2020-09-15 01:47:12', '2021-03-14 22:07:12', 16, 4094, 13, 1, 1),
	(1029, 'Skeletor', '*BE5758E998078A309D99BFF291E6069A9E5B211B', '', '', '2020-11-03 20:27:41', '2020-11-08 20:08:06', 16, 4094, 13, 1, 1),
	(1030, 'Cleavage', '*BE5758E998078A309D99BFF291E6069A9E5B211B', '', '', '2020-11-03 20:41:45', '2020-11-03 20:41:55', 16, 4094, 13, 1, 1),
	(1031, 'Haste', '*BE5758E998078A309D99BFF291E6069A9E5B211B', '', '', '2020-11-03 20:46:44', '2020-11-03 20:46:55', 16, 4094, 13, 1, 1),
	(1032, 'Archmage', '*BE5758E998078A309D99BFF291E6069A9E5B211B', '', '', '2020-11-03 20:52:13', '2020-11-03 20:52:21', 16, 4094, 13, 1, 1),
	(1033, 'Avarice', '*BE5758E998078A309D99BFF291E6069A9E5B211B', '', '', '2020-11-03 20:56:17', '2020-11-03 20:56:24', 16, 4094, 13, 1, 1),
	(1034, 'Explosion', '*BE5758E998078A309D99BFF291E6069A9E5B211B', '', '', '2020-11-03 21:00:09', '2020-11-03 21:00:16', 16, 4094, 13, 1, 1),
	(1035, 'Magicae', '*C539A42D22A7EAEE267B37C3A6AB57F1774551E3', '', '', '2020-11-06 20:41:31', '2020-11-06 20:42:30', 16, 4094, 13, 1, 1),
	(1036, 'Noah', '*7418A3F39AC99DA72DC85107D9FC7DFE65AA125F', '', '', '2020-11-07 13:30:16', '2020-11-07 13:30:57', 16, 4094, 13, 1, 1),
	(1037, 'Testes', '*FFC45A45BF9A99F9E0A7E1B85914DB561E2345A6', '', '', '2020-11-17 23:16:46', '2020-11-17 23:16:46', 16, 4094, 13, 1, 1),
	(1038, 'Dragoe', '*00A51F3F48415C7D4E8908980D443C29C69B60C9', '', '', '2020-11-18 19:22:18', '2021-02-18 19:29:56', 16, 4094, 13, 1, 1),
	(1039, 'yuki', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '', '', '2020-11-18 19:25:18', '2020-12-30 14:33:41', 16, 4094, 13, 1, 1),
	(1040, 'zillion', '*9C85DC096ADCE0AA6AB5D0ACF42F9BEFF797B9DA', '', '', '2020-11-22 04:25:28', '2021-03-18 17:17:42', 16, 4094, 13, 1, 1),
	(1041, 'grethion', '*A33D8B4361936EBE169CF3B292D08A3845F284B2', '', '', '2020-11-28 13:25:29', '2020-12-12 18:34:55', 16, 4094, 13, 1, 1),
	(1042, 'Baucant', '*BB850F9B504C56F339381F952A80DAE3A8177AA2', '', '', '2020-12-12 12:14:12', '2020-12-17 14:17:09', 16, 4094, 13, 1, 1),
	(1043, 'disstooeasy', '*D65158558EDC87BC280BD6A896DDA931D7E9F170', '', '', '2020-12-17 17:08:09', '2021-01-20 14:27:04', 16, 4094, 13, 1, 1),
	(1044, 'johnny', '*D65158558EDC87BC280BD6A896DDA931D7E9F170', '', '', '2020-12-19 19:07:21', '2021-01-20 13:14:52', 16, 4094, 13, 1, 1),
	(1045, 'Fanelia', '*3407BE456D594EA4A4C3656B33A9D6C03C7CC01B', '', '', '2020-12-29 21:32:03', '2020-12-29 21:32:03', 16, 4094, 13, 1, 1),
	(1046, 'djmanofsteel', '*5D78F073992417EA2D61FB6777B178AA392A1934', '', '', '2021-01-11 07:11:26', '2021-01-11 07:15:06', 16, 4094, 13, 1, 1),
	(1047, 'hachi', '*2E5412778993AD420B04A54EBA564B9E92D9B3D2', '', '', '2021-01-12 20:30:49', '2021-01-12 20:30:49', 16, 4094, 13, 1, 1),
	(1048, 'Cyruktion', '*13F77C18DADCEC39C07DE6E8091117A43927FF63', '', '', '2021-01-13 10:06:10', '2021-01-13 10:06:10', 16, 4094, 13, 1, 1),
	(1049, 'Saberl', '*629DE3E842F06543F4D02DFB0487DB1980A14301', '', '', '2021-01-17 01:50:57', '2021-03-15 18:13:03', 16, 4094, 13, 1, 1),
	(1050, 'Pumpkin', '', '', '', '2021-01-17 19:57:56', '2021-01-17 19:57:56', 16, 4094, 13, 1, 1),
	(1051, 'Goodkitty', '*629DE3E842F06543F4D02DFB0487DB1980A14301', '', '', '2021-01-17 19:58:12', '2021-03-15 10:29:11', 16, 4094, 13, 1, 1),
	(1052, 'Tierkain', '*59BD66ED54685C33F65CB7FBFC3790FF8B87A300', '', '', '2021-02-04 20:47:10', '2021-03-19 08:04:31', 16, 4094, 13, 1, 1),
	(1053, 'Pennyroo', '*552496BAC34922AEB36DBE49532826A17CC95CC0', '', '', '2021-02-08 17:43:53', '2021-03-10 15:26:14', 16, 4094, 13, 1, 1),
	(1054, 'Rupeedoo', '*0E7E3B361298E828B242850256E41849BB2F6D93', '', '', '2021-02-10 11:28:26', '2021-03-17 21:29:58', 16, 4094, 13, 1, 1),
	(1055, 'Lasaan', '*0746A43C2AAC4F64FBAE361169385FE586FA9945', '', '', '2021-02-10 13:42:50', '2021-03-13 03:13:21', 16, 4094, 13, 1, 1),
	(1056, 'JasnahKholin', '*8AECBD93A33944A518C105BB1F3283819CB507E3', '', '', '2021-02-10 17:46:13', '2021-03-10 15:24:40', 16, 4094, 13, 1, 1),
	(1057, 'Lasaan2', '*2C0CB6E193C0B0FA313F900C86198FCC83272804', '', '', '2021-02-11 11:13:47', '2021-03-10 15:30:31', 16, 4094, 13, 1, 1),
	(1058, 'chaoskitten', '*9E6F66BC0590D47297D219EF5CE494BE08832E81', '', '', '2021-02-12 22:52:33', '2021-02-12 23:31:56', 16, 4094, 13, 1, 1),
	(1059, 'PLDTEST', '*8EC4AC78B1A199D50666BA61E7AE1A00F1EF14CC', '', '', '2021-02-14 08:26:15', '2021-03-19 08:11:16', 16, 4094, 13, 1, 1),
	(1060, 'Testheal', '*CB6E98C9B79175FFAB8FFBF6AC759D9BD36868BD', '', '', '2021-02-14 08:43:51', '2021-03-10 15:29:30', 16, 4094, 13, 1, 1),
	(1061, 'testdd', '*EDC995106EB4281998DA7C5AED42A938C4DB20FA', '', '', '2021-02-14 12:01:19', '2021-02-17 16:08:46', 16, 4094, 13, 1, 1),
	(1062, 'TESTRANGED', '*49EED87CC43CB7975B9402F8733F092A9CA5D06B', '', '', '2021-02-15 15:44:47', '2021-02-16 03:07:42', 16, 4094, 13, 1, 1),
	(1063, 'Firewall', '*ECE6A35934DACEF67C0B8B91F8A1D20DF35AE01B', '', '', '2021-02-17 22:05:44', '2021-03-10 15:26:41', 16, 4094, 13, 1, 1),
	(1064, 'Groundbuster', '*ECE6A35934DACEF67C0B8B91F8A1D20DF35AE01B', '', '', '2021-02-18 10:55:52', '2021-02-18 13:55:50', 16, 4094, 13, 1, 1),
	(1065, 'Laharal', '*3C1A2DCA94C7E948FDC0C1A8DB5698DABAC59021', '', '', '2021-02-19 13:05:08', '2021-02-22 17:29:34', 16, 4094, 13, 1, 1),
	(1066, 'Flonne', '*3C1A2DCA94C7E948FDC0C1A8DB5698DABAC59021', '', '', '2021-02-19 16:51:44', '2021-02-19 16:51:45', 16, 4094, 13, 1, 1),
	(1067, 'Etna', '*3C1A2DCA94C7E948FDC0C1A8DB5698DABAC59021', '', '', '2021-02-19 16:56:36', '2021-02-19 16:56:36', 16, 4094, 13, 1, 1),
	(1068, 'Terafied', '*6A7A490FB9DC8C33C2B025A91737077A7E9CC5E5', '', '', '2021-02-23 15:16:58', '2021-03-17 10:22:42', 16, 4094, 13, 1, 1),
	(1069, 'Corben2729', '*E647343D9B7F6D9C92956B1D0F060C18616A9DAD', '', '', '2021-03-03 12:25:12', '2021-03-04 22:57:04', 16, 4094, 13, 1, 1),
	(1070, 'Peyton2020', '*1F7E5C220632AD5E8C065647AF1716B3D678D3CC', '', '', '2021-03-03 15:41:33', '2021-03-05 16:03:46', 16, 4094, 13, 1, 1),
	(1071, 'Winnleigh', '*31FBC773C80A1D1A836AE6DCE4D8224563050C79', '', '', '2021-03-06 17:51:04', '2021-03-06 17:51:04', 16, 4094, 13, 1, 1),
	(1072, 'Hannie', '*B0B14794CB07583C81FE89346FC9B074C7D7B1A9', '', '', '2021-03-07 01:57:57', '2021-03-09 17:29:31', 16, 4094, 13, 1, 1),
	(1073, 'JFoxx', '*6DFAFACE9FBD38FFF95CEBFCD54BE8601A9BCCF6', '', '', '2021-03-07 19:41:06', '2021-03-09 17:45:22', 16, 4094, 13, 1, 1),
	(1074, 'Oats', '*738758B0C7BD3E92592D88CC9B8E1A546340007E', '', '', '2021-03-07 22:58:36', '2021-03-09 17:47:48', 16, 4094, 13, 1, 1),
	(1075, 'Artax', '*6063C78456BB048BAF36BE1104D12D547834DFEA', '', '', '2021-03-08 10:55:59', '2021-03-08 11:08:01', 16, 4094, 13, 1, 1),
	(1076, 'maximo', '*9C85DC096ADCE0AA6AB5D0ACF42F9BEFF797B9DA', '', '', '2021-03-09 02:06:31', '2021-03-09 02:06:31', 16, 4094, 13, 1, 1),
	(1077, 'Foor', '*AEDD46DAC2CB0957D2DBB0B005F3431F78FED245', '', '', '2021-03-12 18:37:17', '2021-03-12 20:45:33', 16, 4094, 13, 1, 1),
	(1078, 'Mcollazo_81', '*E4EE4B526D608DE4FB70690107F751F580EF8B72', '', '', '2021-03-14 19:09:49', '2021-03-18 20:09:27', 16, 4094, 13, 1, 1),
	(1079, 'MrsK', '*4C43AE30DB77B501A7A271BA2AF5E04CE60B509C', '', '', '2021-03-14 19:44:09', '2021-03-18 18:45:59', 16, 4094, 13, 1, 1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
