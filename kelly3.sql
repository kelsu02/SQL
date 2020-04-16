USE employees;

-- Unique first and last name, in one field, of all department managers who have ever made more than $100k
SELECT DISTINCT CONCAT(e.first_name, ' ', e.last_name) 'Employee Name'
	FROM employees e
    INNER JOIN salaries s
		ON e.emp_no = s.emp_no
	INNER JOIN dept_manager dm
		ON e.emp_no = dm.emp_no
	WHERE s.salary > 100000;
	
-- Last title held for every employee with the last name Aamodt
SELECT t.title Title, CONCAT(e.first_name, ' ', e.last_name) 'Employee Name'
	FROM employees e
    INNER JOIN titles t
		ON e.emp_no = t.emp_no
	WHERE e.last_name = 'aamodt' AND t.to_date > t.from_date
    GROUP BY e.emp_no;

-- All employees who have been direct reports(not manager) and managers
SELECT CONCAT(e.first_name, ' ', e.last_name) Employee
	FROM employees e
	INNER JOIN dept_emp de
		ON e.emp_no = de.emp_no
	INNER JOIN dept_manager dm
		ON e.emp_no = dm.emp_no
	WHERE dm.emp_no = de.emp_no
    ORDER BY e.last_name;

-- Current (9999-01-01) manager for every department, current salary, their title and their age
SELECT CONCAT(e.first_name, ' ', e.last_name) 'Manager Name', d.dept_name Department, t.title Title, FORMAT(s.salary, 'c') Salary, (YEAR(NOW()) - YEAR(e.birth_date)) Age
	FROM employees e
    INNER JOIN salaries s
		ON e.emp_no = s.emp_no
	INNER JOIN titles t
		ON e.emp_no = t.emp_no
	INNER JOIN dept_manager dm
		ON e.emp_no = dm.emp_no
	INNER JOIN departments d
		ON dm.dept_no = d.dept_no
	WHERE s.to_date = '9999-01-01' AND dm.to_date = '9999-01-01' AND t.title = 'manager'
    ORDER BY Department;
    