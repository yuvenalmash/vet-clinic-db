/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id integer primary KEY NOT NULL,
	"name" text NOT null,
	date_of_birth date NOT NULL,
	escape_attempts integer NOT NULL,
	neutered boolean NULL,
	weight_kg decimal NOT NULL
);