DROP DATABASE IF EXIST `evaluationBDD`;

CREATE DATABASE `evaluationBDD`;

USE `evaluationBDD`;

CREATE TABLE Client(
    cli_id      INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cli_nom     VARCHAR(50) NOT NULL,
    cli_prenom  VARCHAR(50) NOT NULL,
    cli_adresse VARCHAR(100),
    cli_cp      CHAR(5) NOT NULL,
    cli_ville   VARCHAR(50) NOT NULL,
    cli_tel     VARCHAR(10),
    cli_mail    VARCHAR(50)
);

CREATE TABLE Commande(
    com_id          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    com_date_com    DATE NOT NULL,
    com_date_liv    DATE NOT NULL,
    com_etatcom     VARCHAR(25),
    com_client      INT NOT NULL,
    FOREIGN KEY (com_client) REFERENCES Client (cli_id)
);

CREATE TABLE Panier(
    comp_qte_produit        INT NOT NULL 
    comp_prix_vente_par     FLOAT NOT NULL,
    comp_prix_vente_pro     FLOAT NOT NULL,
    panier_produit          CHAR(6) NOT NULL,
    panier_commande         INT NOT NULL,
    PRIMARY KEY (panier_produit, panier_commande)
);

CREATE TABLE Produit(
    prod_code       INT NOT NULL 
    prod_libelle     FLOAT NOT NULL,
    prod_description     FLOAT NOT NULL,
    prod_photo          CHAR(6) NOT NULL,
    panier_commande         INT NOT NULL,
    PRIMARY KEY (panier_produit, panier_commande)
);