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
ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
	id serial PRIMARY KEY,
	name text NOT NULL,
	age integer NOT NULL,
	date_of_graduation date NOT NULL
);

CREATE TABLE specializations (
	vet_id integer NOT NULL REFERENCES vets(id),
	species_id integer NOT NULL REFERENCES species(id),
	PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
	vet_id integer NOT NULL REFERENCES vets(id),
	animal_id integer NOT NULL REFERENCES animals(id),
	PRIMARY KEY (vet_id, animal_id)
);
