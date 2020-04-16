USE employees;

START TRANSACTION;

UPDATE salaries s
	INNER JOIN employees e USING(emp_no)
    INNER JOIN dept_emp dem USING(emp_no)
    INNER JOIN departments d 
		ON dem.dept_no = d.dept_no
	SET s.salary = s.salary * 1.15 
    WHERE e.gender = 'F' AND dem.to_date = '9999-01-01' AND s.to_date = '9999-01-01' AND d.dept_name = 'development';
    
SELECT *
	FROM salaries
    WHERE emp_no = 10006 AND to_date = '9999-01-01';

ROLLBACK;