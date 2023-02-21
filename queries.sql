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
