/*
Name(s): 
Date: 
Purpose: Create a database and a table therein to store employee information. Populate the table with data records.
*/

-- drop the database if it exists
DROP DATABASE IF EXISTS georgian_college;
-- create a database 
CREATE DATABASE georgian_college ;
-- use the database
USE georgian_college;
--  create a table structure- the fields and their type, to store employee information
CREATE TABLE employee_information  
(
-- the identification number of the employee, unique in every record, cannot have a null value 
employee_id			CHAR(10) PRIMARY KEY, 	
-- the name of the employee, cannot have a null value
employee_name		VARCHAR(40) NOT NULL,					   
-- the email of the employee, unique in every record, cannot be null
employee_email		VARCHAR(40) UNIQUE NOT NULL,			   
-- the hire date of the employee, cannot contain a null value
hire_date 			DATE NOT NULL,							    
-- the number of years the employee has been working, default value is NULL
years_in_job		TINYINT UNSIGNED,						      
-- the salary of the employee; valid values are 0 to 999999.99, default value is 60000, cannot be null
annual_salary		DECIMAL(8,2) UNSIGNED NOT NULL DEFAULT 60000, 			
-- type of employee, valid values are listed in the list
employee_type	ENUM('Management', 'Faculty','Administrative','Support Staff', 'Technical Support') NOT NULL  
);

-- display the structure of the table
DESC employee_information;

-- insert records/rows in the table

INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('1234567890', 'Anju Chawla', 'anju.chawla@georgiancollege.ca', '2001-08-03', 19, 105000.25,'Faculty');


INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('2345678901', 'Ross Bigelow', 'ross.bigelow@georgiancollege.ca', '2005-12-11', 15, 100000,'Faculty' );


INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('3456789012', 'Rich Freeman', 'rich.freeman@georgiancollege.ca',  '2006-02-11', 15, 85000, 'Faculty' );


INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES 
('4567890123', 'Jaret Wright', 'jaret.wright@georgiancollege.ca', '2009-01-21', 12, 79999.50, 'Faculty' );


INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('5678901234', 'Mike O''Connor', 'mico@gmail.com', '2010-06-25', 10, 66000,'Administrative' );

INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('6789012345', 'Wayne Brown', 'wayne.brown@georgiancollege.ca', '2007-12-20', 13, 80000.95,'Faculty' );

INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('7890123456','Ian McWilliam', 'Ian.McWilliam@georgiancollege.ca', '1995-12-11', 24, 122000.50,'Faculty' );


INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('8901234567','Scott McCrindle', 'scott.mccrindle@georgiancollege.ca', '2008-10-10', 12, 75000.75,'Faculty' );



INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, employee_type)
VALUES
('9012345678', 'Ryan Smith', 'Ryan.Smith@hotmail.com', '2012-02-11', 'Support Staff');

INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('1234567891', 'Bob Cooper', 'Bob.Cooper@gmail.com', '1995-12-11', 25, 200000, 'Management' );

INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('2345678911', 'Susan Hunter', 'Susan.Hunter@georgiancollege.ca', '1995-12-11', 25, 99000,'Support Staff' );

INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('2345678996', 'Romeo Smith', 'romeo@gmail.com', '2012-12-11', null, DEFAULT,'Technical Support' );

INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('2345678995', 'Sam Chawla', 'Sam_Chawla@hotmail.com', '2010-12-11', null, default, 'Administrative');

INSERT INTO employee_information(employee_id, employee_name, employee_email, hire_date, employee_type)
VALUES
('9012345679', 'Jo Jackson', 'jojo@hotmail.com', '2010-02-11', 'Support Staff');

INSERT INTO employee_information(employee_id,employee_name, employee_email, hire_date, years_in_job, annual_salary, employee_type)
VALUES
('2234567890', 'Tom Pointon', 'Tom.Pointon@gmail.com', '1991-01-25', 30, 220000,'Management');

-- select all records from the table displaying all columns
SELECT * FROM employee_information;
-- 1.	Involves an exact match involving character data. Recollect exact match does not involve wildcard characters, like % and _. Display all the columns of the table. 
select *
from employee_information
where employee_name = 'Anju Chawla';
-- 2.	Involves the NOT LIKE phrase with a text (char/varchar) field. Display only some columns of the table.
select employee_id, employee_name
from employee_information
where employee_name not like 'r%'
order by 2;

-- 3. involves use of a regular expression with a text (car/varchar) field.
select employee_id, employee_name
from employee_information
where employee_name regexp '^R'
order by 2 desc;

-- 4.	Uses at least two different relational operator (>, < >=, <=, <>, !=) in the WHERE clause.
select *
from employee_information
where hire_date >= cast('1900-01-01' as date) and hire_date <= cast('1999-12-31' as date)
order by hire_date;

-- 6.	Uses the BETWEEN comparison operator on a char/varchar field IN THE WHERE clause and orders the displayed records by a relevant field/column in descending order.
select *
from employee_information
where employee_id between '123' and '200'
order by employee_id;

-- 9.	Uses a date function in the select clause; do not forget to give a proper alias name to the ‘new’ displayed field, if required.
select * from employee_information;
select employee_name, year(hire_date) 'Year Hired'
from employee_information
where year(hire_date) = 1995;

select *
from employee_information
where employee_type IN ('Administrative', 'Support Staff');

select * from employee_information
order by employee_type;

-- 12.	Uses the limit clause to display 3 records in the table, starting from the fifth record.
select * 
from employee_information
order by employee_id
limit 4, 30;

-- 13.	Displays the type of employees only, with no duplicates. The display name of the column should say Employee Types.
select distinct employee_type 'Employee Types'
from employee_information;

-- 14.	Displays all the information for the employee Mike O’Connor only.
select * 
from employee_information
where employee_name = 'Mike O\'Connor';

/*
select * 
from employee_information
where employee_name = `Mike O'Connor`;
*/

select employee_id, employee_name `Employee Name` 
from employee_information
order by `Employee Name`;

show create table employee_information;
-- 15.	Displays only those records that have a NULL value in a field that allows it obviously 
select *
from employee_information
where years_in_job is null;
-- 16
select *
from employee_information
order by employee_type desc, employee_name asc; 




