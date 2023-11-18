-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_sorveteria
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `db_sorveteria` DEFAULT CHARACTER SET utf8 ;
USE `db_sorveteria` ;

-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbEndereco`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbEndereco`
 (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(20) NOT NULL,
  `rua` VARCHAR(100) NULL,
  `numero` INT NULL,
  `complemento` VARCHAR(15) NULL,
  `bairro` VARCHAR(45) NULL,
  PRIMARY KEY (`idEndereco`)
  );
  


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbCliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `isDeleted` TINYINT NULL DEFAULT 0,
  `nomeCliente` VARCHAR(50) NOT NULL,
  `emailCliente` VARCHAR(50) NOT NULL,
  `senhaCliente` VARCHAR(255) NOT NULL,
  `telefoneCliente` VARCHAR(15) NOT NULL,
  `tbEndereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `tbEndereco_idEndereco`),
   CONSTRAINT `fk_tbCliente_tbEndereco1`
    FOREIGN KEY (`tbEndereco_idEndereco`)
    REFERENCES `db_sorveteria`.`tbEndereco` (`idEndereco`));



-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbFuncionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbFuncionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `isDeleted` TINYINT NULL DEFAULT 0,
  `isAdm` TINYINT NOT NULL,
  `nomeFuncionario` VARCHAR(50) NOT NULL,
  `telefoneFuncionario` VARCHAR(11) NULL,
  `usuarioFuncionario` VARCHAR(50) NOT NULL,
  `senhaFuncionario` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`idFuncionario`));


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbPedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `dataPedido` DATE NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `statusEntrega` VARCHAR(20) NULL,
  `isRealizadoOnline` CHAR(1) NOT NULL,
  `tbCliente_tbEndereco_idEndereco` INT NOT NULL,
  `tbFuncionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `tbCliente_tbEndereco_idEndereco`, `tbFuncionario_idFuncionario`),
  CONSTRAINT `fk_tbPedido_tbCliente1`
    FOREIGN KEY (`tbCliente_tbEndereco_idEndereco`)
    REFERENCES `db_sorveteria`.`tbCliente` (`tbEndereco_idEndereco`),
  CONSTRAINT `fk_tbPedido_tbFuncionario1`
    FOREIGN KEY (`tbFuncionario_idFuncionario`)
    REFERENCES `db_sorveteria`.`tbFuncionario` (`idFuncionario`)
    );


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbProduto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `isDeleted` TINYINT NULL DEFAULT 0,
  `isActive` TINYINT NULL DEFAULT 0,
  `nomeProduto` VARCHAR(50) NOT NULL,
  `tipoProduto` VARCHAR(20) NOT NULL,
  `fotoProduto` VARCHAR(90) NULL,
  `precoProduto` DECIMAL(10,2) NOT NULL,
  `tbVariacaoProdutos_idVariacao` INT NOT NULL,
  PRIMARY KEY (`idProduto`, `tbVariacaoProdutos_idVariacao`));


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbVariacaoProdutos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbVariacaoProdutos` (
  `idVariacao` INT NOT NULL AUTO_INCREMENT,
  `isActive` TINYINT NULL DEFAULT 0,
  `nome` VARCHAR(50) NOT NULL,
  `preco` DECIMAL(12,2) NULL,
  `tbProduto_idProduto` INT NOT NULL,
  `tbProduto_tbVariacaoProdutos_idVariacao` INT NOT NULL,
  PRIMARY KEY (`idVariacao`),
  CONSTRAINT `fk_tbVariacaoProdutos_tbProduto1`
    FOREIGN KEY (`tbProduto_idProduto` , `tbProduto_tbVariacaoProdutos_idVariacao`)
    REFERENCES `db_sorveteria`.`tbProduto` (`idProduto` , `tbVariacaoProdutos_idVariacao`)
    );


-- -----------------------------------------------------
-- Table `db_sorveteria`.`tbPedido_has_tbProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sorveteria`.`tbPedido_has_tbProduto` (
  `tbPedido_idPedido` INT NOT NULL,
  `tbProduto_idProduto` INT NOT NULL,
  `tbProduto_tbVariacaoProdutos_idVariacao` INT NOT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`tbPedido_idPedido`, `tbProduto_idProduto`, `tbProduto_tbVariacaoProdutos_idVariacao`),
  CONSTRAINT `fk_tbPedido_has_tbProduto_tbPedido1`
    FOREIGN KEY (`tbPedido_idPedido`)
    REFERENCES `db_sorveteria`.`tbPedido` (`idPedido`), 
  CONSTRAINT `fk_tbPedido_has_tbProduto_tbProduto1`
    FOREIGN KEY (`tbProduto_idProduto` , `tbProduto_tbVariacaoProdutos_idVariacao`)
    REFERENCES `db_sorveteria`.`tbProduto` (`idProduto` , `tbVariacaoProdutos_idVariacao`));


-- -----------------------------------------------------
-- CRUD tbCliente
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE SP_CreateCliente(
	cepEnd varchar(20), ruaEnd varchar(100), numeroEnd int, complementoEnd varchar(15), bairroEnd varchar(45),
    nomeClie varchar(50), emailClie varchar(50), senhaClie varchar(255), telefoneClie varchar(15)
)
BEGIN
	IF EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
		INSERT INTO tbEndereco(`cep`, `rua`, `numero`, `complemento`, `bairro`) 
		VALUES (cepEnd, ruaEnd, numeroEnd, complementoEnd, bairroEnd
		);
        SET @last_id_in_tbEndereco = LAST_INSERT_ID();
        INSERT INTO tbCliente(
			`nomeCliente`,
			`emailCliente`,
			`senhaCliente`,
			`telefoneCliente`,
			`tbEndereco_idEndereco`) 
		VALUES (nomeClie, emailClie, senhaClie, telefoneClie, @last_id_in_tbEndereco
		);
        SELECT '201' AS 'Status', '' AS 'Error', 'SUCCESS_CREATED' AS 'Message';
	END IF; 
END;
//

call SP_CreateCliente(
	'07061-002', 'Av. ', 3845, 'Apt 72', 'Bairro Povão',
    'Mafe', 'rodrigo@gmail.com', 'jhkagkfasgkgafgwequiuijkasaa1', '(11) 99999-9999'
);

describe tbCliente;

insert into tbEndereco(
	`cep`, 
    `rua`, 
    `numero`, 
    `complemento`, 
    `bairro`) 
values ('07000-000',
	'Rua',
	'28',
	'CS 03',
	'Sítio dos Mortos'
);

insert into tbCliente(
	`nomeCliente`,
	`emailCliente`,
	`senhaCliente`,
	`telefoneCliente`,
	`tbEndereco_idEndereco`) 
values ('Nome',
	'Email',
	'hasjlhdsaldaslAHDA$#%@&@JKFIS',
	'(11) 99999-9999',
	'1'
);

select * from tbCliente;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
