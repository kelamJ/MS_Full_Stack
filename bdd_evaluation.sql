DROP DATABASE IF EXISTS `evaluationBDD`;

CREATE DATABASE `evaluationBDD`;

USE `evaluationBDD`;

CREATE TABLE Client(
    cli_id      INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Type        BIT(1),
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
    EditionFacture  BIT(1),
    com_client      INT NOT NULL,
    FOREIGN KEY (com_client) REFERENCES Client (cli_id)
);

CREATE TABLE Panier(
    comp_qte_produit        INT NOT NULL, 
    comp_prix_vente_par     FLOAT NOT NULL,
    comp_prix_vente_pro     FLOAT NOT NULL,
    panier_produit          CHAR(6) NOT NULL,
    panier_commande         INT NOT NULL,
    PRIMARY KEY (panier_produit, panier_commande),
    FOREIGN KEY (panier_commande ) REFERENCES Commande (com_id)
);

CREATE TABLE Produit(
    prod_code           CHAR(6) NOT NULL PRIMARY KEY,
    prod_libelle        VARCHAR(100) NOT NULL,
    prod_description    VARCHAR(250) NOT NULL,
    prod_photo          VARCHAR(250) NOT NULL,
    Affichage           BIT(1),
    prod_prix           INT NOT NULL,
    prod_stkphy         INT NOT NULL,
    prod_stkale         INT NOT NULL,
    prod_fourni         INT NOT NULL,
    prod_rubrique       INT NOT NULL,
    FOREIGN KEY (prod_code) REFERENCES Panier (panier_produit)
);

CREATE TABLE Fournisseur(
    fou_id      INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fou_nom     VARCHAR(50) NOT NULL,
    fou_adresse VARCHAR(100) NOT NULL,
    fou_cp      CHAR(5) NOT NULL,
    fou_ville   VARCHAR(50) NOT NULL,
    fou_tel     VARCHAR(10),
    fou_mail    VARCHAR(50),
    Type        BIT(1),
    FOREIGN KEY (fou_id) REFERENCES Produit (prod_fourni)
);

CREATE TABLE Rubrique(
    rub_id      INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rub_libelle VARCHAR(50) NOT NULL,
    FOREIGN KEY (rub_id) REFERENCES Produit (prod_rubrique)
);