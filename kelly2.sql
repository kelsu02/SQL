USE employees;

-- average employee salary for the year 2000 by gender
SELECT gender AS Gender, AVG(s.salary) AS Salary
	FROM employees e
    INNER JOIN salaries s
		ON e.emp_no = s.emp_no
	WHERE YEAR(s.from_date)=2000 AND YEAR(to_date)=2000
	GROUP BY gender;

-- average salary in 2000 by department
SELECT d.dept_name AS Department, FORMAT(AVG(s.salary), 'C2') AS Salary
	FROM salaries s
    INNER JOIN dept_emp de
		ON s.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
	WHERE YEAR (s.from_date)=2000 AND YEAR(s.to_date)=2000
    GROUP BY Department;

-- average salary in 2000 by gender by department
SELECT d.dept_name AS Department, gender AS Gender, AVG(s.salary) AS Salary
	FROM employees e 
    INNER JOIN salaries s
		ON e.emp_no = s.emp_no
	INNER JOIN dept_emp de
		ON s.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
	WHERE YEAR (s.from_date)=2000 AND YEAR(s.to_date)=2000
    GROUP BY Department, Gender;

-- where date_hired BETWEEN "01-01-2000" AND "12-31-2000"

SELECT FORMAT(1234, 'C4') Result;