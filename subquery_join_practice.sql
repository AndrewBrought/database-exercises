USE employees;

-- Find all the employees with the same hire date as employee 101010.
SELECT hire_date
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM employees
    WHERE emp_no = 101010
    );

-- Find all the titles held by all employees with the first name Aamod.
SELECT title
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
    )
GROUP BY title;

-- Find all the current department managers that are female.
# Sub-Query
SELECT CONCAT(first_name, ' ', last_name) AS 'Female Department Managers'
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE gender = 'F' AND to_date > NOW()
    );


-- Find all the department names that currently have female managers.
# JOIN
SELECT CONCAT(first_name, ' ', last_name) AS 'Female Department Manager', departments.dept_name AS Department
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees e on dept_manager.emp_no = e.emp_no
WHERE e.gender = 'F' AND dept_manager.to_date > NOW();



-- what is the most common birthday in the company? least common?

# Most common birthday in the company
SELECT birth_date AS 'Birthdays', COUNT(*)
FROM employees
GROUP BY birth_date
ORDER BY COUNT(*) DESC
LIMIT 7;

# Least common birthday in the company
SELECT birth_date AS 'Birthdays', COUNT(*)
FROM employees
GROUP BY birth_date
ORDER BY COUNT(*)
LIMIT 7;

-- what is the average salary of managers by department?
SELECT dept_name AS 'Department', CONCAT(first_name, ' ', last_name) AS 'Department Managers', AVG(s.salary) AS 'Salary'
FROM departments
JOIN dept_manager on dept_manager.dept_no = departments.dept_no
JOIN employees AS e on e.emp_no = dept_manager.emp_no
JOIN salaries AS s on e.emp_no = s.emp_no
WHERE s.emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > NOW()
)
GROUP BY dept_name, CONCAT(first_name, ' ', last_name)
ORDER BY dept_name;

-- how many employees currently work in each department?
SELECT dept_name AS 'Department', COUNT(e.emp_no) 'Number of Employees'
FROM departments
JOIN dept_emp AS de ON departments.dept_no = de.dept_no
JOIN employees e on de.emp_no = e.emp_no
WHERE to_date > NOW()
GROUP BY dept_name;

-- what is the average salary for each department?
SELECT dept_name AS 'Department', AVG(s.salary) AS 'Salary'
FROM departments
JOIN dept_emp AS de on de.dept_no = departments.dept_no
JOIN salaries AS s on de.emp_no = s.emp_no
WHERE de.emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE to_date > NOW()
)
GROUP BY dept_name;



-- what was the average salary in the 80s? By department?
SELECT dept_name AS 'Department', AVG(s.salary) AS 'Salary'
FROM departments
         JOIN dept_emp AS de on de.dept_no = departments.dept_no
         JOIN salaries AS s on de.emp_no = s.emp_no
WHERE de.emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE s.from_date > '1979-12-31' AND s.to_date < '1990-01-01'
)
GROUP BY dept_name;




