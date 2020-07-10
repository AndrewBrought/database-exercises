CREATE DATABASE join_test_db;

USE join_test_db;

CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

INSERT INTO users (name, email, role_id) VALUES
('jim', 'j@example.com', null),
('ted', 'ted@example.com', 2),
('shirley', 'shir@example.com', 2),
('monica', 'monica@example.com', 2);

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;




USE employees;

SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_manager.dept_no
WHERE to_date LIKE '9999%'
ORDER BY `Department Name`;
# ====================   Casey's Solution
# Start with depts table
#  JOIN with the dept_manager table, using *dept_no* as the common thread
#  JOIN with the employees table, using *emp_no* as the common thread
# NOTE: ensure to_date is 999-01-01 (meaning, current employee)

# DEpt name | Manager First/Last Name
SELECT departments.dept_name AS Department, CONCAT(emp.first_name, ' ', emp.last_name) AS Manager
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees AS emp ON emp.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY `Department`;

# ========  END


#  Exercise 2
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager', departments.dept_name AS 'Department Name'
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_manager.dept_no
WHERE to_date LIKE '9999%' AND gender = 'F'
ORDER BY `Department Name`;

# =========   Casey's Solution =======

# Find all dept names and their respective managers - who are managed by women
# start with depts, find all managers, then filter by current, then filter by 'F'
# 1. Select desired columns
# 2. JOIN all tables
# 3. Filter for desired results

SELECT departments.dept_name AS Department, CONCAT(emp.first_name, ' ', emp.last_name) AS Manager
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees AS emp ON emp.emp_no = dept_manager.emp_no
WHERE to_date LIKE '9999%' AND gender = 'F'
ORDER BY `Department`;

# ========= END


# Exercise 3
SELECT titles.title AS 'Title', COUNT(*) AS COUNT
FROM departments
JOIN dept_emp on dept_emp.dept_no = departments.dept_no
JOIN titles on titles.emp_no = dept_emp.emp_no
WHERE dept_name = 'd009';

#  ========== Casey's Solution
#  Find all the titles of employees working in the Cust. Service dept.
#  JOIN depts table to dept_emp table
#  JOIN titles table to dept_emplyees table
# Notice the more strict way of counting the department employee by employee no. instead of (*)...
SELECT titles.title AS Title, COUNT(dept_emp.emp_no) AS COUNT
FROM departments
JOIN dept_emp on dept_emp.dept_no = departments.dept_no
JOIN titles on titles.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Customer Service' AND titles.to_date = '9999-01-01' AND dept_emp.to_date = '9999-01-01'
GROUP BY `Title`;

# === 2nd walk through ===
SELECT titles.title AS 'Title', COUNT(dept_emp.emp_no) AS Count
FROM titles
JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Customer Service' AND titles.to_date LIKE '9999%' AND dept_emp.to_date LIKE '9999%'
GROUP BY `Title`;

# SELECT CONCAT(first_name, ' ', last_name) AS 'Department Manager', departments.dept_name AS 'Department Name', employees.salaries.salary AS 'Salary'
# FROM employees
# JOIN dept_manager
# ON dept_manager.emp_no = employees.emp_no
# JOIN departments
# ON departments.dept_no = dept_manager.dept_no
# JOIN salaries s on employees.emp_no = s.emp_no
# WHERE to_date LIKE '9999%'
# ORDER BY `Department Name`;

# Exercise 4

#  ========= Casey's Solution
# Get all current dept managers, their dept names, and current salaries
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) As 'Name', salaries.salary AS 'Salary'
FROM departments
JOIN dept_manager AS dm
on departments.dept_no = dm.dept_no
JOIN employees ON employees.emp_no = dm.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dm.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%'
ORDER BY departments.dept_name;


#  BONUS
SELECT CONCAT(employees.first_name, ' ', employees.last_name) As 'Employee Name', d.dept_name AS 'Department Name', CONCAT(emp2.first_name, ' ', emp2.last_name)
FROM employees
JOIN dept_emp de on employees.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
JOIN dept_manager dm on d.dept_no = dm.dept_no
JOIN employees emp2 ON dm.emp_no = emp2.emp_no
WHERE de.to_date LIKE '9999%' AND dm.to_date LIKE '9999%';
