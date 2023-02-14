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
('Vannier', 'Raymond', '51, rue Corinne Lacombe', 70200, 'ANDORNAY'),
('Malet', 'Abeau', '6, boulevard Thibault Hebert', 02160, 'MEURIVAL'),
('Bossuet', 'Abeau', '6, impasse Lambert', 26170, 'PROPIAC'),
('Ménétries', 'Abeau', '1, chemin Paris', 47470, 'CAUZAC'),
('Baugé', 'Abeau', '53, chemin de Grondin', 67580, 'FORSTHEIM'),
('Cormier', 'Abeau', '88, rue Lelievre', 63320, 'VERRIERES'),
('Crépin', 'Abeau', '37, place Hamel', 78930, 'GUERVILLE');

INSERT INTO Fournisseur (fou_nom, fou_adresse, fou_cp, fou_ville)
VALUES
('Valeo','95, avenue Toussaint Chien', 26170, 'PROPIAC'),
('HyperU','11, rue Julien Maurices', 47470, 'CAUZAC'),
('Lamoule','8, avenue Gérard Petin', 67580, 'FORSTHEIM'),
('TapisVolant','55, rue Corinne Labombe', 63320, 'VERRIERES'),
('MosaiquePizza','66, boulevard Stephane Duchet', 78930, 'GUERVILLE');


INSERT INTO Produit (prod_code, prod_libelle, prod_prix, prod_stkphy, prod_stkale)
VALUES
('AB8756', 'Chips', 5, 500, 250),
('AB8654', 'Lait', 2, 350, 150),
('AB8759', 'Farine', 1, 350, 250),
('AB8757', 'Fromage', 6, 350, 150),
('AB8753', 'Pomme', 2, 550, 300),
('AB8751', 'Carte', 5, 50, 25),
('AB8745', 'Chien', 150, 30, 15),
('AB8796', 'Banane', 1, 500, 250),
('AB8778', 'Chat', 500, 50, 25),
('AC8736', 'Peluche', 35, 50, 25),
('AB8766', 'Ortie', 3, 5000, 2500),
('AD8788', 'Sanglier', 66, 50, 25),
('AB8733', 'Peau', 8, 500, 250),
('AB8744', 'Miroir', 22, 50, 25),
('AB8755', 'Artichaut', 3, 500, 250),
('AB8854', 'Miel', 5, 5000, 2500),
('AB8164', 'Fourchette', 4,  500, 205),
('CB8349', 'Couteau', 4, 500, 205),
('AB8789', 'Asiette', 6, 500, 205),
('AB8436', 'Kiwi', 1, 500, 205);