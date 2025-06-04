-- Schema de base de donnees pour une gestion de bibliotheque

CREATE TABLE auteurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    date_naissance DATE,
    UNIQUE(nom, prenom, date_naissance)
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    id_auteur INTEGER NOT NULL REFERENCES auteurs(id),
    date_publication DATE,
    isbn VARCHAR(13) UNIQUE,
    quantite_disponible INTEGER DEFAULT 0 CHECK (quantite_disponible >= 0)
);
CREATE INDEX idx_livres_id_auteur ON livres(id_auteur);

CREATE TABLE membres (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    date_adhesion DATE
);

CREATE TABLE emprunts (
    id SERIAL PRIMARY KEY,
    id_livre INTEGER NOT NULL REFERENCES livres(id),
    id_membre INTEGER NOT NULL REFERENCES membres(id),
    date_emprunt DATE NOT NULL,
    date_retour DATE
);
CREATE INDEX idx_emprunts_id_livre ON emprunts(id_livre);
CREATE INDEX idx_emprunts_id_membre ON emprunts(id_membre);

-- Donnees d'exemple
INSERT INTO auteurs (nom, prenom, date_naissance) VALUES ('Hugo', 'Victor', '1802-02-26');
INSERT INTO auteurs (nom, prenom, date_naissance) VALUES ('Dumas', 'Alexandre', '1802-07-24');
INSERT INTO auteurs (nom, prenom, date_naissance) VALUES ('Zola', 'Emile', '1840-04-02');

INSERT INTO livres (titre, id_auteur, date_publication, isbn, quantite_disponible)
VALUES ('Les Miserables', 1, '1862-01-01', '9781234567890', 5);
INSERT INTO livres (titre, id_auteur, date_publication, isbn, quantite_disponible)
VALUES ('Le Comte de Monte-Cristo', 2, '1844-01-01', '9781234567891', 3);
INSERT INTO livres (titre, id_auteur, date_publication, isbn, quantite_disponible)
VALUES ('Germinal', 3, '1885-01-01', '9781234567892', 4);

INSERT INTO membres (nom, prenom, email, date_adhesion)
VALUES ('Dupont', 'Jean', 'jean.dupont@example.com', '2024-01-15');
INSERT INTO membres (nom, prenom, email, date_adhesion)
VALUES ('Martin', 'Claire', 'claire.martin@example.com', '2024-02-20');
INSERT INTO membres (nom, prenom, email, date_adhesion)
VALUES ('Bernard', 'Luc', 'luc.bernard@example.com', '2024-03-10');

INSERT INTO emprunts (id_livre, id_membre, date_emprunt, date_retour)
VALUES (1, 1, '2024-05-01', NULL);
INSERT INTO emprunts (id_livre, id_membre, date_emprunt, date_retour)
VALUES (2, 2, '2024-05-02', NULL);
INSERT INTO emprunts (id_livre, id_membre, date_emprunt, date_retour)
VALUES (3, 3, '2024-05-03', NULL);

