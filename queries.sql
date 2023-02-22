-- all animals whose name ends in "mon"
SELECT * from animals WHERE name LIKE '%mon';
-- all animals born between 2016 and 2019
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
-- all animals that are neutered and have less than 3 escape attempts
SELECT * from animals WHERE neutered IS TRUE AND escape_attempts < 3;
-- date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth from animals WHERE name = 'Pikachu' OR name = 'Agumon';
-- name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
-- all animals that are neutered
SELECT * from animals WHERE neutered IS TRUE;
-- all animals not named Gabumon
SELECT * from animals WHERE NOT name = 'Gabumon';
-- all animals with a weight between 10.4kg and 17.3kg 
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- update the animals table by setting the species column to unspecified
 UPDATE animals SET species = 'unspecified';

--  Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that do not have species already set
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

-- Inside a transaction delete all records in the animals table, then roll back the transaction
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- Using save points
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
