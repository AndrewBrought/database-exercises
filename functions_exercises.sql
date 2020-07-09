USE employees;

SELECT CONCAT(first_name, ' ', last_name) as SingleName
FROM employees
# this means starts with 'e' and ends with 'e'...
WHERE last_name LIKE 'e%e'
ORDER BY emp_no DESC;


SELECT *, CONCAT('Number of Days at Company:', DATEDIFF(now(), hire_date))
FROM employees
# could also use: hire_date LIKE '199%'
WHERE birth_date LIKE '%12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date, hire_date DESC;