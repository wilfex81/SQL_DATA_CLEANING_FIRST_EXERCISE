SELECT  * 
FROM employee_demographics;

SELECT  first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10
FROM employee_demographics;

#PEDMAS - Basically the order in which arithmetic gets executed. 

#DISTINCT - selects only unique values within a column
SELECT DISTINCT first_name, gender
FROM employee_demographics;

 




