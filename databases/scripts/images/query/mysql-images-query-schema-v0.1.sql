-- MySQL Script generated by MySQL Workbench
-- Sat Oct 07 00:00:00 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema imagesqueryddb
-- -----------------------------------------------------
-- Base de datos que permite gestionar la informacion de productos
DROP SCHEMA IF EXISTS `imagesquerydb` ;

-- -----------------------------------------------------
-- Schema Products Command 
--
-- Base de datos que permite gestionar la informacion de productos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `imagesquerydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;

USE `imagesquerydb` ;

CREATE TABLE IF NOT EXISTS IMAGE (
    IMAGE_ID   VARCHAR(512),
	IMAGE_NAME VARCHAR(1000),
    IMAGE_TYPE VARCHAR(512),
    IMAGE_SIZE BIGINT,
    IMAGE_URL  VARCHAR(1500)
) ENGINE = InnoDB;

ALTER TABLE IMAGES ADD CONSTRAINT PK_IMG PRIMARY KEY (IMAGE_ID);

ALTER TABLE IMAGES ADD INDEX(IMAGE_NAME);

ALTER TABLE IMAGES ADD FULLTEXT (IMAGE_NAME);