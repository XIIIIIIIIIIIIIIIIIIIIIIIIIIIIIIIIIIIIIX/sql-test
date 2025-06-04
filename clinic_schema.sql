-- Schema pour une clinique medicale

CREATE TABLE medecins (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    specialite VARCHAR(100)
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    date_naissance DATE
);

CREATE TABLE rendez_vous (
    id SERIAL PRIMARY KEY,
    id_patient INTEGER NOT NULL REFERENCES patients(id),
    id_medecin INTEGER NOT NULL REFERENCES medecins(id),
    date_rdv TIMESTAMP NOT NULL,
    notes TEXT
);
CREATE INDEX idx_rdv_patient ON rendez_vous(id_patient);
CREATE INDEX idx_rdv_medecin ON rendez_vous(id_medecin);

CREATE TABLE traitements (
    id SERIAL PRIMARY KEY,
    id_rdv INTEGER NOT NULL REFERENCES rendez_vous(id),
    description TEXT,
    cout NUMERIC(10,2)
);
CREATE INDEX idx_traitements_rdv ON traitements(id_rdv);

-- Donnees d'exemple
INSERT INTO medecins (nom, specialite) VALUES ('Dr Martin', 'Cardiologie');
INSERT INTO medecins (nom, specialite) VALUES ('Dr Leroy', 'Dermatologie');

INSERT INTO patients (nom, date_naissance) VALUES ('Pierre Durand', '1980-05-10');
INSERT INTO patients (nom, date_naissance) VALUES ('Sophie Petit', '1990-08-22');

INSERT INTO rendez_vous (id_patient, id_medecin, date_rdv, notes)
VALUES (1, 1, '2024-06-15 10:00', 'Controle annuel');
INSERT INTO rendez_vous (id_patient, id_medecin, date_rdv, notes)
VALUES (2, 2, '2024-06-16 11:00', 'Suivi');
INSERT INTO rendez_vous (id_patient, id_medecin, date_rdv, notes)
VALUES (1, 2, '2024-06-20 09:00', 'Consultation dermatologie');

INSERT INTO traitements (id_rdv, description, cout) VALUES (1, 'ECG', 50.00);
INSERT INTO traitements (id_rdv, description, cout) VALUES (2, 'Biopsie', 150.00);
INSERT INTO traitements (id_rdv, description, cout) VALUES (3, 'Prescription creme', 20.00);
