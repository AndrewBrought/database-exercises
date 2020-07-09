USE employees;

SELECT * FROM employees ORDER BY first_name;

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, last_name;

SELECT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE 'e%'
ORDER BY emp_no;

SELECT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE 'e%'
ORDER BY emp_no DESC;

SELECT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE 'e%'
ORDER BY last_name DESC;


SELECT *
FROM employees
WHERE birth_date LIKE '%12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date, hire_date DESC;

# SELECT * FROM employees LIMIT 1;

# Come back to this one
SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE  '%qu%';
