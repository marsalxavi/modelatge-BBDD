-- MySQL Script generated by MySQL Workbench
-- Tue 29 Sep 2020 01:04:42 AM CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema llibreria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema llibreria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `llibreria` DEFAULT CHARACTER SET utf8 ;
USE `llibreria` ;

-- -----------------------------------------------------
-- Table `llibreria`.`autors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llibreria`.`autors` (
  `autors_id` INT NOT NULL AUTO_INCREMENT,
  `autors_nom` VARCHAR(45) NULL,
  `autors_adreça` VARCHAR(45) NULL,
  `autors_creat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `autors_modificat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`autors_id`),
  UNIQUE INDEX `autors_nom_UNIQUE` (`autors_nom` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `llibreria`.`llibres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llibreria`.`llibres` (
  `llibres_id` INT NOT NULL AUTO_INCREMENT,
  `llibres_titol` VARCHAR(45) NULL,
  `llibres_data` DATETIME NULL,
  `llibres_unitats` INT NULL,
  `llibres_preu` INT NULL,
  `llibres_creat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `llibres_modificat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `autors_autors_id` INT NOT NULL,
  PRIMARY KEY (`llibres_id`, `autors_autors_id`),
  UNIQUE INDEX `llibres_titol_UNIQUE` (`llibres_titol` ASC),
  INDEX `fk_llibres_autors1_idx` (`autors_autors_id` ASC),
  CONSTRAINT `fk_llibres_autors1`
    FOREIGN KEY (`autors_autors_id`)
    REFERENCES `llibreria`.`autors` (`autors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `llibreria`.`usuaris`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llibreria`.`usuaris` (
  `usuaris_id` INT NOT NULL AUTO_INCREMENT,
  `usuaris_nom` VARCHAR(45) NULL,
  `usuaris_email` VARCHAR(45) NULL,
  `usuaris_pwd` VARCHAR(45) NULL,
  `usuaris_creat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `usuaris_modificat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuaris_id`),
  UNIQUE INDEX `usuaris_nom_UNIQUE` (`usuaris_nom` ASC),
  UNIQUE INDEX `usuaris_email_UNIQUE` (`usuaris_email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `llibreria`.`factures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llibreria`.`factures` (
  `factures_id` INT NOT NULL AUTO_INCREMENT,
  `factures_num` VARCHAR(45) NULL,
  `factures_nom` VARCHAR(45) NULL,
  `factures_data` DATETIME NULL,
  `factures_import` INT(11) NULL,
  `factures_creat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `factures_modificat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuaris_usuaris_id` INT NOT NULL,
  PRIMARY KEY (`factures_id`, `usuaris_usuaris_id`),
  UNIQUE INDEX `factures_head_num_UNIQUE` (`factures_num` ASC),
  INDEX `fk_factures_usuaris1_idx` (`usuaris_usuaris_id` ASC),
  CONSTRAINT `fk_factures_usuaris1`
    FOREIGN KEY (`usuaris_usuaris_id`)
    REFERENCES `llibreria`.`usuaris` (`usuaris_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `llibreria`.`factures_has_llibres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `llibreria`.`factures_has_llibres` (
  `factures_factures_id` INT NOT NULL,
  `llibres_llibres_id` INT NOT NULL,
  `factures_has_llibres_nom` VARCHAR(45) NULL,
  `factures_has_llibres_creat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `factures_has_llibres_modificat` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`factures_factures_id`, `llibres_llibres_id`),
  INDEX `fk_factures_has_llibres_llibres1_idx` (`llibres_llibres_id` ASC),
  INDEX `fk_factures_has_llibres_factures_idx` (`factures_factures_id` ASC),
  CONSTRAINT `fk_factures_has_llibres_factures`
    FOREIGN KEY (`factures_factures_id`)
    REFERENCES `llibreria`.`factures` (`factures_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_factures_has_llibres_llibres1`
    FOREIGN KEY (`llibres_llibres_id`)
    REFERENCES `llibreria`.`llibres` (`llibres_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;