-- Schema pour la gestion de cours en ligne

CREATE TABLE formateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE cours (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    description TEXT,
    id_formateur INTEGER REFERENCES formateurs(id)
);
CREATE INDEX idx_cours_formateur ON cours(id_formateur);

CREATE TABLE apprenants (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE inscriptions (
    id SERIAL PRIMARY KEY,
    id_cours INTEGER NOT NULL REFERENCES cours(id),
    id_apprenant INTEGER NOT NULL REFERENCES apprenants(id),
    date_inscription DATE NOT NULL
);
CREATE INDEX idx_inscriptions_cours ON inscriptions(id_cours);
CREATE INDEX idx_inscriptions_apprenant ON inscriptions(id_apprenant);

-- Donnees d'exemple
INSERT INTO formateurs (nom, email) VALUES ('Alice Formatrice', 'alice.form@example.com');
INSERT INTO formateurs (nom, email) VALUES ('Bob Formateur', 'bob.form@example.com');

INSERT INTO cours (titre, description, id_formateur)
VALUES ('SQL Avance', 'Cours sur SQL', 1);
INSERT INTO cours (titre, description, id_formateur)
VALUES ('Python Debutant', 'Introduction a Python', 2);

INSERT INTO apprenants (nom, email) VALUES ('Claire Eleve', 'claire.eleve@example.com');
INSERT INTO apprenants (nom, email) VALUES ('David Etudiant', 'david.etudiant@example.com');

INSERT INTO inscriptions (id_cours, id_apprenant, date_inscription)
VALUES (1, 1, '2024-06-01');
INSERT INTO inscriptions (id_cours, id_apprenant, date_inscription)
VALUES (2, 2, '2024-06-02');
INSERT INTO inscriptions (id_cours, id_apprenant, date_inscription)
VALUES (1, 2, '2024-06-03');
