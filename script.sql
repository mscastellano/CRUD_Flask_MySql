SET FOREIGN_KEY_CHECKS=0
;

DROP TABLE IF EXISTS `cantones` CASCADE
;

DROP TABLE IF EXISTS `colegios` CASCADE
;

DROP TABLE IF EXISTS `parroquias` CASCADE
;

DROP TABLE IF EXISTS `provincias` CASCADE
;

CREATE TABLE `cantones`
(
	`id` INT NOT NULL,
	`provincia_id` INT NOT NULL,
	`inec` VARBINARY(50) NOT NULL,
	`nombre` VARCHAR(50) NOT NULL,
	`tamanio` FLOAT(11,2) NOT NULL,
	`habitantes` INT NOT NULL,
	`hombres` INT NOT NULL,
	`mujeres` INT NOT NULL,
	`alcalde` VARCHAR(50) NOT NULL,
	`fecha` DATE NOT NULL,
	CONSTRAINT `PK_Cantones` PRIMARY KEY (`id` ASC)
)
;

CREATE TABLE `colegios`
(
	`id` INT NOT NULL,
	`parroquia_id` INT NOT NULL,
	`nombre` VARCHAR(50) NOT NULL,
	`direccion` VARCHAR(50) NOT NULL,
	`telefono` VARCHAR(50) NOT NULL,
	`rector` VARCHAR(50) NOT NULL,
	`secretaria` VARCHAR(50) NOT NULL,
	`internet` BOOL NOT NULL,
	CONSTRAINT `PK_colegios` PRIMARY KEY (`id` ASC)
)
;

CREATE TABLE `parroquias`
(
	`id` INT NOT NULL,
	`canton_id` INT NOT NULL,
	`nombre` VARCHAR(50) NOT NULL,
	`tipo` VARCHAR(1) NOT NULL,
	`tamanio` FLOAT(11,2) NOT NULL,
	`habitantes` INT NOT NULL,
	`hombres` INT NOT NULL,
	`mujeres` INT NOT NULL,
	`presidente` VARCHAR(50) NOT NULL,
	`fecha` DATE NOT NULL,
	CONSTRAINT `PK_parroquias` PRIMARY KEY (`id` ASC)
)
;

CREATE TABLE `provincias`
(
	`id` INT NOT NULL,
	`nombre` VARCHAR(50) NOT NULL,
	`tamaño` FLOAT(11,2) NOT NULL,
	`habitantes` INT NOT NULL,
	`hombres` INT NOT NULL,
	`mujeres` INT NOT NULL,
	`prefecto` VARCHAR(50) NOT NULL,
	`fecha` DATE NOT NULL,
	CONSTRAINT `PK_Provincias` PRIMARY KEY (`id` ASC)
)
;

ALTER TABLE `cantones` 
 ADD INDEX `IXFK_cantones_provincias` (`provincia_id` ASC)
;

ALTER TABLE `colegios` 
 ADD INDEX `IXFK_colegios_parroquias` (`parroquia_id` ASC)
;

ALTER TABLE `parroquias` 
 ADD INDEX `IXFK_parroquias_cantones` (`canton_id` ASC)
;

ALTER TABLE `cantones` 
 ADD CONSTRAINT `FK_cantones_provincias`
	FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `colegios` 
 ADD CONSTRAINT `FK_colegios_parroquias`
	FOREIGN KEY (`parroquia_id`) REFERENCES `parroquias` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `parroquias` 
 ADD CONSTRAINT `FK_parroquias_cantones`
	FOREIGN KEY (`canton_id`) REFERENCES `cantones` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1
;

