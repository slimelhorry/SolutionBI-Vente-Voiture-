-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-29 09:27:03.573

-- tables
-- Table: Dim_Depot
CREATE TABLE Dim_Depot (
    pk_depot int  NOT NULL,
    code_depot nvarchar(255)  NOT NULL,
    superficie_m2_depot int  NOT NULL,
    CONSTRAINT Dim_Depot_pk PRIMARY KEY  (pk_depot)
);

-- Table: Dim_Fournisseur
CREATE TABLE Dim_Fournisseur (
    pk_fournisseur int  NOT NULL,
    code_fournisseur nvarchar(255)  NOT NULL,
    nom_fournisseur nvarchar(255)  NOT NULL,
    CONSTRAINT Dim_Fournisseur_pk PRIMARY KEY  (pk_fournisseur)
);

-- Table: Dim_Pays
CREATE TABLE Dim_Pays (
    pk_pays int  NOT NULL,
    code_pays nvarchar(255)  NOT NULL,
    population_pays int  NOT NULL,
    pays nvarchar(255)  NOT NULL,
    CONSTRAINT Dim_Pays_pk PRIMARY KEY  (pk_pays)
);

-- Table: Dim_article_achat
CREATE TABLE Dim_article_achat (
    pk_article int  NOT NULL,
    code_article nvarchar(255)  NOT NULL,
    libelle_article nvarchar(255)  NOT NULL,
    categorie_article nvarchar(255)  NOT NULL,
    decrption_article nvarchar(255)  NOT NULL,
    CONSTRAINT Dim_article_achat_pk PRIMARY KEY  (pk_article)
);

-- Table: Dim_client
CREATE TABLE Dim_client (
    pk_client int  NOT NULL,
    code_client nvarchar(255)  NOT NULL,
    fullname_client nvarchar(255)  NOT NULL,
    date_naissance_client date  NOT NULL,
    fonction_client nvarchar(255)  NOT NULL,
    situation_familiale_client nvarchar(255)  NOT NULL,
    sexe_client nvarchar(255)  NOT NULL,
    code_concessionaire nvarchar(255)  NOT NULL,
    libelle_concessionnaire  nvarchar(255)  NOT NULL,
    CONSTRAINT Dim_client_pk PRIMARY KEY  (pk_client)
);

-- Table: Dim_date
CREATE TABLE Dim_date (
    pk_date int  NOT NULL,
    Date datetime  NOT NULL,
    FullDate char(10)  NOT NULL,
    DayOfMonth varchar(2)  NOT NULL,
    DayName varchar(9)  NOT NULL,
    DayOfWeek char(1)  NOT NULL,
    DayOfWeekInMonth varchar(2)  NOT NULL,
    DayOfWeekInYear varchar(2)  NOT NULL,
    DayOfQuarter varchar(3)  NOT NULL,
    DayOfYear varchar(3)  NOT NULL,
    WeekOfMonth varchar(1)  NOT NULL,
    WeekOfQuarter varchar(2)  NOT NULL,
    WeekOfYear varchar(2)  NOT NULL,
    Month varchar(2)  NOT NULL,
    MonthName varchar(9)  NOT NULL,
    MonthOfQuarter varchar(2)  NOT NULL,
    Quarter char(1)  NOT NULL,
    QuarterName varchar(9)  NOT NULL,
    Year char(4)  NOT NULL,
    YearName char(7)  NOT NULL,
    MonthYear char(10)  NOT NULL,
    MMYYYY char(6)  NOT NULL,
    FirstDayOfMonth date  NOT NULL,
    LastDayOfMonth date  NOT NULL,
    FirstDayOfQuarter date  NOT NULL,
    LastDayOfQuarter date  NOT NULL,
    FirstDayOfYear date  NOT NULL,
    LastDayOfYear date  NOT NULL,
    CONSTRAINT Dim_date_pk PRIMARY KEY  (pk_date)
);

-- Table: Dim_marque
CREATE TABLE Dim_marque (
    pk_marque int  NOT NULL,
    code_marque nvarchar(255)  NOT NULL,
    nom_marque nvarchar(255)  NOT NULL,
    type_vehicule nvarchar(255)  NOT NULL,
    description_marque nvarchar(255)  NOT NULL,
    CONSTRAINT Dim_marque_pk PRIMARY KEY  (pk_marque)
);

-- Table: Dim_modele
CREATE TABLE Dim_modele (
    pk_modele int  NOT NULL,
    code_modele nvarchar(255)  NOT NULL,
    modele nvarchar(255)  NOT NULL,
    CONSTRAINT Dim_modele_pk PRIMARY KEY  (pk_modele)
);

-- Table: Dim_vehicule
CREATE TABLE Dim_vehicule (
    pk_vehicule int  NOT NULL,
    ref_vehicule varchar(50)  NOT NULL,
    immatriculation_vehicule varchar(50)  NOT NULL,
    année_vehicule int  NOT NULL,
    prix_valorisation_vehicule int  NOT NULL,
    CONSTRAINT Dim_vehicule_pk PRIMARY KEY  (pk_vehicule)
);

-- Table: fact_Achat
CREATE TABLE fact_Achat (
    ref_achat nvarchar(255)  NOT NULL,
    quantite_achat numeric(10,2)  NOT NULL,
    prix_achat numeric(10,2)  NOT NULL,
    Fk_article int  NOT NULL,
    Fk_fournisseur int  NOT NULL,
    total_achat numeric(10,2)  NOT NULL,
    fk_marque int  NOT NULL,
    Fk_date int  NOT NULL
);

-- Table: fact_stock_vehicule
CREATE TABLE fact_stock_vehicule (
    ref_mouvement_stock nvarchar(255)  NOT NULL,
    mouvement_stock int  NOT NULL,
    Fk_depot int  NOT NULL,
    Fk_pays int  NOT NULL,
    Fk_date int  NOT NULL,
    fk_modele int  NOT NULL,
    fk_vehicule int  NOT NULL
);

-- Table: fact_vente_vehicule
CREATE TABLE fact_vente_vehicule (
    ref_vente nvarchar(255)  NOT NULL,
    cout_construction numeric(10,2)  NOT NULL,
    cout_transport numeric(10,2)  NOT NULL,
    cout_maintenance numeric(10,2)  NOT NULL,
    autre_cout numeric(10,2)  NOT NULL,
    prix_vente_HT numeric(10,2)  NOT NULL,
    taux_reduction numeric(10,2)  NOT NULL,
    Fk_client int  NOT NULL,
    Fk_pays int  NOT NULL,
    Fk_date int  NOT NULL,
    fk_modele int  NOT NULL,
    total_vente numeric(10,2)  NOT NULL,
    fk_marque int  NOT NULL,
    cout_total numeric(10,2)  NOT NULL,
    marge numeric(10,2)  NOT NULL,
    fk_vehicule int  NOT NULL
);

-- foreign keys
-- Reference: fact_Achat_Dim_Fournisseur (table: fact_Achat)
ALTER TABLE fact_Achat ADD CONSTRAINT fact_Achat_Dim_Fournisseur
    FOREIGN KEY (Fk_fournisseur)
    REFERENCES Dim_Fournisseur (pk_fournisseur);

-- Reference: fact_Achat_Dim_article_achat (table: fact_Achat)
ALTER TABLE fact_Achat ADD CONSTRAINT fact_Achat_Dim_article_achat
    FOREIGN KEY (Fk_article)
    REFERENCES Dim_article_achat (pk_article);

-- Reference: fact_Achat_Dim_date (table: fact_Achat)
ALTER TABLE fact_Achat ADD CONSTRAINT fact_Achat_Dim_date
    FOREIGN KEY (Fk_date)
    REFERENCES Dim_date (pk_date);

-- Reference: fact_Achat_Dim_marque (table: fact_Achat)
ALTER TABLE fact_Achat ADD CONSTRAINT fact_Achat_Dim_marque
    FOREIGN KEY (fk_marque)
    REFERENCES Dim_marque (pk_marque);

-- Reference: fact_stock_vehicule_Dim_Depot (table: fact_stock_vehicule)
ALTER TABLE fact_stock_vehicule ADD CONSTRAINT fact_stock_vehicule_Dim_Depot
    FOREIGN KEY (Fk_depot)
    REFERENCES Dim_Depot (pk_depot);

-- Reference: fact_stock_vehicule_Dim_Pays (table: fact_stock_vehicule)
ALTER TABLE fact_stock_vehicule ADD CONSTRAINT fact_stock_vehicule_Dim_Pays
    FOREIGN KEY (Fk_pays)
    REFERENCES Dim_Pays (pk_pays);

-- Reference: fact_stock_vehicule_Dim_date (table: fact_stock_vehicule)
ALTER TABLE fact_stock_vehicule ADD CONSTRAINT fact_stock_vehicule_Dim_date
    FOREIGN KEY (Fk_date)
    REFERENCES Dim_date (pk_date);

-- Reference: fact_stock_vehicule_Dim_modele (table: fact_stock_vehicule)
ALTER TABLE fact_stock_vehicule ADD CONSTRAINT fact_stock_vehicule_Dim_modele
    FOREIGN KEY (fk_modele)
    REFERENCES Dim_modele (pk_modele);

-- Reference: fact_stock_vehicule_Dim_vehicule (table: fact_stock_vehicule)
ALTER TABLE fact_stock_vehicule ADD CONSTRAINT fact_stock_vehicule_Dim_vehicule
    FOREIGN KEY (fk_vehicule)
    REFERENCES Dim_vehicule (pk_vehicule);

-- Reference: fact_vente_vehicule_Dim_Pays (table: fact_vente_vehicule)
ALTER TABLE fact_vente_vehicule ADD CONSTRAINT fact_vente_vehicule_Dim_Pays
    FOREIGN KEY (Fk_pays)
    REFERENCES Dim_Pays (pk_pays);

-- Reference: fact_vente_vehicule_Dim_client (table: fact_vente_vehicule)
ALTER TABLE fact_vente_vehicule ADD CONSTRAINT fact_vente_vehicule_Dim_client
    FOREIGN KEY (Fk_client)
    REFERENCES Dim_client (pk_client);

-- Reference: fact_vente_vehicule_Dim_date (table: fact_vente_vehicule)
ALTER TABLE fact_vente_vehicule ADD CONSTRAINT fact_vente_vehicule_Dim_date
    FOREIGN KEY (Fk_date)
    REFERENCES Dim_date (pk_date);

-- Reference: fact_vente_vehicule_Dim_marque (table: fact_vente_vehicule)
ALTER TABLE fact_vente_vehicule ADD CONSTRAINT fact_vente_vehicule_Dim_marque
    FOREIGN KEY (fk_marque)
    REFERENCES Dim_marque (pk_marque);

-- Reference: fact_vente_vehicule_Dim_modele (table: fact_vente_vehicule)
ALTER TABLE fact_vente_vehicule ADD CONSTRAINT fact_vente_vehicule_Dim_modele
    FOREIGN KEY (fk_modele)
    REFERENCES Dim_modele (pk_modele);

-- Reference: fact_vente_vehicule_Dim_vehicule (table: fact_vente_vehicule)
ALTER TABLE fact_vente_vehicule ADD CONSTRAINT fact_vente_vehicule_Dim_vehicule
    FOREIGN KEY (fk_vehicule)
    REFERENCES Dim_vehicule (pk_vehicule);

-- End of file.

