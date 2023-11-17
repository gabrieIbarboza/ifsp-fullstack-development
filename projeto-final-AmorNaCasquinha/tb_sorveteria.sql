-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_sorveteria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_sorveteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_sorveteria` DEFAULT CHARACTER SET utf8 ;
USE `db_sorveteria` ;

-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbEndereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbEndereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(50) NOT NULL,
  `rua` VARCHAR(11) NULL,
  `numero` INT NULL,
  `complemento` VARCHAR(15) NULL,
  `bairro` VARCHAR(45) NULL,
  PRIMARY KEY (`idEndereco`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idEndereco` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbCliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `isDeleted` CHAR(1) NULL,
  `nomeCliente` VARCHAR(50) NOT NULL,
  `emailCliente` VARCHAR(50) NOT NULL,
  `senhaCliente` VARCHAR(8) NOT NULL,
  `telefoneCliente` VARCHAR(11) NOT NULL,
  `tbEndereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `tbEndereco_idEndereco`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE,
  INDEX `fk_tbCliente_tbEndereco1_idx` (`tbEndereco_idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_tbCliente_tbEndereco1`
    FOREIGN KEY (`tbEndereco_idEndereco`)
    REFERENCES `db_sorveteria`.`tbEndereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbFuncionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbFuncionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `isDeleted` CHAR(1) NULL,
  `isAdm` CHAR(1) NOT NULL,
  `nomeFuncionario` VARCHAR(50) NOT NULL,
  `telefoneFuncionario` VARCHAR(11) NULL,
  `usuarioFuncionario` VARCHAR(50) NOT NULL,
  `senhaFuncionario` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idFuncionario` ASC) VISIBLE,
  UNIQUE INDEX `usuarioFuncionario_UNIQUE` (`usuarioFuncionario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbPedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `isDeleted` CHAR(1) NULL,
  `idCliente` INT NULL,
  `idFuncionario` INT NULL,
  `dataPedido` DATE NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `statusEntrega` VARCHAR(20) NULL,
  `isRealizadoOnline` CHAR(1) NOT NULL,
  `tbCliente_idCliente` INT NOT NULL,
  `tbCliente_tbEndereco_idEndereco` INT NOT NULL,
  `tbFuncionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `tbCliente_idCliente`, `tbCliente_tbEndereco_idEndereco`, `tbFuncionario_idFuncionario`),
  UNIQUE INDEX `idPedido_UNIQUE` (`idPedido` ASC) VISIBLE,
  INDEX `fk_tbPedido_tbCliente1_idx` (`tbCliente_idCliente` ASC, `tbCliente_tbEndereco_idEndereco` ASC) VISIBLE,
  INDEX `fk_tbPedido_tbFuncionario1_idx` (`tbFuncionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_tbPedido_tbCliente1`
    FOREIGN KEY (`tbCliente_idCliente` , `tbCliente_tbEndereco_idEndereco`)
    REFERENCES `db_sorveteria`.`tbCliente` (`idCliente` , `tbEndereco_idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbPedido_tbFuncionario1`
    FOREIGN KEY (`tbFuncionario_idFuncionario`)
    REFERENCES `db_sorveteria`.`tbFuncionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbVariacaoProdutos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbVariacaoProdutos` (
  `idVariacao` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  `idProduto` INT NULL,
  PRIMARY KEY (`idVariacao`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idVariacao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbProduto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(50) NOT NULL,
  `tipoProduto` VARCHAR(20) NOT NULL,
  `fotoProduto` VARCHAR(90) NULL,
  `precoProduto` DECIMAL(10,2) NOT NULL,
  `tbVariacaoProdutos_idVariacao` INT NOT NULL,
  PRIMARY KEY (`idProduto`, `tbVariacaoProdutos_idVariacao`),
  INDEX `fk_tbProduto_tbVariacaoProdutos1_idx` (`tbVariacaoProdutos_idVariacao` ASC) VISIBLE,
  CONSTRAINT `fk_tbProduto_tbVariacaoProdutos1`
    FOREIGN KEY (`tbVariacaoProdutos_idVariacao`)
    REFERENCES `db_sorveteria`.`tbVariacaoProdutos` (`idVariacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbItensPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbItensPedido` (
  `idItem` INT NOT NULL AUTO_INCREMENT,
  `idPedido` INT NULL,
  `idVariacao` INT NULL,
  `quantidade` INT NOT NULL,
  `subTotal` DECIMAL(10,2) NULL,
  `tbPedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`idItem`),
  INDEX `fk_tbItensPedido_tbPedido1_idx` (`tbPedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_tbItensPedido_tbPedido1`
    FOREIGN KEY (`tbPedido_idPedido`)
    REFERENCES `db_sorveteria`.`tbPedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbPedidos_Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbPedidos_Produtos` (
  `tbPedido_idPedido` INT NOT NULL,
  `tbPedido_tbCliente_idCliente` INT NOT NULL,
  `tbPedido_tbCliente_tbEndereco_idEndereco` INT NOT NULL,
  `tbPedido_tbFuncionario_idFuncionario` INT NOT NULL,
  `tbProduto_idProduto` INT NOT NULL,
  `tbProduto_tbVariacaoProdutos_idVariacao` INT NOT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`tbPedido_idPedido`, `tbPedido_tbCliente_idCliente`, `tbPedido_tbCliente_tbEndereco_idEndereco`, `tbPedido_tbFuncionario_idFuncionario`, `tbProduto_idProduto`, `tbProduto_tbVariacaoProdutos_idVariacao`),
  INDEX `fk_tbPedido_has_tbProduto_tbProduto1_idx` (`tbProduto_idProduto` ASC, `tbProduto_tbVariacaoProdutos_idVariacao` ASC) VISIBLE,
  INDEX `fk_tbPedido_has_tbProduto_tbPedido1_idx` (`tbPedido_idPedido` ASC, `tbPedido_tbCliente_idCliente` ASC, `tbPedido_tbCliente_tbEndereco_idEndereco` ASC, `tbPedido_tbFuncionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_tbPedido_has_tbProduto_tbPedido1`
    FOREIGN KEY (`tbPedido_idPedido` , `tbPedido_tbCliente_idCliente` , `tbPedido_tbCliente_tbEndereco_idEndereco` , `tbPedido_tbFuncionario_idFuncionario`)
    REFERENCES `db_sorveteria`.`tbPedido` (`idPedido` , `tbCliente_idCliente` , `tbCliente_tbEndereco_idEndereco` , `tbFuncionario_idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbPedido_has_tbProduto_tbProduto1`
    FOREIGN KEY (`tbProduto_idProduto` , `tbProduto_tbVariacaoProdutos_idVariacao`)
    REFERENCES `db_sorveteria`.`tbProduto` (`idProduto` , `tbVariacaoProdutos_idVariacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
