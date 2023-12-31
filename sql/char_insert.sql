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

-- Dumping structure for trigger tpzdb.char_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER char_insert
    BEFORE INSERT ON chars
    FOR EACH ROW
BEGIN
    INSERT INTO `char_equip`     SET `charid` = NEW.charid;
    INSERT INTO `char_exp`       SET `charid` = NEW.charid;
    INSERT INTO `char_jobs`      SET `charid` = NEW.charid;
    INSERT INTO `char_pet`       SET `charid` = NEW.charid;
    INSERT INTO `char_points`    SET `charid` = NEW.charid;
    INSERT INTO `char_unlocks`   SET `charid` = NEW.charid;
    INSERT INTO `char_profile`   SET `charid` = NEW.charid;
    INSERT INTO `char_storage`   SET `charid` = NEW.charid;
    INSERT INTO `char_inventory` SET `charid` = NEW.charid;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
