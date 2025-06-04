-- Schema pour la gestion du stock d'entreprise

CREATE TABLE fournisseurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    contact VARCHAR(255)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE produits (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    id_categorie INTEGER REFERENCES categories(id),
    prix NUMERIC(10,2) NOT NULL,
    quantite INTEGER NOT NULL DEFAULT 0
);
CREATE INDEX idx_produits_categorie ON produits(id_categorie);

CREATE TABLE mouvements_stock (
    id SERIAL PRIMARY KEY,
    id_produit INTEGER NOT NULL REFERENCES produits(id),
    quantite INTEGER NOT NULL,
    date_mouvement DATE NOT NULL,
    type_mouvement VARCHAR(20) NOT NULL -- entree ou sortie
);
CREATE INDEX idx_mouvements_produit ON mouvements_stock(id_produit);

-- Donnees d'exemple
INSERT INTO fournisseurs (nom, contact) VALUES ('ACME Corp', 'acme@example.com');
INSERT INTO fournisseurs (nom, contact) VALUES ('Globex', 'globex@example.com');

INSERT INTO categories (nom) VALUES ('Electronique');
INSERT INTO categories (nom) VALUES ('Mobilier');

INSERT INTO produits (nom, id_categorie, prix, quantite)
VALUES ('Ordinateur Portable', 1, 899.99, 10);
INSERT INTO produits (nom, id_categorie, prix, quantite)
VALUES ('Chaise de bureau', 2, 129.99, 20);
INSERT INTO produits (nom, id_categorie, prix, quantite)
VALUES ('Ecran 24 pouces', 1, 199.99, 15);

INSERT INTO mouvements_stock (id_produit, quantite, date_mouvement, type_mouvement)
VALUES (1, 5, '2024-06-01', 'entree');
INSERT INTO mouvements_stock (id_produit, quantite, date_mouvement, type_mouvement)
VALUES (2, 3, '2024-06-02', 'entree');
INSERT INTO mouvements_stock (id_produit, quantite, date_mouvement, type_mouvement)
VALUES (1, 1, '2024-06-03', 'sortie');
