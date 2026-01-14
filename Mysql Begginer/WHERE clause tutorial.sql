-- WHERE Clause

SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie'
;

# Tom and Jerry who make 50000 will not be included unless(see the next step)
SELECT * 
FROM employee_salary 
WHERE salary > 50000
;

# Tom and Jerry are now included(This is also the same case when working with less than signs)
# see below

SELECT * 
FROM employee_salary 
WHERE salary >= 50000
;

SELECT * 
FROM employee_salary 
WHERE salary < 50000
;

SELECT * 
FROM employee_salary 
WHERE salary <= 50000
;

SELECT *
FROM employee_demographics
WHERE gender != 'Female'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;


-- AND OR NOT -- Logical Operators
# AND in this case means both have to be true
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

# OR in this case means one can be true
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

# OR NOT in this case means one has to be true but also we dont necessary need to look up 
# only males
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

-- LIKE Statement
-- %(means anything) and _(sepcific value)
SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'
;



