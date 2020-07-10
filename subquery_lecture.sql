# SUB-QUERY Lecture Ex:

# SELECT column_a, column_b, column_c
# FROM table_a
# WHERE column_a IN (
#     SELECT column_a
#     FROM table_b
#     WHERE column_b = true
#     );

#  JOINS are used when data is needed from 2 or more tables , returns rows of data, syntax can be complex, can return info faster

# SUB-Queries can be easier to read but can be slower to return data

# SELECT column_a, column_b, column_c
# FROM table_a
# WHERE column_a IN (
#     SELECT column_a
#     FROM table_b
#     WHERE column_b IN (
#         SELECT column_a
#         FROM table_c
#         WHERE column_b = true
#             )
#     );
#
# Employees TAble Ex:
# Get dept number and name for dept where name is 'Customer Service'
USE employees;

SELECT dept_no
FROM departments
WHERE dept_name = 'Customer Service';

#  This is like an instant return value like in a js function
SELECT *
FROM departments
WHERE dept_no = (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Customer Service'
    );

# Department Manager employee number of Sales Department
SELECT emp_no
FROM dept_manager
WHERE dept_no IN (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Sales'
)
AND to_date > NOW();

# Concat first two employees highest salaries
SELECT CONCAT(
    (
        SELECT MAX(salary)
        FROM salaries
        WHERE emp_no = 10001
    ),
    ' ',
    (
        SELECT MAX(salary)
        FROM salaries
        WHERE emp_no = 10002
    )
) AS Salaries;


# Find first/last name of all department managers
SELECT emp.first_name, emp.last_name
FROM employees AS emp
JOIN dept_manager AS dm ON dm.emp_no = emp.emp_no;

# Same thing as above, with Sub-query
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    );

# get the names of employees with the ten highest salaries
-- first, find the list of the employees with the highest currents salaries
-- Emp. No | Salary
SELECT emp_no, salary
FROM salaries
WHERE to_date > NOW()
ORDER BY salary DESC;

# to see salary you would have to use a join, but we can combine JOIN inside of a sub-query
SELECT employees.first_name, employees.last_name, salaries.salary
FROM salaries
JOIN  employees ON employees.emp_no = salaries.emp_no
WHERE salaries.emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE to_date > NOW()
    ORDER BY salary DESC
    )
ORDER BY salaries.salary DESC
LIMIT 10;

SELECT CONCAT(
    (
        SELECT CONCAT(first_name, ' ', last_name)
        FROM employees
        WHERE emp_no = 10001
        ),
    ' works in a department called ',
    (
        SELECT dept_name
        FROM departments
        WHERE dept_no = 'd005'
        ),
    '.'
) AS 'Where Georgi Works';


#  name and hire_date of earliest-hired department employees
# This returns the earliest employee for each department
SELECT first_name, hire_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE from_date = (SELECT MIN(from_date) FROM dept_emp)
    );


