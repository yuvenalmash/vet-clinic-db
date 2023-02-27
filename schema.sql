/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id serial primary KEY,
	"name" text NOT null,
	date_of_birth date NOT NULL,
	escape_attempts integer NOT NULL,
	neutered boolean NULL,
	weight_kg decimal NOT NULL
);

ALTER TABLE animals
ADD COLUMN species TEXT;

CREATE TABLE owners (
	id serial primary KEY,
	full_name text NOT null,
	age integer NOT NULL
);

CREATE TABLE species (
	id serial primary KEY,
	"name" text NOT NULL
);

ALTER TABLE animals
DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id integer;
ALTER TABLE animals
ADD COLUMN owner_id integer;
ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id) ON DELETE CASCADE;

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (
	vet_id integer NOT NULL REFERENCES vets(id) ON DELETE CASCADE,
	species_id integer NOT NULL REFERENCES species(id) ON DELETE CASCADE,
	PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_vet_id_asc ON visits(vet_id ASC);
CREATE INDEX visits_animal_id_asc ON visits(animal_id ASC);
CREATE INDEX owners_email_asc ON owners(email ASC);