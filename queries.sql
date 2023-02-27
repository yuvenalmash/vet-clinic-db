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

-- What animals belong to Melody Pond?
SELECT animals.* FROM animals
INNER JOIN owners ON owner_id = owners.id
WHERE full_name = 'Melody Pond';
-- all animals that are pokemon (their type is Pokemon)
SELECT animals.* FROM animals
INNER JOIN species ON species_id = species.id
WHERE species.name = 'Pokemon';
-- all owners* and their animals (even those without animals)
SELECT full_name, name FROM animals RIGHT OUTER JOIN owners ON owner_id = owners.id;
-- How many animals are there per species?
SELECT species.name, COUNT(animals) FROM animals INNER JOIN species ON species_id = species.id GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT animals.* FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
INNER JOIN species ON animals.species_id = species.id
WHERE owners.id = 2 AND species.id = 2;
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.* FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.id = 5 AND animals.escape_attempts = 0;
-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.id) as num_animals
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.id
ORDER BY num_animals DESC
LIMIT 1;

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.date_of_visit FROM visits
INNER JOIN animals ON visits.animal_id = animals.id
WHERE visits.vet_id = 1
ORDER BY visits.date_of_visit DESC
LIMIT 1;
-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT visits.animal_id)
FROM visits WHERE visits.vet_id = 3;
-- List all vets and their specialties, including vets with no specialties.
SELECT vets.id, vets.name, species.name FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id
ORDER BY vets.id;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, visits.date_of_visit FROM visits
INNER JOIN animals ON visits.animal_id = animals.id
WHERE visits.vet_id = 3
AND visits.date_of_visit >= '2020-04-01'
AND visits.date_of_visit <= '2020-08-30'
ORDER BY visits.date_of_visit;
-- What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.*) as num_visits FROM animals
LEFT JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY num_visits DESC
LIMIT 1;
-- Who was Maisy Smith's first visit?
SELECT animals.name, MIN(visits.date_of_visit) AS first_visit
FROM visits JOIN animals ON visits.animal_id = animals.id
WHERE visits.vet_id = 2
GROUP BY animals.name
ORDER BY first_visit
LIMIT 1;
-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, vets.name, visits.date_of_visit FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
WHERE visits.date_of_visit = (
  SELECT MAX(date_of_visit)
  FROM visits
);
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS num_visits FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
JOIN vets ON visits.vet_id = vets.id
LEFT JOIN specializations ON vets.id = specializations.vet_id AND species.id = specializations.species_id
WHERE specializations.vet_id IS NULL;
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) AS num_visits FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE visits.vet_id = 2
GROUP BY species.name
ORDER BY num_visits DESC
LIMIT 1;

-- performance analysis queries
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';