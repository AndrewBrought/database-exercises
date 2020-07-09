USE employees;

SELECT CONCAT(first_name, ' ', last_name, ' was born ', birth_date),
       AS 'Name and Birthday' FROM employees;