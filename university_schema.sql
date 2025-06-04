-- Schema pour la gestion d'une universite

CREATE TABLE professeurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    departement VARCHAR(100)
);

CREATE TABLE etudiants (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    date_inscription DATE
);

CREATE TABLE cours (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    id_professeur INTEGER REFERENCES professeurs(id)
);
CREATE INDEX idx_cours_prof ON cours(id_professeur);

CREATE TABLE inscriptions (
    id SERIAL PRIMARY KEY,
    id_cours INTEGER NOT NULL REFERENCES cours(id),
    id_etudiant INTEGER NOT NULL REFERENCES etudiants(id)
);
CREATE INDEX idx_inscriptions_cours_univ ON inscriptions(id_cours);
CREATE INDEX idx_inscriptions_etudiant_univ ON inscriptions(id_etudiant);

CREATE TABLE salles (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    capacite INTEGER
);

-- Donnees d'exemple
INSERT INTO professeurs (nom, departement) VALUES ('Prof. Dupont', 'Mathematiques');
INSERT INTO professeurs (nom, departement) VALUES ('Prof. Martin', 'Histoire');

INSERT INTO etudiants (nom, date_inscription) VALUES ('Alice Etudiante', '2024-09-01');
INSERT INTO etudiants (nom, date_inscription) VALUES ('Bob Etudiant', '2024-09-01');

INSERT INTO cours (titre, id_professeur) VALUES ('Algebre', 1);
INSERT INTO cours (titre, id_professeur) VALUES ('Histoire Moderne', 2);

INSERT INTO inscriptions (id_cours, id_etudiant) VALUES (1, 1);
INSERT INTO inscriptions (id_cours, id_etudiant) VALUES (2, 2);

INSERT INTO salles (nom, capacite) VALUES ('A101', 30);
INSERT INTO salles (nom, capacite) VALUES ('B202', 50);
