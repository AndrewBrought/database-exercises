USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE IF NOT EXISTS albums(
     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     artist VARCHAR(100) DEFAULT 'NONE',
     name VARCHAR(100) NOT NULL ,
     release_date INT,
     sales DECIMAL(4,2),
     genre VARCHAR(100),
     PRIMARY KEY (id)
);