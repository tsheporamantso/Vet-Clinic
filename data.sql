/* Day 1 use of queries */
INSERT INTO animals (name, date_of_birth, escape_attempt, neutered, weight_kg)
VALUES ('Agumon','2020-02-03', 0, true, 10.23), 
        ('Gabumon','2018-11-15', 2, true,8),
        ('Pikachu','2021-01-07', 1, false, 15.04), 
        ('Devimon','2017-05-12', 5, true,11);

/* Day 2 queries and update animals table */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Charmander', '2020-02-08', 0, false, -11.0, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Angemon', '2005-06-12', 1, true, -45.00, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Blossom', '1998-10-13', 3, true, 17.0, '');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES ('Ditto', '2022-05-14', 4, true, 22.0, '');

/* Day 3 query multiple tables */

INSERT INTO owners(full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Wincheste', 14),
('Jodie Whittaker', 38);

SELECT * FROM owners;

INSERT INTO species(name) VALUES
('Pokemon'),
('Digimon');

SELECT * FROM species;

UPDATE animals
SET species_id = (CASE
WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
ELSE (SELECT id FROM species WHERE name = 'Pokemon')
END);

SELECT id, name, species_id FROM animals;

UPDATE animals
SET owner_id = (CASE
WHEN name IN ('Agumon') THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END);

SELECT id, name, species_id, owner_id FROM animals;

/* Rectify typo on owners full_name */
UPDATE owners SET full_name = 'Dean Winchester' WHERE full_name = 'Dean Wincheste';

