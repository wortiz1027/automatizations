-- MySQL Script generated by MySQL Workbench
-- Sat No 28 00:00:00 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema vendorcommanddb
-- -----------------------------------------------------
-- Base de datos que permite gestionar la informacion de vendors
DROP SCHEMA IF EXISTS `vendorcommanddb` ;

-- -----------------------------------------------------
-- Schema Products Command 
--
-- Base de datos que permite gestionar la informacion de vendors
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendorcommanddb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;

USE `vendorcommanddb` ;

CREATE TABLE IF NOT EXISTS VENDORS (
    ID_PROVIDER   VARCHAR(512),
	NAME_PROVIDER VARCHAR(1000),
    NIT           VARCHAR(512),
    ID_TYPE       VARCHAR(512),
    ADDRESS       VARCHAR(1500),
	TELEPHONE     VARCHAR(1500),
	EMAIL         VARCHAR(1500),
	ID_COUNTRY    VARCHAR(1500),
	ID_PROVINCE   VARCHAR(1500),
	ID_CITY       VARCHAR(1500)
) ENGINE = InnoDB;

CREATE TABLE VENDOR_TYPES (
	TYPES_ID VARCHAR(512),
	DESCRIPTION VARCHAR(512)
) ENGINE = InnoDB;

ALTER TABLE VENDORS ADD CONSTRAINT PK_VDR PRIMARY KEY (ID_PROVIDER);
ALTER TABLE VENDOR_TYPES   ADD CONSTRAINT PK_TPS PRIMARY KEY (TYPES_ID);

ALTER TABLE VENDORS ADD CONSTRAINT FK_VDR_TPS FOREIGN KEY (ID_TYPE) REFERENCES VENDOR_TYPES (TYPES_ID);

ALTER TABLE VENDORS ADD INDEX(NAME_PROVIDER);

INSERT INTO VENDOR_TYPES(TYPES_ID, DESCRIPTION) VALUES ('454e547c-3ebb-422b-9a50-f4e6b273f6fe', 'Transporte Aereo');
INSERT INTO VENDOR_TYPES(TYPES_ID, DESCRIPTION) VALUES ('9d0644aa-3cb6-47e2-977a-e88897293711', 'Transporte Terrestre');
INSERT INTO VENDOR_TYPES(TYPES_ID, DESCRIPTION) VALUES ('07de7ec6-7d2d-4f20-9f0d-2412df4f92c5', 'Hotel');
INSERT INTO VENDOR_TYPES(TYPES_ID, DESCRIPTION) VALUES ('007bd1d7-f2c9-4a66-b8dd-7ca57c9577f5', 'Entidad Financiera');
INSERT INTO VENDOR_TYPES(TYPES_ID, DESCRIPTION) VALUES ('3ebc5e36-8d3e-471e-9fd2-a104249728e3', 'Franquicia Tarjeta de Credito');
INSERT INTO VENDOR_TYPES(TYPES_ID, DESCRIPTION) VALUES ('e79363ad-677e-43c2-8f7d-02446fd9d399', 'Hostales');
INSERT INTO VENDOR_TYPES(TYPES_ID, DESCRIPTION) VALUES ('49805192-988f-4fa0-89e0-8b0c3aa75b0f', 'Mensajeria');