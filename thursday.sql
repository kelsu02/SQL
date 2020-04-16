USE books;

INSERT INTO aspiring_authors(au_id, au_fname, au_lname, phone, address, city, state, zip)
	VALUES(
		CONCAT('K', ROUND(RAND()*100)),
        'Kelly',
        'Redmond',
        '307-123-4567',
        '2890 Rd 229',
        'Cheyenne',
        'WY',
        '82009'
	);
    
UPDATE empsales
	SET sale = +10
    WHERE emp_id = 'A1';
    
UPDATE aspiring_authors
	SET au_lname = 'TED'
    WHERE au_id = 'A1';
    
INSERT INTO authors(au_id, au_fname, au_lname, phone, address, city, state, zip)
SELECT au_id, au_fname, au_lname, phone, address, city, state, zip
	FROM aspiring_authors;
    
DELETE FROM aspiring_authors
	WHERE au_id = 'A1';
    
    CREATE TABLE pet (
	id int NOT NULL AUTO_INCREMENT,
	pname VARCHAR(20) NOT NULL, 
    oname VARCHAR(20) NOT NULL, 
    species VARCHAR(20), 
    sex CHAR(1), 
    birth DATE, 
    death DATE,
    PRIMARY KEY (id)
);