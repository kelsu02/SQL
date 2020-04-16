USE employees;

START TRANSACTION;

INSERT INTO dept_emp(emp_no, dept_no, from_date)
		VALUES (
        123454321,
        'd007',
        CURRENT_DATE()
        );
        
INSERT INTO salaries(emp_no, salary, from_date)
	VALUES (
    123454321,
    40000,
    CURRENT_DATE()
);

    
SELECT * FROM employees INNER JOIN dept_emp USING (emp_no) INNER JOIN salaries USING (emp_no) WHERE emp_no = 123454321;

COMMIT;