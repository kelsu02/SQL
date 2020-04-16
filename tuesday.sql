USE employees;

SELECT * 
	FROM employees e
    INNER JOIN salaries s USING (emp_no)
	INNER JOIN dept_emp dem
		ON dem.emp_no = s.emp_no
	INNER JOIN departments dep
		ON dep.dept_no = dem.dept_no
	WHERE e.gender = 'f' AND dep.dept_name = 'development' AND dem.to_date = '9999-01-01' AND s.to_date = '9999-01-01';

