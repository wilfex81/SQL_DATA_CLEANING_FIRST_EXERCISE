-- Triggers and Events

SELECT * 
FROM employee_demographics
;

SELECT * 
FROM employee_salary
;

DROP TRIGGER IF EXISTS employee_insert_trigger;

DELIMITER $$
CREATE TRIGGER employee_insert_trigger
    AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
    INSERT INTO employee_demographics (employeed_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;   

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Wilfex', 'Sepernt', 'Entertainmentn CEO', '1000000', NULL);   
 DESCRIBE employee_demographics; 
 ALTER TABLE employee_demographics CHANGE COLUMN employeed_id employee_id INT;   