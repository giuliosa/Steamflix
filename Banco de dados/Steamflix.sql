-- MySQL Script generated by MySQL Workbench
-- Qui 21 Abr 2016 23:22:08 BRT
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Steamflix
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Steamflix
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Steamflix` DEFAULT CHARACTER SET utf8 ;
USE `Steamflix` ;

-- -----------------------------------------------------
-- Table `Steamflix`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Cliente` (
  `cpfCliente` VARCHAR(11) NOT NULL,
  `nomeCliente` VARCHAR(100) NOT NULL,
  `dataNascimentoCliente` DATE NOT NULL,
  `flagCliente` INT(11) NOT NULL,
  PRIMARY KEY (`cpfCliente`),
  UNIQUE INDEX `cpfCliente_UNIQUE` (`cpfCliente` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Cupom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Cupom` (
  `idCupom` INT(11) NOT NULL AUTO_INCREMENT,
  `valorCupom` DOUBLE(5,2) NOT NULL,
  `nomeCupom` VARCHAR(45) NOT NULL,
  `flagCupom` INT(11) NOT NULL,
  PRIMARY KEY (`idCupom`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Aluguel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Aluguel` (
  `idAluguel` INT(11) NOT NULL AUTO_INCREMENT,
  `dataAluguel` DATE NOT NULL,
  `dataDevolucaoAluguel` DATE NOT NULL,
  `idClienteAluguel` VARCHAR(11) NOT NULL,
  `precoAluguel` DOUBLE(5,2) NOT NULL,
  `idCupomAluguel` INT(11) NULL DEFAULT NULL,
  `flagAluguel` INT(11) NOT NULL,
  PRIMARY KEY (`idAluguel`),
  INDEX `idCupomAluguel_idx` (`idCupomAluguel` ASC),
  INDEX `idClienteAluguel_idx` (`idClienteAluguel` ASC),
  CONSTRAINT `idClienteAluguel`
    FOREIGN KEY (`idClienteAluguel`)
    REFERENCES `Steamflix`.`Cliente` (`cpfCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCupomAluguel`
    FOREIGN KEY (`idCupomAluguel`)
    REFERENCES `Steamflix`.`Cupom` (`idCupom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Fornecedor` (
  `cnpjFornecedor` VARCHAR(14) NOT NULL,
  `razaoSocialFornecedor` VARCHAR(300) NOT NULL,
  `nomeFantasiaFornecedor` VARCHAR(300) NOT NULL,
  `flagFornecedor` INT(11) NOT NULL,
  PRIMARY KEY (`cnpjFornecedor`),
  UNIQUE INDEX `cnpjFornecedor_UNIQUE` (`cnpjFornecedor` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Genero` (
  `idGenero` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeGenero` VARCHAR(45) NOT NULL,
  `flagGenero` INT(11) NOT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB
AUTO_INCREMENT = 43
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Filme` (
  `idFilme` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeFilme` VARCHAR(200) NOT NULL,
  `precoVendaFilme` DOUBLE(5,2) NOT NULL,
  `precoAluguelFilme` DOUBLE(5,2) NOT NULL,
  `notaFilme` VARCHAR(45) NOT NULL,
  `classificacaoFilme` VARCHAR(45) NOT NULL,
  `idGeneroFilme` INT(11) NOT NULL,
  `idFornecedorFilme` VARCHAR(14) NOT NULL,
  `dataLancamentoFilme` DATE NOT NULL,
  `diretorFilme` VARCHAR(45) NOT NULL,
  `quantidadeFilme` INT(11) NOT NULL,
  `flagFilme` INT(11) NOT NULL,
  PRIMARY KEY (`idFilme`),
  INDEX `idFornecedorFilme_idx` (`idFornecedorFilme` ASC),
  INDEX `idGenero_idx` (`idGeneroFilme` ASC),
  CONSTRAINT `idFornecedorFilme`
    FOREIGN KEY (`idFornecedorFilme`)
    REFERENCES `Steamflix`.`Fornecedor` (`cnpjFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGenero`
    FOREIGN KEY (`idGeneroFilme`)
    REFERENCES `Steamflix`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`AluguelFilme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`AluguelFilme` (
  `idAluguel` INT(11) NOT NULL,
  `idFilme` INT(11) NOT NULL,
  PRIMARY KEY (`idAluguel`, `idFilme`),
  INDEX `fk_Aluguel_has_Filme_Filme1_idx` (`idFilme` ASC),
  INDEX `fk_Aluguel_has_Filme_Aluguel1_idx` (`idAluguel` ASC),
  CONSTRAINT `fk_Aluguel_has_Filme_Aluguel1`
    FOREIGN KEY (`idAluguel`)
    REFERENCES `Steamflix`.`Aluguel` (`idAluguel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluguel_has_Filme_Filme1`
    FOREIGN KEY (`idFilme`)
    REFERENCES `Steamflix`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Jogo` (
  `idJogo` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeJogo` VARCHAR(200) NOT NULL,
  `precoVendaJogo` DOUBLE(5,2) NOT NULL,
  `precoAluguelJogo` DOUBLE(5,2) NOT NULL,
  `notaJogo` VARCHAR(45) NOT NULL,
  `classificacaoJogo` VARCHAR(45) NOT NULL,
  `idGeneroJogo` INT(11) NOT NULL,
  `idFornecedorJogo` VARCHAR(14) NOT NULL,
  `dataLancamentoJogo` DATE NOT NULL,
  `desenvolvedorJogo` VARCHAR(45) NOT NULL,
  `quantidadeJogo` INT(11) NOT NULL,
  `flagJogo` INT(11) NOT NULL,
  PRIMARY KEY (`idJogo`),
  INDEX `idFornecedorFilme_idx` (`idFornecedorJogo` ASC),
  INDEX `idGeneroJogo_idx` (`idGeneroJogo` ASC),
  CONSTRAINT `idFornecedorJogo`
    FOREIGN KEY (`idFornecedorJogo`)
    REFERENCES `Steamflix`.`Fornecedor` (`cnpjFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGeneroJogo`
    FOREIGN KEY (`idGeneroJogo`)
    REFERENCES `Steamflix`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`AluguelJogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`AluguelJogo` (
  `idAluguel` INT(11) NOT NULL,
  `idJogo` INT(11) NOT NULL,
  PRIMARY KEY (`idAluguel`, `idJogo`),
  INDEX `fk_Aluguel_has_Jogo_Jogo1_idx` (`idJogo` ASC),
  INDEX `fk_Aluguel_has_Jogo_Aluguel1_idx` (`idAluguel` ASC),
  CONSTRAINT `fk_Aluguel_has_Jogo_Aluguel1`
    FOREIGN KEY (`idAluguel`)
    REFERENCES `Steamflix`.`Aluguel` (`idAluguel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluguel_has_Jogo_Jogo1`
    FOREIGN KEY (`idJogo`)
    REFERENCES `Steamflix`.`Jogo` (`idJogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Cadastro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Cadastro` (
  `idCadastro` INT(11) NOT NULL AUTO_INCREMENT,
  `loginCadastro` VARCHAR(45) NOT NULL,
  `senhaCadastro` VARCHAR(45) NOT NULL,
  `emailCadastro` VARCHAR(50) NOT NULL,
  `emailSecundarioCadastro` VARCHAR(50) NULL DEFAULT NULL,
  `telefoneFixoCadastro` VARCHAR(11) NULL DEFAULT NULL,
  `telefoneCelularCadastro` VARCHAR(11) NULL DEFAULT NULL,
  `idClienteCadastro` VARCHAR(11) NULL DEFAULT NULL,
  `idFornecedorCadastro` VARCHAR(14) NULL DEFAULT NULL,
  `flagCadastro` INT(11) NOT NULL,
  PRIMARY KEY (`idCadastro`),
  INDEX `idClienteCadastro_idx` (`idClienteCadastro` ASC),
  INDEX `idFornecedorCadastro_idx` (`idFornecedorCadastro` ASC),
  CONSTRAINT `idClienteCadastro`
    FOREIGN KEY (`idClienteCadastro`)
    REFERENCES `Steamflix`.`Cliente` (`cpfCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idFornecedorCadastro`
    FOREIGN KEY (`idFornecedorCadastro`)
    REFERENCES `Steamflix`.`Fornecedor` (`cnpjFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Compra` (
  `idCompra` INT(11) NOT NULL AUTO_INCREMENT,
  `dataCompra` DATE NOT NULL,
  `idClienteCompra` VARCHAR(11) NOT NULL,
  `precoCompra` DOUBLE(7,2) NOT NULL,
  `idCupomCompra` INT(11) NULL DEFAULT NULL,
  `flagCompra` INT(11) NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `idClienteAluguel_idx` (`idClienteCompra` ASC),
  INDEX `idCupomCompa_idx` (`idCupomCompra` ASC),
  CONSTRAINT `idClienteCompra`
    FOREIGN KEY (`idClienteCompra`)
    REFERENCES `Steamflix`.`Cliente` (`cpfCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCupomCompa`
    FOREIGN KEY (`idCupomCompra`)
    REFERENCES `Steamflix`.`Cupom` (`idCupom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`CompraFilme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`CompraFilme` (
  `idCompra` INT(11) NOT NULL,
  `idFilme` INT(11) NOT NULL,
  PRIMARY KEY (`idCompra`, `idFilme`),
  INDEX `fk_Compra_has_Filme_Filme1_idx` (`idFilme` ASC),
  INDEX `fk_Compra_has_Filme_Compra1_idx` (`idCompra` ASC),
  CONSTRAINT `fk_Compra_has_Filme_Compra1`
    FOREIGN KEY (`idCompra`)
    REFERENCES `Steamflix`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_has_Filme_Filme1`
    FOREIGN KEY (`idFilme`)
    REFERENCES `Steamflix`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`CompraJogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`CompraJogo` (
  `idCompra` INT(11) NOT NULL,
  `idJogo` INT(11) NOT NULL,
  PRIMARY KEY (`idCompra`, `idJogo`),
  INDEX `fk_Compra_has_Jogo_Jogo1_idx` (`idJogo` ASC),
  INDEX `fk_Compra_has_Jogo_Compra1_idx` (`idCompra` ASC),
  CONSTRAINT `fk_Compra_has_Jogo_Compra1`
    FOREIGN KEY (`idCompra`)
    REFERENCES `Steamflix`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_has_Jogo_Jogo1`
    FOREIGN KEY (`idJogo`)
    REFERENCES `Steamflix`.`Jogo` (`idJogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Steamflix`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Steamflix`.`Endereco` (
  `idEndereco` INT(11) NOT NULL AUTO_INCREMENT,
  `logradouroEndereco` VARCHAR(300) NOT NULL,
  `numeroEndereco` VARCHAR(45) NOT NULL,
  `complementoEndereco` VARCHAR(45) NULL DEFAULT NULL,
  `bairroEndereco` VARCHAR(100) NOT NULL,
  `cidadeEndereco` VARCHAR(45) NOT NULL,
  `estadoEndereco` VARCHAR(45) NOT NULL,
  `paisEndereco` VARCHAR(20) NOT NULL,
  `cepEndereco` VARCHAR(9) NOT NULL,
  `idClienteEndereco` VARCHAR(11) NULL DEFAULT NULL,
  `idFornecedorEndereco` VARCHAR(14) NULL DEFAULT NULL,
  `flagEndereco` INT(11) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  UNIQUE INDEX `idEndereco_UNIQUE` (`idEndereco` ASC),
  INDEX `idFornecedorEndereco_idx` (`idFornecedorEndereco` ASC),
  INDEX `idClienteEndereco_idx` (`idClienteEndereco` ASC),
  CONSTRAINT `idClienteEndereco`
    FOREIGN KEY (`idClienteEndereco`)
    REFERENCES `Steamflix`.`Cliente` (`cpfCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idFornecedorEndereco`
    FOREIGN KEY (`idFornecedorEndereco`)
    REFERENCES `Steamflix`.`Fornecedor` (`cnpjFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
