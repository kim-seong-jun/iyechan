-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db10
-- -----------------------------------------------------
DROP DATABASE IF EXISTS db10;
-- -----------------------------------------------------
-- Schema db10
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db10` DEFAULT CHARACTER SET utf8 ;
USE `db10` ;

-- -----------------------------------------------------
-- Table `db10`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db10`.`member` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `post` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `detailAddress` VARCHAR(45) NULL,
  `status` INT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db10`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db10`.`board` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `contents` VARCHAR(1000) NULL,
  `writer` INT NOT NULL,
  `regdate` DATETIME NOT NULL,
  `chgdate` DATETIME NULL,
  `views` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`no`),
  INDEX `fk_board_member_idx` (`writer` ASC) VISIBLE,
  CONSTRAINT `fk_board_member`
    FOREIGN KEY (`writer`)
    REFERENCES `db10`.`member` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db10`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db10`.`orders` (
  `orderNo` INT NOT NULL AUTO_INCREMENT,
  `member` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `isAllergie` TINYINT NOT NULL,
  `allergieName` VARCHAR(45) NULL,
  `post` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `detailAddress` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `bankInfo` VARCHAR(45) NULL,
  `receiveType` VARCHAR(45) NULL,
  `infoPath` VARCHAR(45) NULL,
  `regDate` DATETIME NOT NULL,
  `chgDate` DATETIME NULL,
  `status` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`orderNo`),
  INDEX `fk_order_member_idx` (`member` ASC) VISIBLE,
  CONSTRAINT `fk_order_member`
    FOREIGN KEY (`member`)
    REFERENCES `db10`.`member` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db10`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db10`.`menu` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `week` INT NOT NULL,
  `menuSeq` INT NULL,
  `menuName` VARCHAR(45) NULL,
  `menuImg` BLOB NULL,
  `menuDetail` VARCHAR(300) NULL,
  `regDate` DATETIME NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

show tables;

insert into member(id,password,name,tel) values('admin','admin','admin','010-2222-3333');
insert into member(no,id,password,name,tel) values(9999,'guest','guest','guest','');
insert into member(id,password,name,tel) values('id1','p1','김국진','010-2222-3333');
insert into member(id,password,name,tel) values('id2','p2','김구라','010-2222-3333');
insert into member(id,password,name,tel) values('id3','p3','안영미','010-2222-3333');

insert into board(title,contents,writer,regdate) values('제목1','내용1',1,sysdate());
insert into board(title,contents,writer,regdate) values('제목2','내용2',2,sysdate());
insert into board(title,contents,writer,regdate) values('제목3','내용3',3,sysdate());

use db10;
select * from member;
select * from board;
delete  from board;
select * from orders;
select * from menu;

delete from board where no=2;
select no from member where id="guest";
update member set no=0 where id="guest";