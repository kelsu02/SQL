USE employees;

SELECT AVG(YEAR(NOW()) - YEAR(birth_date))
	FROM employees;
    
SELECT gender, COUNT(*)
    FROM employees
    GROUP BY gender;
    
SELECT *
	FROM employees
    WHERE (YEAR(NOW()) - YEAR(birth_date)) < 30
	ORDER BY gender;