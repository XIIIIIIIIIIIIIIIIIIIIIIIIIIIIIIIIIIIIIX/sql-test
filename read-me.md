# Collection de schemas SQL

Ce projet fournit plusieurs fichiers `.sql` pour differents cas d'utilisation :

- `library_schema.sql` : gestion d'une bibliotheque
- `inventory_schema.sql` : gestion du stock d'entreprise
- `ecommerce_schema.sql` : boutique en ligne
- `hr_schema.sql` : ressources humaines
- `course_management.sql` : plateforme de cours
- `clinic_schema.sql` : clinique medicale
- `university_schema.sql` : gestion universitaire
- `blog_schema.sql` : plateforme de blog
- `event_schema.sql` : organisation d'evenements
- `car_rental_schema.sql` : location de voitures

Chaque schema inclut egalement quelques instructions `INSERT` pour illustrer des
donnees d'exemple.

## Utilisation rapide

1. Creer une base de donnees PostgreSQL.
2. Executer le script souhaite, par exemple :

   ```bash
   psql ma_base -f library_schema.sql
   ```
