USE codeup_test_db;
SELECT name AS 'All albums in the table';
SELECT name, sales FROM albums;
UPDATE albums SET sales = sales * 10;

SELECT name AS 'albums release before 1980' WHERE release_date < 1980;
SELECT name, release_date FROM albums WHERE release_date < 1980;
UPDATE albums SET release_date = release_date - 100 WHERE release_date < 1980;

SELECT name AS 'albums by Michael Jackson' WHERE artist = 'Michael Jackson';
SELECT name, artist FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums SET artist = 'Peter Jackson' Where artist = 'Michael Jackson';
