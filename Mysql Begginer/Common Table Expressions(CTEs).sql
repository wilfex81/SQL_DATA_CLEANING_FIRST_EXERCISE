-- CTEs

# Temporary result set that exists only for a duration of a single query. 

WITH CTE_Example AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary)
 max_sal, MIN(salary) min_sal ,
 COUNT(salary) count
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP By gender
)
SELECT AVG(avg_sal)
FROM CTE_Example
;