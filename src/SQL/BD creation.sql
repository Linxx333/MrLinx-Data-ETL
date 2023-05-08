-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lol_esports
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lol_esports
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lol_esports` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema ironflix
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ironflix
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ironflix` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lol_esports` ;

-- -----------------------------------------------------
-- Table `lol_esports`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`players` (
  `player_id` INT NOT NULL,
  `nick` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `Games` INT NULL,
  `Win rate` FLOAT NULL,
  `KDA` FLOAT NULL,
  `Avg Kills` FLOAT NULL,
  `Avg Deaths` FLOAT NULL,
  `Avg Assists` FLOAT NULL,
  `CS-Min` FLOAT NULL,
  `Gold-Min` FLOAT NULL,
  `KP%` FLOAT NULL,
  `DMG%` FLOAT NULL,
  `Deaths-Min` FLOAT NULL,
  `Vision Puntuation Min` FLOAT NULL,
  `Avg Wards Min` FLOAT NULL,
  `Avg Wards Cleared Min` FLOAT NULL,
  `Avg Vision Wards Min` FLOAT NULL,
  `Gold Difference Min-15` FLOAT NULL,
  `CS Difference Min-15` FLOAT NULL,
  `XP Difference Min-15` FLOAT NULL,
  `First Blood Participation %` FLOAT NULL,
  `First Blood Victim %` FLOAT NULL,
  `Penta Kills` INT NULL,
  `Solo Kills` INT NULL,
  PRIMARY KEY (`player_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`leagues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`leagues` (
  `league_id` INT NOT NULL,
  `league` VARCHAR(45) NULL,
  PRIMARY KEY (`league_id`),
  UNIQUE INDEX `league_UNIQUE` (`league` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`teams` (
  `team_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `Matches` INT NULL,
  `Games` INT NULL,
  `Wins` INT NULL,
  `Loses` INT NULL,
  `Kills` FLOAT NULL,
  `Deaths` FLOAT NULL,
  `Towers` FLOAT NULL,
  `Inhibitors` FLOAT NULL,
  `Dragons` FLOAT NULL,
  `Barons` FLOAT NULL,
  `Gold` FLOAT NULL,
  `Creep Score` FLOAT NULL,
  `Wards` FLOAT NULL,
  `Wards Cleared` FLOAT NULL,
  `First Tower` FLOAT NULL,
  `First Blood` FLOAT NULL,
  `leagues_id` INT NOT NULL,
  PRIMARY KEY (`team_id`),
  INDEX `fk_teams_leagues1_idx` (`leagues_id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_teams_leagues1`
    FOREIGN KEY (`leagues_id`)
    REFERENCES `lol_esports`.`leagues` (`league_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`splits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`splits` (
  `split_id` INT NOT NULL,
  `year` YEAR NULL,
  `split` VARCHAR(45) NULL,
  PRIMARY KEY (`split_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`winners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`winners` (
  `winner_id` INT NOT NULL,
  `split_id` INT NOT NULL,
  `winnerteam_id` INT NOT NULL,
  `runner-up_id` INT NOT NULL,
  PRIMARY KEY (`winner_id`),
  INDEX `fk_winners_years1_idx` (`split_id` ASC) VISIBLE,
  INDEX `fk_winners_teams1_idx` (`winnerteam_id` ASC) VISIBLE,
  INDEX `fk_winners_teams2_idx` (`runner-up_id` ASC) VISIBLE,
  CONSTRAINT `fk_winners_years1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_winners_teams1`
    FOREIGN KEY (`winnerteam_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_winners_teams2`
    FOREIGN KEY (`runner-up_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`hist-players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`hist-players` (
  `hist_id` INT NOT NULL,
  `country` VARCHAR(45) NULL,
  `Games` INT NULL,
  `Win rate` FLOAT NULL,
  `KDA` FLOAT NULL,
  `Avg Kills` FLOAT NULL,
  `Avg Deaths` FLOAT NULL,
  `Avg Assists` FLOAT NULL,
  `CS-Min` FLOAT NULL,
  `Gold-Min` FLOAT NULL,
  `KP%` FLOAT NULL,
  `DMG%` FLOAT NULL,
  `Deaths-Min` FLOAT NULL,
  `Vision Puntuation Min` FLOAT NULL,
  `Avg Wards Min` FLOAT NULL,
  `Avg Wards Cleared Min` FLOAT NULL,
  `Avg Vision Wards Min` FLOAT NULL,
  `Gold Difference Min-15` FLOAT NULL,
  `CS Difference Min-15` FLOAT NULL,
  `XP Difference Min-15` FLOAT NULL,
  `First Blood Participation %` FLOAT NULL,
  `First Blood Victim %` FLOAT NULL,
  `Penta Kills` INT NULL,
  `Solo Kills` INT NULL,
  `split_id` INT NOT NULL,
  `team_id` INT NULL,
  `players_id` INT NOT NULL,
  PRIMARY KEY (`hist_id`),
  INDEX `fk_histórico_players_idx` (`players_id` ASC) VISIBLE,
  INDEX `fk_histórico_years1_idx` (`split_id` ASC) VISIBLE,
  INDEX `fk_hist-players_teams1_idx` (`team_id` ASC) VISIBLE,
  CONSTRAINT `fk_histórico_players`
    FOREIGN KEY (`players_id`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_histórico_years1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hist-players_teams1`
    FOREIGN KEY (`team_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`coaching_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`coaching_staff` (
  `coaching_staff_id` INT NOT NULL,
  PRIMARY KEY (`coaching_staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`champs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`champs` (
  `champs_id` INT NOT NULL,
  `players_id` INT NOT NULL,
  PRIMARY KEY (`champs_id`),
  INDEX `fk_champs_players1_idx` (`players_id` ASC) VISIBLE,
  CONSTRAINT `fk_champs_players1`
    FOREIGN KEY (`players_id`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`hist-staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`hist-staff` (
  `hist-staff_id` INT NOT NULL,
  `coaching_staff_id` INT NOT NULL,
  `splits_id` INT NOT NULL,
  PRIMARY KEY (`hist-staff_id`),
  INDEX `fk_hist-staff_coaching_staff1_idx` (`coaching_staff_id` ASC) VISIBLE,
  INDEX `fk_hist-staff_splits1_idx` (`splits_id` ASC) VISIBLE,
  CONSTRAINT `fk_hist-staff_coaching_staff1`
    FOREIGN KEY (`coaching_staff_id`)
    REFERENCES `lol_esports`.`coaching_staff` (`coaching_staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hist-staff_splits1`
    FOREIGN KEY (`splits_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`teams_has_hist-staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`teams_has_hist-staff` (
  `teams_idteams` INT NOT NULL,
  `hist-staff_idhist-staff` INT NOT NULL,
  PRIMARY KEY (`teams_idteams`, `hist-staff_idhist-staff`),
  INDEX `fk_teams_has_hist-staff_hist-staff1_idx` (`hist-staff_idhist-staff` ASC) VISIBLE,
  INDEX `fk_teams_has_hist-staff_teams1_idx` (`teams_idteams` ASC) VISIBLE,
  CONSTRAINT `fk_teams_has_hist-staff_teams1`
    FOREIGN KEY (`teams_idteams`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teams_has_hist-staff_hist-staff1`
    FOREIGN KEY (`hist-staff_idhist-staff`)
    REFERENCES `lol_esports`.`hist-staff` (`hist-staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`champs_season`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`champs_season` (
  `champs_season_id` INT NOT NULL,
  `hist_id` INT NOT NULL,
  PRIMARY KEY (`champs_season_id`),
  INDEX `fk_champs_season_hist-players1_idx` (`hist_id` ASC) VISIBLE,
  CONSTRAINT `fk_champs_season_hist-players1`
    FOREIGN KEY (`hist_id`)
    REFERENCES `lol_esports`.`hist-players` (`hist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ironflix` ;

-- -----------------------------------------------------
-- Table `ironflix`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(300) NULL DEFAULT NULL,
  `release_year` YEAR NULL DEFAULT NULL,
  `rental_duration` TINYINT NOT NULL,
  `price` FLOAT NOT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` FLOAT NOT NULL,
  `rating` VARCHAR(15) NOT NULL,
  `special_features` VARCHAR(100) NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `category_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) VISIBLE,
  UNIQUE INDEX `description_UNIQUE` (`description` ASC) VISIBLE,
  INDEX `fk_film_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `ironflix`.`category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`actor_has_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`actor_has_film` (
  `actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`actor_id`, `film_id`),
  INDEX `fk_actor_has_film_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_actor_has_film_actor1_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_actor_has_film_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `ironflix`.`actor` (`actor_id`),
  CONSTRAINT `fk_actor_has_film_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `ironflix`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`clients` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `address` VARCHAR(150) NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`language` (
  `language_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`stores` (
  `store_id` INT NOT NULL,
  `address` VARCHAR(150) NOT NULL,
  `mall` VARCHAR(100) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE INDEX `dirección_UNIQUE` (`address` ASC) VISIBLE,
  UNIQUE INDEX `mall_UNIQUE` (`mall` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`, `film_id`, `store_id`, `language_id`),
  INDEX `fk_inventory_stores1_idx` (`store_id` ASC) VISIBLE,
  INDEX `fk_inventory_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_inventory_language1_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `ironflix`.`film` (`film_id`),
  CONSTRAINT `fk_inventory_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `ironflix`.`language` (`language_id`),
  CONSTRAINT `fk_inventory_stores1`
    FOREIGN KEY (`store_id`)
    REFERENCES `ironflix`.`stores` (`store_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`staff` (
  `staff_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `job_position` VARCHAR(45) NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `stores_idstores` INT NOT NULL,
  PRIMARY KEY (`staff_id`, `stores_idstores`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  INDEX `fk_staff_stores1_idx` (`stores_idstores` ASC) VISIBLE,
  CONSTRAINT `fk_staff_stores1`
    FOREIGN KEY (`stores_idstores`)
    REFERENCES `ironflix`.`stores` (`store_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ironflix`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ironflix`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NOT NULL,
  `return_date` DATETIME NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `customer_id`, `staff_id`, `inventory_id`),
  INDEX `fk_rental_clients1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_rental_staff1_idx` (`staff_id` ASC) VISIBLE,
  INDEX `fk_rental_inventory1_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_clients1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ironflix`.`clients` (`customer_id`),
  CONSTRAINT `fk_rental_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `ironflix`.`inventory` (`inventory_id`),
  CONSTRAINT `fk_rental_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `ironflix`.`staff` (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
