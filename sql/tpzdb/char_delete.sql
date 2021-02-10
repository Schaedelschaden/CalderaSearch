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

-- Dumping structure for trigger tpzdb.char_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER char_delete
    BEFORE DELETE ON chars
    FOR EACH ROW
BEGIN
    DELETE FROM `char_blacklist` WHERE `charid_owner` = OLD.charid;
    DELETE FROM `char_effects`   WHERE `charid` = OLD.charid;
    DELETE FROM `char_equip`     WHERE `charid` = OLD.charid;
    DELETE FROM `char_exp`       WHERE `charid` = OLD.charid;
    DELETE FROM `char_inventory` WHERE `charid` = OLD.charid;
    DELETE FROM `char_jobs`      WHERE `charid` = OLD.charid;
    DELETE FROM `char_look`      WHERE `charid` = OLD.charid;
    DELETE FROM `char_merit`     WHERE `charid` = OLD.charid;
    DELETE FROM `char_pet`       WHERE `charid` = OLD.charid;
    DELETE FROM `char_points`    WHERE `charid` = OLD.charid;
    DELETE FROM `char_unlocks`   WHERE `charid` = OLD.charid;
    DELETE FROM `char_profile`   WHERE `charid` = OLD.charid;
    DELETE FROM `char_recast`    WHERE `charid` = OLD.charid;
    DELETE FROM `char_skills`    WHERE `charid` = OLD.charid;
    DELETE FROM `char_spells`    WHERE `charid` = OLD.charid;
    DELETE FROM `char_stats`     WHERE `charid` = OLD.charid;
    DELETE FROM `char_storage`   WHERE `charid` = OLD.charid;
    DELETE FROM `char_style`     WHERE `charid` = OLD.charid;
    DELETE FROM `char_vars`      WHERE `charid` = OLD.charid;
    DELETE FROM `auction_house`  WHERE `seller` = OLD.charid;
    DELETE FROM `delivery_box`   WHERE `charid` = OLD.charid;
    UPDATE `account_ip_record` SET `charid`  = 0 where `charid` = OLD.charid;
    UPDATE `delivery_box` SET sent = 0 WHERE box = 2 AND received = 0 AND sent = 1 AND senderid = OLD.charid;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
