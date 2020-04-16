CREATE SCHEMA kelly_db;

USE kelly_db;

CREATE TABLE students
	(
    student_id INT UNSIGNED AUTO_INCREMENT,
    fname VARCHAR(40) NOT NULL,
    minitial CHAR(1) DEFAULT ' ',
    lname VARCHAR(40) NOT NULL,
    CONSTRAINT students_pk
		PRIMARY KEY(student_id)
    );
    
    CREATE TABLE skills
(
	skill_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    skill_name VARCHAR(20),
    skill_icon BLOB,
    CONSTRAINT skills_pk
		PRIMARY KEY(skill_id)
);

CREATE TABLE students_skills
	(
	student_id INT UNSIGNED NOT NULL,
    skill_id INT UNSIGNED NOT NULL,
    CONSTRAINT students_skills_pk
		PRIMARY KEY(student_id, skill_id),
	CONSTRAINT students_skills_fk1
		FOREIGN KEY(student_id)
			REFERENCES students(student_id),
	CONSTRAINT students_skills_fk2
		FOREIGN KEY(skill_id)
			REFERENCES skills(skill_id)
	);
    
ALTER TABLE students
	ADD COLUMN phone CHAR(12);
    
ALTER TABLE students
	ADD COLUMN email VARCHAR(40);
    
    USE kelly_db;

ALTER TABLE students
	MODIFY COLUMN email VARCHAR(40) NOT NULL;
    
INSERT INTO students(fname, minitial, lname, phone, email)
	SELECT fname, minitial, lname, phone, email
		FROM  zach_db.students;
        
INSERT INTO students(fname,minitial, lname, phone, email)
	VALUES (
	'Kelly',
	'S',
	'Redmond',
	'307-123-4567',
	'kelsu02@gmail.com'
	);
    
    SELECT fname, email, COUNT(*)
	FROM students
    GROUP BY fname, email
    HAVING COUNT(*) > 1;
 
-- didn't work
    set sql_safe_updates = 0;

DELETE FROM students
	WHERE student_id IN (SELECT student_id
		GROUP BY fname, email
		HAVING COUNT(*) > 1
	);
    
set sql_safe_updates = 1;

-- did work
DELETE s1
	FROM students as s1
    INNER JOIN (SELECT student_id FROM students GROUP BY fname, email HAVING COUNT(*) > 1) as s2
    ON s1.student_id = s2.student_id;
    
    DELETE s1
	FROM students as s1
    INNER JOIN (SELECT student_id FROM students GROUP BY fname HAVING COUNT(*) > 1) as s2
    ON s1.student_id = s2.student_id;