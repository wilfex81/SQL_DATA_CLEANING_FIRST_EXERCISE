-- Stored procedures
-- A precompiled set of one or more sql statements that are stored in the database and can be executed  as a single unit

SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

CREATE PROCEDURE  large_salaries()
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

-- calling it

CALL large_salaries()




-- Best practice
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN 
	SELECT * 
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT * 
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries3()

-- parameter

DELIMITER $$
CREATE PROCEDURE large_salaries4(employee_id_param INT)
BEGIN 
	SELECT salary
	FROM employee_salary
    WHERE employee_id = employee_id_param
    ;
END $$
DELIMITER ;

CALL large_salaries4(1)














