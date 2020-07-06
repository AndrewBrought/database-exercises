USE codeup_test_db;

DROP TABLE IF EXISTS contacts;

CREATE TABLE IF NOT EXISTS contacts(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) DEFAULT 'NONE',
    email VARCHAR(200) NOT NULL,
    phone_number VARCHAR(50),
    created_at DATETIME,
    updated_at DATETIME,
    PRIMARY KEY (id)
);