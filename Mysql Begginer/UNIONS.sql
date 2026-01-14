-- Unions
 #Combines rows together
 
SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT  first_name, last_name
FROM employee_salary;


-- Use case for union
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'HIghly paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;