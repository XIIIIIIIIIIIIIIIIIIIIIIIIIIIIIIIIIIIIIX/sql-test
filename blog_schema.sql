-- Schema pour une plateforme de blog

CREATE TABLE auteurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    id_auteur INTEGER REFERENCES auteurs(id),
    titre VARCHAR(255) NOT NULL,
    contenu TEXT,
    date_publication DATE
);
CREATE INDEX idx_articles_auteur ON articles(id_auteur);

CREATE TABLE commentaires (
    id SERIAL PRIMARY KEY,
    id_article INTEGER NOT NULL REFERENCES articles(id),
    auteur VARCHAR(100),
    contenu TEXT NOT NULL,
    date_commentaire DATE
);
CREATE INDEX idx_commentaires_article ON commentaires(id_article);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE article_tags (
    id_article INTEGER NOT NULL REFERENCES articles(id),
    id_tag INTEGER NOT NULL REFERENCES tags(id),
    PRIMARY KEY(id_article, id_tag)
);

-- Donnees d'exemple
INSERT INTO auteurs (nom, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO auteurs (nom, email) VALUES ('Bob', 'bob@example.com');

INSERT INTO articles (id_auteur, titre, contenu, date_publication)
VALUES (1, 'Premier Post', 'Contenu du premier post', '2024-06-01');
INSERT INTO articles (id_auteur, titre, contenu, date_publication)
VALUES (2, 'Second Post', 'Contenu du second post', '2024-06-02');

INSERT INTO commentaires (id_article, auteur, contenu, date_commentaire)
VALUES (1, 'Charlie', 'Bravo!', '2024-06-03');
INSERT INTO commentaires (id_article, auteur, contenu, date_commentaire)
VALUES (2, 'Dana', 'Interessant', '2024-06-04');

INSERT INTO tags (nom) VALUES ('tech');
INSERT INTO tags (nom) VALUES ('news');

INSERT INTO article_tags (id_article, id_tag) VALUES (1, 1);
INSERT INTO article_tags (id_article, id_tag) VALUES (2, 2);
