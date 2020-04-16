USE employees;
       
-- one-to-many relationship
SELECT *
	FROM employees e
    INNER JOIN salaries s
		ON e.emp_no = s.emp_no
	WHERE s.salary >= 60000;
    
-- employees by department
-- many-to-many

SELECT CONCAT(e.first_name, ' ', e.last_name), d.dept_name
	FROM employees e
    INNER JOIN dept_emp de
		ON e.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'marketing';
    
SELECT d.dept_name Department, COUNT(*) AS Employees
	FROM employees e
    INNER JOIN dept_emp de
		ON e.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
	GROUP BY d.dept_name;
    
SELECT CONCAT(e.first_name, ' ', e.last_name) AS Manager, d.dept_name AS Department, t.title as Title
	FROM employees e
    INNER JOIN dept_manager dm
		ON e.emp_no = dm.emp_no
	INNER JOIN departments d
		ON dm.dept_no = d.dept_no
	INNER JOIN titles t
		ON e.emp_no = t.emp_no
	ORDER BY Department, Title;
        
SELECT *
	FROM dept_manager;