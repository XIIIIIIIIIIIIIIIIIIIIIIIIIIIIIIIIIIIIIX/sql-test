-- Schema pour la gestion d'evenements

CREATE TABLE lieux (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    adresse TEXT
);

CREATE TABLE evenements (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    date_event DATE NOT NULL,
    id_lieu INTEGER REFERENCES lieux(id)
);
CREATE INDEX idx_evenements_lieu ON evenements(id_lieu);

CREATE TABLE participants (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE billets (
    id SERIAL PRIMARY KEY,
    id_evenement INTEGER NOT NULL REFERENCES evenements(id),
    id_participant INTEGER NOT NULL REFERENCES participants(id),
    categorie VARCHAR(50),
    prix NUMERIC(10,2)
);
CREATE INDEX idx_billets_evenement ON billets(id_evenement);
CREATE INDEX idx_billets_participant ON billets(id_participant);

-- Donnees d'exemple
INSERT INTO lieux (nom, adresse) VALUES ('Centre Ville', '10 place Centrale');
INSERT INTO lieux (nom, adresse) VALUES ('Salle Polyvalente', '5 rue de la Fete');

INSERT INTO evenements (titre, date_event, id_lieu)
VALUES ('Concert', '2024-08-01', 1);
INSERT INTO evenements (titre, date_event, id_lieu)
VALUES ('Conference', '2024-09-15', 2);

INSERT INTO participants (nom, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO participants (nom, email) VALUES ('Bob', 'bob@example.com');

INSERT INTO billets (id_evenement, id_participant, categorie, prix)
VALUES (1, 1, 'VIP', 99.99);
INSERT INTO billets (id_evenement, id_participant, categorie, prix)
VALUES (1, 2, 'Standard', 49.99);
INSERT INTO billets (id_evenement, id_participant, categorie, prix)
VALUES (2, 1, 'Standard', 59.99);
INSERT INTO billets (id_evenement, id_participant, categorie, prix)
VALUES (2, 2, 'Standard', 59.99);
