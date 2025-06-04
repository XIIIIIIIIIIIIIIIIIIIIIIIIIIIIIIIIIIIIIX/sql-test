-- Schema pour la gestion des ressources humaines

CREATE TABLE departements (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE employes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    id_departement INTEGER REFERENCES departements(id),
    date_embauche DATE
);
CREATE INDEX idx_employes_departement ON employes(id_departement);

CREATE TABLE salaires (
    id SERIAL PRIMARY KEY,
    id_employe INTEGER NOT NULL REFERENCES employes(id),
    montant NUMERIC(10,2) NOT NULL,
    date_versement DATE NOT NULL
);
CREATE INDEX idx_salaires_employe ON salaires(id_employe);

-- Donnees d'exemple
INSERT INTO departements (nom) VALUES ('Informatique');
INSERT INTO departements (nom) VALUES ('Marketing');

INSERT INTO employes (nom, prenom, id_departement, date_embauche)
VALUES ('Dupont', 'Jean', 1, '2020-01-10');
INSERT INTO employes (nom, prenom, id_departement, date_embauche)
VALUES ('Martin', 'Claire', 2, '2021-03-15');
INSERT INTO employes (nom, prenom, id_departement, date_embauche)
VALUES ('Bernard', 'Luc', 1, '2022-09-01');

INSERT INTO salaires (id_employe, montant, date_versement)
VALUES (1, 3000.00, '2024-05-31');
INSERT INTO salaires (id_employe, montant, date_versement)
VALUES (2, 2800.00, '2024-05-31');
INSERT INTO salaires (id_employe, montant, date_versement)
VALUES (1, 3000.00, '2024-06-30');
INSERT INTO salaires (id_employe, montant, date_versement)
VALUES (2, 2800.00, '2024-06-30');
INSERT INTO salaires (id_employe, montant, date_versement)
VALUES (3, 2700.00, '2024-05-31');
