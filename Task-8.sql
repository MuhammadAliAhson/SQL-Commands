create database a1;

-- Creating the table of the employee

CREATE TABLE tblEmployee (
id INTEGER NOT NULL,
firstName VARCHAR(255) NOT NULL,
lastName VARCHAR(255) NOT NULL,
salary INTEGER NOT NULL,
departID INTEGER NULL
);


-- Create the table of the Department

CREATE TABLE tblDepartment (
id INTEGER NOT NULL,
name VARCHAR(255) NOT NULL,
location VARCHAR(255) NOT NULL
);

drop table tblEmployee
-- Insertion of the data in the Employees table 

INSERT INTO tblEmployee VALUES 
  (1, 'Sami', 'Ullah', 37000, 1),
  (2, 'John', 'Doe', 42000, 2),
  (3, 'Jane', 'Doe', 38000, 6),
  (4, 'Michael', 'Smith', 55000, Null),
  (5, 'Emily', 'Jones', 44000, 9),
  (6, 'David', 'Brown', 40000, 1),
  (7, 'Ashley', 'Davis', 48000, 3),
  (8, 'Daniel', 'Wilson', 37000, 2),
  (9, 'Jessica', 'Garcia', 42000, 1),
  (10, 'Christopher', 'Martinez', 50000, 3),
  (11, 'Amanda', 'Anderson', 38000, 2),
  (12, 'Matthew', 'Thomas', 42000, 1),
  (13, 'Stephanie', 'Lee', 46000, Null),
  (14, 'Joshua', 'Wright', 39000, 6),
  (15, 'Lauren', 'Clark', 43000, 1),
  (16, 'Brandon', 'Perez', 47000, 3),
  (17, 'Elizabeth', 'Martin', 41000, 2),
  (18, 'Kevin', 'Nguyen', 43000, 1),
  (19, 'Maria', 'Gonzalez', 52000,5),
  (20, 'Brian', 'Rivera', 40000, 2),
  (21, 'Natalie', 'Baker', 45000, 1),
  (22, 'Tyler', 'Moore', 49000, 7),
  (23, 'Megan', 'Campbell', 42000, 7),
  (24, 'Adam', 'Mitchell', 43000, Null),
  (25, 'Rachel', 'Jackson', 48000,5);


-- Insert the data in the Department table

INSERT INTO tblDepartment VALUES 
  (1, 'Structured Query Language', 'Lahore'),
  (2, 'Data Science', 'Karachi'),
  (3, 'Web Development', 'Islamabad'),
  (4, 'Cybersecurity', 'Lahore'),
  (5, 'Artificial Intelligence', 'Karachi'),
  (6, 'Mobile Development', 'Islamabad'),
  (7, 'Cloud Computing', 'Lahore'),
  (8, 'Machine Learning', 'Karachi'),
  (9, 'Database Administration', 'Islamabad');


  -- Inner Join

 select tblEmployee.id, tblEmployee.firstName,tblEmployee.lastName, tblEmployee.salary
 from tblEmployee join tblDepartment on tblEmployee.departID= tblDepartment.id;

 -- Left Outer Join 

 select tblEmployee.id, tblEmployee.firstName,tblEmployee.lastName, tblEmployee.salary
 from tblEmployee left outer join tblDepartment on tblEmployee.departID= tblDepartment.id;

 -- Right Outer Join 

 select tblEmployee.id, tblEmployee.firstName,tblEmployee.lastName, tblEmployee.salary
 from tblEmployee right outer join tblDepartment on tblEmployee.departID= tblDepartment.id;

 -- Full Outer Join 

 select tblEmployee.id, tblEmployee.firstName,tblEmployee.lastName, tblEmployee.salary
 from tblEmployee Full join tblDepartment on tblEmployee.departID= tblDepartment.id;


 -- Task1
 select tblEmployee.id,
 tblEmployee.firstName+ ' ' + tblEmployee.lastName as full_name,
 tblEmployee.salary,
 tblDepartment.name,
 tblDepartment.location
 from tblEmployee Full join tblDepartment on tblEmployee.departID = tblDepartment.id;


 -- TASK2
 SELECT count(*) as total ,tblDepartment.name   from tblDepartment
  join tblEmployee on tblDepartment.id = tblEmployee.departID group by tblDepartment.name;

  -- Task3

 select tblEmployee.id,
 tblEmployee.firstName+ ' ' + tblEmployee.lastName as full_name,
 tblEmployee.salary,
 tblDepartment.name,
 tblDepartment.location
 from tblEmployee inner join tblDepartment on tblEmployee.departID = tblDepartment.id
 where salary in 
 (
 select top(1) salary
 from tblEmployee 
 ORDER BY Salary
 )

 -- Task 4

select tblDepartment.name, tblDepartment.location, avg(tblEmployee.salary) from tblDepartment join  tblEmployee
on tblEmployee.departID = tblDepartment.id group by tblDepartment.name,tblDepartment.location having avg(tblEmployee.salary) = (
select min(Average) from 
(select Avg(tblEmployee.salary) as Average from tblEmployee
group by tblEmployee.departID 
) as temp
);

