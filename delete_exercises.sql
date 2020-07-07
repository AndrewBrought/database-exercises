USE codeup_test_db;

SELECT name FROM albums WHERE release_date > 1991;
DELETE FROM albums WHERE release_date > 1991;

SELECT name FROM albums WHERE genre = 'disco';
DELETE FROM albums WHERE genre = 'disco';

SELECT name FROM albums WHERE artist = 'Peter Jackson';
DELETE FROM albums WHERE artist = 'Peter Jackson';