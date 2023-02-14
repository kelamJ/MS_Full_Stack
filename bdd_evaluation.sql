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
    FOREIGN KEY (panier_commande) REFERENCES Commande (com_id)
);

CREATE TABLE Fournisseur(
    fou_id      INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fou_nom     VARCHAR(50) NOT NULL,
    fou_adresse VARCHAR(100) NOT NULL,
    fou_cp      CHAR(5) NOT NULL,
    fou_ville   VARCHAR(50) NOT NULL,
    fou_tel     VARCHAR(10),
    fou_mail    VARCHAR(50),
    Type        BIT(1)
);

CREATE TABLE Rubrique(
    rub_id      INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rub_libelle VARCHAR(50) NOT NULL
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
    FOREIGN KEY (prod_fourni) REFERENCES Fournisseur (fou_id),
    FOREIGN KEY (prod_rubrique) REFERENCES Rubrique (rub_id)
);

ALTER TABLE Panier
ADD FOREIGN KEY (panier_produit) REFERENCES Produit (prod_code);

CREATE UNIQUE INDEX  nom_client_index
ON Client (cli_nom);

CREATE UNIQUE INDEX  date_com_index
ON Commande (com_date_com);

INSERT INTO Client (cli_nom, cli_prenom, cli_adresse, cli_cp, cli_ville)
VALUES
('Boudet', 'Abeau', '92, avenue Toussaint', 80600, 'DOULLENS'),
('Gaubert', 'Laurent', '1, rue Julie Maurice', 54460, 'LIVERDUN'),
('Jacquard', 'Jean-Charles', '83, avenue Gérard Payet', 59299, 'BOESCHEPE'),
('Vannier', 'Raymond', '51, rue Corinne Lacombe', 70200, 'ANDORNAY');
('Malet', 'Abeau', '6, boulevard Thibault Hebert', 02160, 'MEURIVAL'),
('Bossuet', 'Abeau', '6, impasse Lambert', 26170, 'PROPIAC'),
('Ménétries', 'Abeau', '1, chemin Paris', 47470, 'CAUZAC'),
('Baugé', 'Abeau', '53, chemin de Grondin', 67580, 'FORSTHEIM'),
('Cormier', 'Abeau', '88, rue Lelievre', 63320, 'VERRIERES'),
('Crépin', 'Abeau', '37, place Hamel', 78930, 'GUERVILLE');

INSERT INTO Fournisseur (fou_nom, fou_adresse, fou_cp, fou_ville)
VALUES
('Valeo','95, avenue Toussaint Chien', 80600, 'DOULLENS'),
('HyperU','11, rue Julien Maurices', 54460),
('Lamoule','8, avenue Gérard Petin', 59299),
('TapisVolant','55, rue Corinne Labombe', 70200);
('MosaiquePizza','66, boulevard Stephane Duchet', 02160),
