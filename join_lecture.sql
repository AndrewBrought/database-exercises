USE employees;

#  An associative JOIN on three tables, instead of 2

# try to find the full name and department for the employee with an employee id of 1001
SELECT CONCAT(employees.first_name, ' ', employees.last_name) as 'Full Name', departments.dept_name as 'Department'
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE employees.emp_no = 10001;

SELECT CONCAT(employees.first_name, ' ', employees.last_name) as 'Full Name', departments.dept_name as 'Department'
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE employees.emp_no = 10001;