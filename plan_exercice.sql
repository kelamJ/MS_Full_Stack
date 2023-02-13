DROP DATABASE IF EXIST `exercice`;

CREATE DATABASE `exercice`;

USE `exercice`;

CREATE TABLE Client(
    cli_num     INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cli_nom     VARCHAR(50),
    cli_adresse VARCHAR(50),
    cli_tel     VARCHAR(30)
);

CREATE TABLE Commande(
    com_num     INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cli_num     INT NOT NULL,
    com_date    DATE NOT NULL,
    com_obs     VARCHAR(50),
    FOREIGN KEY (cli_num) REFERENCES Client (cli_num)
); 

CREATE TABLE Detail(
    com_num     INT NOT NULL,
    pro_num     INT NOT NULL,
    det_qte     INT NOT NULL,
    PRIMARY KEY (com_num, pro_num)
); 

CREATE TABLE Produit(
    pro_num         INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pro_libelle     VARCHAR(50) NOT NULL,
    pro_description VARCHAR(50)
); 