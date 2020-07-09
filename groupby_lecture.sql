USE employees;



# ================  GROUP BY =============



# Group by Fav_color

# ============  RED
# BOB       |   30    |   Red         |   Conner
# BOB       |   23    |   Red         |   Stevenson
# Cathy     |   30    |   Red         |   Swanson


# ============ Blue
# BOB       |   30    |   Blue         |   Smith
# Cathy     |   30    |   Blue         |   Sanders




#  Group by F_Name

# --------- Bob
# BOB       |   30    |   Blue        |   Smith
# BOB       |   23    |   Red         |   Conner
# BOB       |   23    |   Red         |   Stevenson


# ----------- Cathy
# Cathy     |   30    |   Blue        |   Sanders
# Cathy     |   30    |   Red         |   Swanson




#  Group by F_NAME, FAV_COLOR
# ---- Bob / Blue
# ---- Bob / Red
# ---- Cathy / Blue
# ---- Cathy / Red

# ---- Bob / Blue
# BOB       |   30    |   Blue        |   Smith

# ---- Bob / Red
# BOB       |   23    |   Red         |   Conner
# BOB       |   23    |   Red         |   Stevenson

# ---- Cathy / Blue
# Cathy     |   30    |   Blue        |   Sanders

# ---- Cathy / Red
# Cathy     |   30    |   Red         |   Swanson


# These are similar:
SELECT DISTINCT gender FROM employees;

# SELECT DISTINCT gender FROM employees
# GROUP BY gender ORDER BY gender DESC;


SELECT gender, COUNT(*) FROM employees
GROUP BY gender;

# Oldest birth dates for both genders
SELECT gender, MIN(birth_date) FROM employees
GROUP BY gender;

# Youngest birth dates for both genders
SELECT gender, MAX(birth_date) FROM employees
GROUP BY gender;

SELECT gender, birth_date FROM employees
GROUP BY gender, birth_date;


# How many people in each group
SELECT gender, birth_date, COUNT(*) FROM employees
GROUP BY gender, birth_date;

# These are the same
SELECT gender, birth_date, COUNT(*) FROM employees
GROUP BY birth_date, gender;

SELECT gender, birth_date, COUNT(*) FROM employees
GROUP BY gender, birth_date ORDER BY birth_date;


# Select the first and last hire date for each first name
SELECT first_name, MIN(hire_date) AS 'First Hired', MAX(hire_date) AS 'Last Hired' FROM employees GROUP BY first_name;

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE  '%qu%'
GROUP BY last_name;

SELECT last_name, COUNT(*)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE  '%qu%'
GROUP BY last_name;

SELECT COUNT(*), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

