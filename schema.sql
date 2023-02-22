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