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
USE `lol_esports` ;

-- -----------------------------------------------------
-- Table `lol_esports`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`players` (
  `player_id` INT NOT NULL,
  `nick` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `Games` INT NULL DEFAULT NULL,
  `Win rate` FLOAT NULL DEFAULT NULL,
  `KDA` FLOAT NULL DEFAULT NULL,
  `Avg Kills` FLOAT NULL DEFAULT NULL,
  `Avg Deaths` FLOAT NULL DEFAULT NULL,
  `Avg Assists` FLOAT NULL DEFAULT NULL,
  `CS-Min` FLOAT NULL DEFAULT NULL,
  `Gold-Min` FLOAT NULL DEFAULT NULL,
  `KP%` FLOAT NULL DEFAULT NULL,
  `DMG%` FLOAT NULL DEFAULT NULL,
  `Deaths-Min` FLOAT NULL DEFAULT NULL,
  `Vision Puntuation Min` FLOAT NULL DEFAULT NULL,
  `Avg Wards Min` FLOAT NULL DEFAULT NULL,
  `Avg Wards Cleared Min` FLOAT NULL DEFAULT NULL,
  `Avg Vision Wards Min` FLOAT NULL DEFAULT NULL,
  `Gold Difference Min-15` FLOAT NULL DEFAULT NULL,
  `CS Difference Min-15` FLOAT NULL DEFAULT NULL,
  `XP Difference Min-15` FLOAT NULL DEFAULT NULL,
  `First Blood Participation %` FLOAT NULL DEFAULT NULL,
  `First Blood Victim %` FLOAT NULL DEFAULT NULL,
  `Penta Kills` INT NULL DEFAULT NULL,
  `Solo Kills` INT NULL DEFAULT NULL,
  PRIMARY KEY (`player_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lol_esports`.`champs_global`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`champs_global` (
  `champs_id` INT NOT NULL,
  `Champion` VARCHAR(45) NOT NULL,
  `KDA` VARCHAR(45) NULL,
  `Kills` FLOAT NULL,
  `Deaths` FLOAT NULL,
  `Assists` FLOAT NULL,
  `Gold` FLOAT NULL,
  `CS` FLOAT NULL,
  `DamageToChampions` FLOAT NULL,
  `Pentakills` FLOAT NULL,
  PRIMARY KEY (`champs_id`),
  UNIQUE INDEX `Championl_UNIQUE` (`Champion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`champs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`champs` (
  `champsGP_id` INT NOT NULL,
  `KDA` VARCHAR(45) NULL,
  `Kills` FLOAT NULL,
  `Deaths` FLOAT NULL,
  `Assists` FLOAT NULL,
  `Gold` FLOAT NULL,
  `CS` FLOAT NULL,
  `DamageToChampions` FLOAT NULL,
  `Pentakills` FLOAT NULL,
  `players_id` INT NOT NULL,
  `champs_id` INT NOT NULL,
  PRIMARY KEY (`champsGP_id`),
  INDEX `fk_champs_players1_idx` (`players_id` ASC) VISIBLE,
  INDEX `fk_champs_champs_global1_idx` (`champs_id` ASC) VISIBLE,
  CONSTRAINT `fk_champs_players1`
    FOREIGN KEY (`players_id`)
    REFERENCES `lol_esports`.`players` (`player_id`),
  CONSTRAINT `fk_champs_champs_global1`
    FOREIGN KEY (`champs_id`)
    REFERENCES `lol_esports`.`champs_global` (`champs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lol_esports`.`leagues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`leagues` (
  `league_id` INT NOT NULL,
  `league` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`league_id`),
  UNIQUE INDEX `league_UNIQUE` (`league` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lol_esports`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`teams` (
  `team_id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `Matches` INT NULL DEFAULT NULL,
  `Games` INT NULL DEFAULT NULL,
  `Wins` INT NULL DEFAULT NULL,
  `Loses` INT NULL DEFAULT NULL,
  `Kills` FLOAT NULL DEFAULT NULL,
  `Deaths` FLOAT NULL DEFAULT NULL,
  `Towers` FLOAT NULL DEFAULT NULL,
  `Inhibitors` FLOAT NULL DEFAULT NULL,
  `Dragons` FLOAT NULL DEFAULT NULL,
  `Barons` FLOAT NULL DEFAULT NULL,
  `Gold` FLOAT NULL DEFAULT NULL,
  `Creep Score` FLOAT NULL DEFAULT NULL,
  `Wards` FLOAT NULL DEFAULT NULL,
  `Wards Cleared` FLOAT NULL DEFAULT NULL,
  `First Tower` FLOAT NULL DEFAULT NULL,
  `First Blood` FLOAT NULL DEFAULT NULL,
  `leagues_id` INT NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_teams_leagues1_idx` (`leagues_id` ASC) VISIBLE,
  CONSTRAINT `fk_teams_leagues1`
    FOREIGN KEY (`leagues_id`)
    REFERENCES `lol_esports`.`leagues` (`league_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lol_esports`.`splits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`splits` (
  `split_id` INT NOT NULL,
  `year` YEAR NULL DEFAULT NULL,
  `split` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`split_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lol_esports`.`hist-players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`hist-players` (
  `hist_id` INT NOT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `Games` INT NULL DEFAULT NULL,
  `Win rate` FLOAT NULL DEFAULT NULL,
  `KDA` FLOAT NULL DEFAULT NULL,
  `Avg Kills` FLOAT NULL DEFAULT NULL,
  `Avg Deaths` FLOAT NULL DEFAULT NULL,
  `Avg Assists` FLOAT NULL DEFAULT NULL,
  `CS-Min` FLOAT NULL DEFAULT NULL,
  `Gold-Min` FLOAT NULL DEFAULT NULL,
  `KP%` FLOAT NULL DEFAULT NULL,
  `DMG%` FLOAT NULL DEFAULT NULL,
  `Deaths-Min` FLOAT NULL DEFAULT NULL,
  `Vision Puntuation Min` FLOAT NULL DEFAULT NULL,
  `Avg Wards Min` FLOAT NULL DEFAULT NULL,
  `Avg Wards Cleared Min` FLOAT NULL DEFAULT NULL,
  `Avg Vision Wards Min` FLOAT NULL DEFAULT NULL,
  `Gold Difference Min-15` FLOAT NULL DEFAULT NULL,
  `CS Difference Min-15` FLOAT NULL DEFAULT NULL,
  `XP Difference Min-15` FLOAT NULL DEFAULT NULL,
  `First Blood Participation %` FLOAT NULL DEFAULT NULL,
  `First Blood Victim %` FLOAT NULL DEFAULT NULL,
  `Penta Kills` INT NULL DEFAULT NULL,
  `Solo Kills` INT NULL DEFAULT NULL,
  `split_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  `players_id` INT NOT NULL,
  PRIMARY KEY (`hist_id`),
  INDEX `fk_histórico_players_idx` (`players_id` ASC) VISIBLE,
  INDEX `fk_histórico_years1_idx` (`split_id` ASC) VISIBLE,
  INDEX `fk_hist-players_teams1_idx` (`team_id` ASC) VISIBLE,
  CONSTRAINT `fk_hist-players_teams1`
    FOREIGN KEY (`team_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`),
  CONSTRAINT `fk_histórico_players`
    FOREIGN KEY (`players_id`)
    REFERENCES `lol_esports`.`players` (`player_id`),
  CONSTRAINT `fk_histórico_years1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
  CONSTRAINT `fk_winners_teams1`
    FOREIGN KEY (`winnerteam_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`),
  CONSTRAINT `fk_winners_teams2`
    FOREIGN KEY (`runner-up_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`),
  CONSTRAINT `fk_winners_years1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lol_esports`.`games_players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`games_players` (
  `gameP_id` INT NOT NULL,
  `KDA` VARCHAR(20) NOT NULL,
  `Kills` INT NOT NULL,
  `Deaths` INT NOT NULL,
  `Assists` INT NOT NULL,
  `Gold` FLOAT NULL,
  `CS` INT NULL,
  `DamageToChampions` FLOAT NULL,
  `Playoffs` TINYINT NOT NULL,
  `Pentakill` INT NOT NULL,
  `players_id` INT NOT NULL,
  `champs_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  `teamVs_id` INT NOT NULL,
  `split_id` INT NOT NULL,
  PRIMARY KEY (`gameP_id`),
  INDEX `fk_games_players_players1_idx` (`players_id` ASC) VISIBLE,
  INDEX `fk_games_players_splits1_idx` (`split_id` ASC) VISIBLE,
  INDEX `fk_games_players_teams1_idx` (`team_id` ASC) VISIBLE,
  INDEX `fk_games_players_teams2_idx` (`teamVs_id` ASC) VISIBLE,
  INDEX `fk_games_players_champs_global1_idx` (`champs_id` ASC) VISIBLE,
  CONSTRAINT `fk_games_players_players1`
    FOREIGN KEY (`players_id`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_players_splits1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_players_teams1`
    FOREIGN KEY (`team_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_players_teams2`
    FOREIGN KEY (`teamVs_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_players_champs_global1`
    FOREIGN KEY (`champs_id`)
    REFERENCES `lol_esports`.`champs_global` (`champs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`hist_champs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`hist_champs` (
  `champsSP_id` INT NOT NULL,
  `KDA` VARCHAR(45) NULL,
  `Kills` FLOAT NULL,
  `Deaths` FLOAT NULL,
  `Assists` FLOAT NULL,
  `Gold` FLOAT NULL,
  `CS` FLOAT NULL,
  `DamageToChampions` FLOAT NULL,
  `Pentakills` FLOAT NULL,
  `players_id` INT NOT NULL,
  `champs_id` INT NOT NULL,
  `split_id` INT NOT NULL,
  PRIMARY KEY (`champsSP_id`),
  INDEX `fk_hist_champs_champs_global1_idx` (`champs_id` ASC) VISIBLE,
  INDEX `fk_hist_champs_players1_idx` (`players_id` ASC) VISIBLE,
  INDEX `fk_hist_champs_splits1_idx` (`split_id` ASC) VISIBLE,
  CONSTRAINT `fk_hist_champs_champs_global1`
    FOREIGN KEY (`champs_id`)
    REFERENCES `lol_esports`.`champs_global` (`champs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hist_champs_players1`
    FOREIGN KEY (`players_id`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hist_champs_splits1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`champs_per_season`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`champs_per_season` (
  `champsS_id` INT NOT NULL,
  `KDA` VARCHAR(45) NULL,
  `Kills` FLOAT NULL,
  `Deaths` FLOAT NULL,
  `Assists` FLOAT NULL,
  `Gold` FLOAT NULL,
  `CS` FLOAT NULL,
  `DamageToChampions` FLOAT NULL,
  `Pentakills` FLOAT NULL,
  `champs_id` INT NOT NULL,
  `split_id` INT NOT NULL,
  PRIMARY KEY (`champsS_id`),
  INDEX `fk_champs_hist_split_splits1_idx` (`split_id` ASC) VISIBLE,
  INDEX `fk_champs_hist_split_champs_global1_idx` (`champs_id` ASC) VISIBLE,
  CONSTRAINT `fk_champs_hist_split_splits1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_champs_hist_split_champs_global1`
    FOREIGN KEY (`champs_id`)
    REFERENCES `lol_esports`.`champs_global` (`champs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`games_teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`games_teams` (
  `gameT_id` INT NOT NULL,
  `Gamelength` VARCHAR(45) NULL,
  `Gamelength_secs` INT NULL,
  `Team1Bans` VARCHAR(200) NULL,
  `Team2Bans` VARCHAR(200) NULL,
  `Team1Dragons` INT NULL,
  `Team2Dragons` INT NULL,
  `Team1RiftHeralds` FLOAT NULL,
  `Team2RiftHeralds` FLOAT NULL,
  `Team1Barons` FLOAT NULL,
  `Team2Barons` FLOAT NULL,
  `Team1Towers` INT NULL,
  `Team2Towers` INT NULL,
  `Team1Gold` FLOAT NULL,
  `Team2Gold` FLOAT NULL,
  `Playoffs` TINYINT NULL,
  `Winned` INT NULL,
  `split_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  `teamVs_id` INT NOT NULL,
  `winner_id` INT NOT NULL,
  `looser_id` INT NOT NULL,
  `player_id1` INT NOT NULL,
  `player_id2` INT NOT NULL,
  `player_id3` INT NOT NULL,
  `player_id4` INT NOT NULL,
  `player_id5` INT NOT NULL,
  `player_id6` INT NOT NULL,
  `player_id7` INT NOT NULL,
  `player_id8` INT NOT NULL,
  `player_id9` INT NOT NULL,
  `player_id10` INT NOT NULL,
  PRIMARY KEY (`gameT_id`),
  INDEX `fk_games_teams_splits1_idx` (`split_id` ASC) VISIBLE,
  INDEX `fk_games_teams_teams1_idx` (`team_id` ASC) VISIBLE,
  INDEX `fk_games_teams_teams2_idx` (`teamVs_id` ASC) VISIBLE,
  INDEX `fk_games_teams_teams3_idx` (`winner_id` ASC) VISIBLE,
  INDEX `fk_games_teams_teams4_idx` (`looser_id` ASC) VISIBLE,
  INDEX `fk_games_teams_players1_idx` (`player_id1` ASC) VISIBLE,
  INDEX `fk_games_teams_players2_idx` (`player_id2` ASC) VISIBLE,
  INDEX `fk_games_teams_players3_idx` (`player_id3` ASC) VISIBLE,
  INDEX `fk_games_teams_players4_idx` (`player_id4` ASC) VISIBLE,
  INDEX `fk_games_teams_players5_idx` (`player_id5` ASC) VISIBLE,
  INDEX `fk_games_teams_players6_idx` (`player_id6` ASC) VISIBLE,
  INDEX `fk_games_teams_players7_idx` (`player_id7` ASC) VISIBLE,
  INDEX `fk_games_teams_players8_idx` (`player_id8` ASC) VISIBLE,
  INDEX `fk_games_teams_players9_idx` (`player_id9` ASC) VISIBLE,
  INDEX `fk_games_teams_players10_idx` (`player_id10` ASC) VISIBLE,
  CONSTRAINT `fk_games_teams_splits1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_teams1`
    FOREIGN KEY (`team_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_teams2`
    FOREIGN KEY (`teamVs_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_teams3`
    FOREIGN KEY (`winner_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_teams4`
    FOREIGN KEY (`looser_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players1`
    FOREIGN KEY (`player_id1`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players2`
    FOREIGN KEY (`player_id2`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players3`
    FOREIGN KEY (`player_id3`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players4`
    FOREIGN KEY (`player_id4`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players5`
    FOREIGN KEY (`player_id5`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players6`
    FOREIGN KEY (`player_id6`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players7`
    FOREIGN KEY (`player_id7`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players8`
    FOREIGN KEY (`player_id8`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players9`
    FOREIGN KEY (`player_id9`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_teams_players10`
    FOREIGN KEY (`player_id10`)
    REFERENCES `lol_esports`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lol_esports`.`hist_teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lol_esports`.`hist_teams` (
  `histTeam_id` INT NOT NULL,
  `Gamelength_secs` FLOAT NULL,
  `Team1Dragons` FLOAT NULL,
  `Team2Dragons` FLOAT NULL,
  `Team1RiftHeralds` FLOAT NULL,
  `Team2RiftHeralds` FLOAT NULL,
  `Team1Barons` FLOAT NULL,
  `Team2Barons` FLOAT NULL,
  `Team1Towers` FLOAT NULL,
  `Team2Towers` FLOAT NULL,
  `Team1Gold` FLOAT NULL,
  `Team2Gold` FLOAT NULL,
  `Playoffs` INT NULL,
  `Winrate` FLOAT NULL,
  `team_id` INT NOT NULL,
  `split_id` INT NOT NULL,
  PRIMARY KEY (`histTeam_id`),
  INDEX `fk_hist_teams_teams1_idx` (`team_id` ASC) VISIBLE,
  INDEX `fk_hist_teams_splits1_idx` (`split_id` ASC) VISIBLE,
  CONSTRAINT `fk_hist_teams_teams1`
    FOREIGN KEY (`team_id`)
    REFERENCES `lol_esports`.`teams` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hist_teams_splits1`
    FOREIGN KEY (`split_id`)
    REFERENCES `lol_esports`.`splits` (`split_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
