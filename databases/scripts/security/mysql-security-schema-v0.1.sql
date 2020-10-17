-- MySQL Script generated by MySQL Workbench
-- Sat Oct 03 16:45:41 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema securitydb
-- -----------------------------------------------------
-- Base de datos que permite controlar la seguridad para mis servicios rest
DROP SCHEMA IF EXISTS `securitydb` ;

-- -----------------------------------------------------
-- Schema security
--
-- Base de datos que permite controlar la seguridad para mis servicios rest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `securitydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `securitydb` ;

-- -----------------------------------------------------
-- Table `securitydb`.`tbl_sec_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`tbl_sec_users` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`tbl_sec_users` (
  `id_user` VARCHAR(255) NOT NULL,
  `cedula` BIGINT(255) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `fecha_nacimiento` DATETIME NOT NULL,
  `telefono` BIGINT(255) NOT NULL,
  `email` VARCHAR(512) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(512) NOT NULL,
  `enable` VARCHAR(45) NULL,
  `account_non_expired` VARCHAR(45) NULL,
  `credential_non_expired` VARCHAR(45) NULL,
  `account_non_locket` VARCHAR(45) NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `cedula_UNIQUE` ON `securitydb`.`tbl_sec_users` (`cedula` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `securitydb`.`tbl_sec_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`tbl_sec_roles` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`tbl_sec_roles` (
  `id_role` VARCHAR(255) NOT NULL,
  `role` VARCHAR(100) NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `securitydb`.`tbl_sec_user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`tbl_sec_user_roles` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`tbl_sec_user_roles` (
  `user_id` VARCHAR(255) NOT NULL,
  `role_id` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  CONSTRAINT `fk_roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `securitydb`.`tbl_sec_roles` (`id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `securitydb`.`tbl_sec_users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `securitydb`.`oauth_client_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`oauth_client_details` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`oauth_client_details` (
  `client_id` VARCHAR(255) NOT NULL,
  `resource_id` VARCHAR(255) NOT NULL,
  `client_secret` VARCHAR(255) NOT NULL,
  `scope` VARCHAR(255) NULL,
  `authorized_grant_types` VARCHAR(255) NULL,
  `web_server_redirect_uri` VARCHAR(255) NULL,
  `authorities` VARCHAR(255) NULL,
  `access_token_validity` BIGINT(10) NULL,
  `refresh_token_validity` BIGINT(10) NULL,
  `additional_information` VARCHAR(4096) NULL,
  `autoapprove` VARCHAR(255) NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `securitydb`.`oauth_client_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`oauth_client_token` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`oauth_client_token` (
  `token_id` VARCHAR(255) NOT NULL,
  `token` BLOB NULL,
  `authentication_id` VARCHAR(255) NULL,
  `user_name` VARCHAR(255) NULL,
  `client_id` VARCHAR(255) NULL,
  PRIMARY KEY (`token_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `securitydb`.`oauth_access_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`oauth_access_token` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`oauth_access_token` (
  `token_id` VARCHAR(255) NULL,
  `token` BLOB NULL,
  `authentication_id` VARCHAR(255) NULL,
  `user_name` VARCHAR(255) NULL,
  `client_id` VARCHAR(255) NULL,
  `oauth_access_tokencol` VARCHAR(255) NULL,
  `authentication` BLOB NULL,
  `refresh_token` VARCHAR(255) NULL)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `securitydb`.`oauth_refresh_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`oauth_refresh_token` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`oauth_refresh_token` (
  `token_id` VARCHAR(255) NULL,
  `token` BLOB NULL,
  `authentication` BLOB NULL)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `securitydb`.`oauth_code`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`oauth_code` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`oauth_code` (
  `code` VARCHAR(255) NULL,
  `authentication` BLOB NULL)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `securitydb`.`oauth_approval`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `securitydb`.`oauth_approval` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `securitydb`.`oauth_approval` (
  `user_id` VARCHAR(255) NULL,
  `client_id` VARCHAR(255) NULL,
  `scope` VARCHAR(255) NULL,
  `status` VARCHAR(10) NULL,
  `expired_at` DATE NULL,
  `last_modified_at` DATE NULL)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `securitydb`.`tbl_sec_users`
-- -----------------------------------------------------
START TRANSACTION;
USE `securitydb`;
-- password = Pica2020++ = $2a$10$1JhQJ58EH6CCzVwxCl1vcud5Eo3ivrlyT9hu2z28rbv.CA1yoWI/S
INSERT INTO `securitydb`.`tbl_sec_users` (`id_user`, `cedula`, `nombres`, `apellidos`, `direccion`, `fecha_nacimiento`, `telefono`, `email`, `username`, `password`, `enable`, `account_non_expired`, `credential_non_expired`, `account_non_locket`)
VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', 7946135, 'root', 'admin', 'Calle 123', '1970-11-20', 301638457, 'root@touresbalon.com', 'root', '$2a$10$1JhQJ58EH6CCzVwxCl1vcud5Eo3ivrlyT9hu2z28rbv.CA1yoWI/S', 'true', 'true', 'true', 'true');

COMMIT;

-- -----------------------------------------------------
-- Data for table `securitydb`.`tbl_sec_roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `securitydb`;
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('4072b81a-93f5-444a-9836-b52b40df8fea', 'ROLE_ADMIN');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('27c18367-7b7b-4c1f-a81a-37d9066c8a05', 'ROLE_USER');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('a0c955f4-19da-4369-960f-53547f73bc0b', 'ROLE_CLIENT');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('d7511f8a-82dd-4428-857e-5297c6af58f4', 'ROLE_GUEST');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('69ba4917-0a5d-49e1-a04c-831b7c56429b', 'ROLE_PRODUCTOS_CONSULTA');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('effb52b5-b466-4eb2-a57d-43ca445871f7', 'ROLE_PRODUCTOS_ADMON');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('68547678-c6e8-42a4-ac29-a8e332f27872', 'ROLE_CAMPANAS');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('82d4080b-ec0c-4689-a46d-9567468c1a54', 'ROLE_ORDENES_CONSULTA');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('03b81519-10d1-4b2b-b0ab-8bcd75f104dd', 'ROLE_ORDENES_ADMON');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('b457acd8-927a-44cf-b9d7-31787415b5d7', 'ROLE_CLIENTES_CONSULTA');
INSERT INTO `securitydb`.`tbl_sec_roles` (`id_role`, `role`) VALUES ('510e74f7-b7b8-4ef0-b510-07415486abc3', 'ROLE_CLIENTES_ADMON');

COMMIT;

-- -----------------------------------------------------
-- Data for table `securitydb`.`tbl_sec_user_roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `securitydb`;
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', '4072b81a-93f5-444a-9836-b52b40df8fea');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', '27c18367-7b7b-4c1f-a81a-37d9066c8a05');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', 'a0c955f4-19da-4369-960f-53547f73bc0b');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', 'd7511f8a-82dd-4428-857e-5297c6af58f4');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', '69ba4917-0a5d-49e1-a04c-831b7c56429b');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', 'effb52b5-b466-4eb2-a57d-43ca445871f7');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', '68547678-c6e8-42a4-ac29-a8e332f27872');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', '82d4080b-ec0c-4689-a46d-9567468c1a54');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', '03b81519-10d1-4b2b-b0ab-8bcd75f104dd');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', 'b457acd8-927a-44cf-b9d7-31787415b5d7');
INSERT INTO `securitydb`.`tbl_sec_user_roles` (`user_id`, `role_id`) VALUES ('d4f92a05-f414-4477-b19e-7f8bdef86917', '510e74f7-b7b8-4ef0-b510-07415486abc3');

COMMIT;

-- -----------------------------------------------------
-- Data for table `securitydb`.`oauth_client_details`
-- -----------------------------------------------------
START TRANSACTION;
USE `securitydb`;
-- client_secret = 0b78c28e-6abc-4252-85d1-214da95bc6ca = $2a$10$mTdkD//D6J9KXypMhyMzHOxJ3QRXiLWxj9qpBXGKft/bdhsU760la
INSERT INTO `securitydb`.`oauth_client_details` (`client_id`, `resource_id`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`)
VALUES ('89792737-705f-4358-a95b-744962644de4', 'oauth/pica', '$2a$10$mTdkD//D6J9KXypMhyMzHOxJ3QRXiLWxj9qpBXGKft/bdhsU760la', 'read,write', 'password,refresh_token,client_credentials', 'http://localhost:8086/MicroServices/', 'USER', 1200, 600, '', 'false');

-- client_secret = c56eceb0-88f7-4b41-a495-dc8c92e0f449 = $2a$10$OXEsYNtDpv2hTT9nymtx3ujAC3ItPiItGxSu0kOywn9Canxa6dQeW
INSERT INTO `securitydb`.`oauth_client_details` (`client_id`, `resource_id`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`)
VALUES ('4b4c6d63-0e7e-428b-b139-75e0c02b50f3', 'oauth/pica', '$2a$10$OXEsYNtDpv2hTT9nymtx3ujAC3ItPiItGxSu0kOywn9Canxa6dQeW', 'read,write', 'password,refresh_token,client_credentials', 'http://localhost:8086/MicroServices/', 'USER', 1200, 600, '', 'false');

COMMIT;