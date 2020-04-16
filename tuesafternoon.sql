USE employees;

START TRANSACTION;

UPDATE salaries s
	INNER JOIN dept_manager dm
		ON dm.emp_no = s.emp_no
	INNER JOIN departments d
		ON d.dept_no = dm.dept_no
	SET s.kr_to_date = '2020-03-10' -- CURRENT_DATE() gives you actual date
	WHERE s.salary > 70000 AND d.dept_name = 'sales' AND dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01';
    
    
UPDATE salaries s
	INNER JOIN dept_emp de
		ON de.emp_no = s.emp_no
	INNER JOIN departments d
		ON d.dept_no = de.dept_no
	SET kr_to_date = '2020-03-10'
    WHERE s.salary > 70000 AND d.dept_name = 'sales' AND de.to_date = '9999-01-01' and s.to_date = '9999-01-01';
    
ROLLBACK;
    
    