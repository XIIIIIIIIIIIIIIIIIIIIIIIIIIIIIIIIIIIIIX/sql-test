-- Schema pour une agence de location de voitures

CREATE TABLE voitures (
    id SERIAL PRIMARY KEY,
    marque VARCHAR(100) NOT NULL,
    modele VARCHAR(100) NOT NULL,
    annee INTEGER,
    immatriculation VARCHAR(50) UNIQUE
);

CREATE TABLE clients_location (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    permis VARCHAR(100) UNIQUE
);

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    id_voiture INTEGER NOT NULL REFERENCES voitures(id),
    id_client INTEGER NOT NULL REFERENCES clients_location(id),
    date_debut DATE NOT NULL,
    date_fin DATE,
    tarif_jour NUMERIC(10,2) NOT NULL
);
CREATE INDEX idx_locations_voiture ON locations(id_voiture);
CREATE INDEX idx_locations_client ON locations(id_client);

-- Donnees d'exemple
INSERT INTO voitures (marque, modele, annee, immatriculation)
VALUES ('Renault', 'Clio', 2022, 'AA-123-AA');
INSERT INTO voitures (marque, modele, annee, immatriculation)
VALUES ('Peugeot', '208', 2021, 'BB-456-BB');
INSERT INTO voitures (marque, modele, annee, immatriculation)
VALUES ('Citroen', 'C3', 2020, 'CC-789-CC');

INSERT INTO clients_location (nom, permis) VALUES ('Jean Durand', 'PERMIS123');
INSERT INTO clients_location (nom, permis) VALUES ('Marie Petit', 'PERMIS456');

INSERT INTO locations (id_voiture, id_client, date_debut, date_fin, tarif_jour)
VALUES (1, 1, '2024-07-01', '2024-07-07', 35.0);
INSERT INTO locations (id_voiture, id_client, date_debut, date_fin, tarif_jour)
VALUES (2, 2, '2024-07-03', '2024-07-10', 40.0);
INSERT INTO locations (id_voiture, id_client, date_debut, date_fin, tarif_jour)
VALUES (3, 1, '2024-07-15', '2024-07-20', 30.0);
