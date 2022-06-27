-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema e-lasGen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema e-lasGen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `e-lasGen` DEFAULT CHARACTER SET utf8 ;
USE `e-lasGen` ;

-- -----------------------------------------------------
-- Table `e-lasGen`.`tb_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-lasGen`.`tb_categorias` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(255) NOT NULL,
  `classe` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-lasGen`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-lasGen`.`tb_usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `sobrenome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-lasGen`.`tb_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-lasGen`.`tb_produtos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(1000) NOT NULL,
  `preco` DECIMAL(9,2) NOT NULL,
  `quantidade` INT NOT NULL,
  `imagem` VARCHAR(255) NOT NULL,
  `usuario_id` BIGINT NULL,
  `categoria_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_produtos_tb_usuarios_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_tb_produtos_tb_categorias1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produtos_tb_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `e-lasGen`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_tb_categorias1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `e-lasGen`.`tb_categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
