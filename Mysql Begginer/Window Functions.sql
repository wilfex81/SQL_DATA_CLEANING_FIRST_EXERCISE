-- WIndow functions

#Allow us to look at a partition or a group but the each keep their own unique rows

SELECT gender, AVG(salary) avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id  = sal.employee_id
GROUP BY gender
;


SELECT dem.first_name, dem.last_name, gender, 
AVG(salary) OVER(PARTITION BY gender) as avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id  = sal.employee_id
;




SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER
	(PARTITION BY gender 
		ORDER by dem.employee_id) as Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id  = sal.employee_id
;



SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id  = sal.employee_id
;

