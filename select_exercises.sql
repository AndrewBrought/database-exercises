USE codeup_test_db;

SELECT 'The name of all albums by Pink Floyd' AS 'Exercise 1';
SELECT name FROM albums WHERE artist = 'Pink Floyd';

SELECT 'The year Sgt. Pepper''s Lonely Hearts Club and was release' AS 'Exercise 2';
SELECT release_date FROM albums WHERE name = 'Sgt. Peppers Lonely Hearts Club Band';

SELECT 'The genre for Nevermind' AS 'Exercise 3';
SELECT genre FROM albums WHERE name = 'Nevermind';

SELECT 'Which albums were released in the 1990s' AS 'Exercise 4';
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
-- SELECT name FROM albums WHERE release_date LIKE '%199%';
-- Both of these worked but 'BETWEEN' is more appropriate in this case

SELECT 'Which albums had less than 20 million certified sales' AS 'Exercise 5';
SELECT name FROM albums WHERE sales < 20;

SELECT 'ALL albums with "Rock" genre' AS 'Exercise 6';
SELECT name FROM albums WHERE genre = 'Rock';
-- Better application is to search for 'LIKE'
SELECT name, genre FROM albums WHERE genre LIKE '%rock%';