-- Schema pour une boutique en ligne

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    adresse TEXT
);

CREATE TABLE produits (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prix NUMERIC(10,2) NOT NULL,
    stock INTEGER DEFAULT 0
);

CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    id_client INTEGER NOT NULL REFERENCES clients(id),
    date_commande DATE NOT NULL
);
CREATE INDEX idx_commandes_client ON commandes(id_client);

CREATE TABLE lignes_commande (
    id SERIAL PRIMARY KEY,
    id_commande INTEGER NOT NULL REFERENCES commandes(id),
    id_produit INTEGER NOT NULL REFERENCES produits(id),
    quantite INTEGER NOT NULL,
    prix_unitaire NUMERIC(10,2) NOT NULL
);
CREATE INDEX idx_lignes_commande_commande ON lignes_commande(id_commande);
CREATE INDEX idx_lignes_commande_produit ON lignes_commande(id_produit);

-- Donnees d'exemple
INSERT INTO clients (nom, email, adresse)
VALUES ('Jean Client', 'jean@example.com', '1 rue A');
INSERT INTO clients (nom, email, adresse)
VALUES ('Marie Client', 'marie@example.com', '2 rue B');

INSERT INTO produits (nom, prix, stock) VALUES ('Smartphone', 599.99, 50);
INSERT INTO produits (nom, prix, stock) VALUES ('Tablette', 399.99, 30);

INSERT INTO commandes (id_client, date_commande) VALUES (1, '2024-06-01');
INSERT INTO commandes (id_client, date_commande) VALUES (2, '2024-06-02');

INSERT INTO lignes_commande (id_commande, id_produit, quantite, prix_unitaire)
VALUES (1, 1, 1, 599.99);
INSERT INTO lignes_commande (id_commande, id_produit, quantite, prix_unitaire)
VALUES (1, 2, 2, 399.99);
INSERT INTO lignes_commande (id_commande, id_produit, quantite, prix_unitaire)
VALUES (2, 1, 1, 599.99);
INSERT INTO lignes_commande (id_commande, id_produit, quantite, prix_unitaire)
VALUES (2, 2, 1, 399.99);
