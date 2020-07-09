USE employees;

SELECT
   CONCAT(
           first_name,
           ' ',
           last_name
       ) as SingleName
FROM employees
WHERE last_name LIKE '%e';


SELECT
    CONCAT(
        'Number of Days at Company:',
    datediff(now(), hire_date)
        )
FROM employees
WHERE birth_date LIKE '%12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date, hire_date DESC;