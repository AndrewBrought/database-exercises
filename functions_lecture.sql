USE employees;

SELECT 'something';

# as HWorld renames the column
SELECT CONCAT ('Hello', ' ', 'World') as HWorld;

# Use Concat() to connect ...
SELECT
CONCAT(
        first_name,
        ' ',
        last_name,
        ' was born ',
        birth_date
    ) as Info, emp_no as EmployeeNO
FROM employees;

SELECT LENGTH('supercalifragilisticexpialidotious');

SELECT first_name, LENGTH(first_name) FROM employees;

# DATES
SELECT NOW();

# CURDATE
SELECT CURDATE();

#CURTIME()
SELECT CURTIME();
# UNIX_TIMESTAMP in secs
SELECT UNIX_TIMESTAMP();

SELECT CONCAT(
    'Teaching people to code for ',
    ((UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'))),
    'seconds'
    );

SELECT COUNT(*) FROM employees;

SELECT COUNT(*) FROM dept_emp;

SELECT COUNT(*)
FROM employees
WHERE birth_date = '1953-09-02';

SELECT COUNT(DISTINCT birth_date)
FROM employees;

SELECT birth_date, COUNT(birth_date)
FROM employees
GROUP BY birth_date;

SELECT MAX(birth_date) FROM employees;
SELECT MIN(birth_date) FROM employees;

SELECT MAX(salary) FROM salaries;

SELECT SUM(salary)
FROM salaries
WHERE emp_no = 10001;

SELECT AVG(salary)
FROM salaries;

SELECT * FROM salaries;

SELECT ROUND(AVG(salary))
FROM salaries;

SELECT COS(2);

SELECT RAND();



