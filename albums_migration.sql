USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE IF NOT EXISTS albums(
     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     artist VARCHAR(100) DEFAULT 'UNKNOWN',
     name VARCHAR(100) NOT NULL ,
     release_date SMALLINT UNSIGNED,
     sales DECIMAL(11,2),
     genre VARCHAR(100),
     PRIMARY KEY (id)
);