USE employees;

SELECT hire_date
FROM employees
WHERE emp_no = 101010;

SELECT first_name AS first_name, last_name AS last_name
FROM employees
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );

# ===== Caseys Solution

SELECT emp_no
FROM employees
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );
#  ==========

SELECT title
FROM titles
WHERE emp_no IN(
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
)
GROUP BY title;

SELECT first_name AS first_name, last_name AS last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE  to_date > Now()
)
AND gender = 'F';

# ========= Casey's Solution ======

# Find all current department managers that are female
# The IN is saying that it's in the list of items... ' = ' means equal to exactly the item (usually refering to one thing)
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > NOW()
    )
AND gender = 'F';


