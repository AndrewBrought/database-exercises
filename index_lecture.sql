# USE employees;
#
# DESCRIBE employees;
#
# DESCRIBE departments;
# SHOW CREATE TABLE departments;
# SHOW CREATE TABLE salaries;
# SHOW CREATE TABLE employees;

USE codeup_test_db;


DROP TABLE IF EXISTS pets;
CREATE TABLE pets
(
    id         INT UNSIGNED,
    pet_name   VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age        INT
);

DESCRIBE pets;

# -- add a primary key
ALTER TABLE pets
MODIFY COLUMN id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;

# -- drop a primary key
ALTER TABLE pets
MODIFY COLUMN id INT;

ALTER TABLE pets
DROP PRIMARY KEY;

SHOW CREATE TABLE pets;

-- Define the Primary Key on table creation statement
DROP TABLE pets;
    CREATE TABLE pets
(
    id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pet_name   VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age        INT
);
DESCRIBE pets;

-- Define a Primary Key for multiple columns (ONLY FOR DEMO - NOT IN CLASS SCOPE)
DROP TABLE pets;
CREATE TABLE pets
(
    id         INT UNSIGNED AUTO_INCREMENT,
    pet_name   VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age        INT,
    PRIMARY KEY (id, age)
);
DESCRIBE pets;

-- add name index
ALTER TABLE pets
    -- the backticks are a failsafe incase there is a reserved word -AND - allows you to see the difference from what you created
ADD INDEX `pet_name_key` (pet_name);
DESCRIBE pets;

-- drop name index
ALTER TABLE pets
DROP INDEX pet_name_key;

SHOW INDEX FROM pets;


-- =============== UNIQUE INDEX

-- create pets with unique name and owner

-- create using CREATE TABLE
DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
    id INT UNSIGNED AUTO_INCREMENT,
    pet_name VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age INT,
    PRIMARY KEY (id),
    UNIQUE unique_pn_on (pet_name, owner_name)
);
DESCRIBE pets;

-- test unique constraint
INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Jack Smith', 3);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Fred', 2);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Snickers', 'Jack Smith', 3);
-- This will not run
INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Jack Smith', 6);

-- FOREIGN KEYS

DROP TABLE IF EXISTS owners;
CREATE TABLE owners (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(255) DEFAULT 'undisclosed'
);
DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
  id INT UNSIGNED AUTO_INCREMENT,
  pet_name VARCHAR(30) NOT NULL,
  owner_id INT UNSIGNED,
  age INT,
  PRIMARY KEY (id),
  -- the foreign key points to the owner's table id column in the owners table
  FOREIGN KEY (owner_id) REFERENCES owners(id)
);

DESCRIBE pets;

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', null, 2);

INSERT INTO owners (name, address)
VALUES ('Darth Vader', '1337 Death Star Rd');

INSERT INTO owners (name, address)
VALUES ('Bobba Fett', '1339 Death Star Rd');

INSERT INTO owners (name)
VALUES ('General Organa');

SELECT * FROM owners;

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Jabba', 2, 5);

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Star Lord', 3, 2);

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Eve', 1, 3);

-- This wont run because there isnt an owner_id 9
INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Wall-e', 9, 2);

# DESCRIBE employees;
#
# SHOW INDEX FROM employees;


DROP TABLE IF EXISTS owners;
CREATE TABLE owners (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(255) DEFAULT 'undisclosed'
);

DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    owner_id INT UNSIGNED,
    age INT,
PRIMARY KEY (id)
-- the foreign key points to the owner's table id column in the owners table

);

INSERT INTO owners (name, address)
VALUES('Darth Smith', '1138 Death Star Rd.');

INSERT INTO owners (name, address)
VALUES('Lugubrious', '1131 Death Star Rd.');

INSERT INTO owners (name, address)
VALUES('Chewy', '1135 Death Star Rd.');

INSERT INTO pets (name, owner_id, age)
VALUES ('Puddle', 1, 2);

INSERT INTO pets (name, owner_id, age)
VALUES ('Grindle', 2, 2);

INSERT INTO pets (name, owner_id, age)
VALUES ('Ruffy', 3, 2);

# INSERT INTO pets (pet_name, owner_id, age)
# VALUES ('Sparky', 4, 2);

-- list the name and address of the pet
# JOIN a.k.a inner join
# SELECT pets.name, owners.address FROM pets
# JOIN owners ON pets.owner_id = owners.id;
#
# SELECT pets.name, owners.address FROM pets
# LEFT JOIN owners ON pets.owner_id = owners.id;




