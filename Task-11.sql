create database lab9;
use lab9;



create table tblEmployee(
id integer not null,
firstname varchar(255) not null,
lastname varchar (255) not null,
salary integer not null,
departID integer Null
);

create table tblDepartment(
id integer not null,
name varchar(255) not null,
location varchar(255) not null
);



-- Inserting data into tblDepartment
INSERT INTO tblDepartment (id, name, location)
VALUES (1, 'Finance', 'New York');
INSERT INTO tblDepartment (id, name, location)
VALUES (2, 'Marketing', 'Los Angeles');
INSERT INTO tblDepartment (id, name, location)
VALUES (3, 'IT', 'San Francisco');

-- Inserting data into tblEmployee
INSERT INTO tblEmployee (id, firstname, lastname, salary, departID)
VALUES (1, 'John', 'Doe', 50000, 1);
INSERT INTO tblEmployee (id, firstname, lastname, salary, departID)
VALUES (2, 'Jane', 'Smith', 60000, 2);
INSERT INTO tblEmployee (id, firstname, lastname, salary, departID)
VALUES (3, 'Bob', 'Johnson', 70000, 3);



--task 1
CREATE PROCEDURE spMinAvgSalaryDept
AS 
BEGIN
    SELECT name AS department_name, AVG(e.salary) AS avg_salary
    FROM tblDepartment 
    JOIN tblEmployee e ON tblDepartment.id = e.departID
    GROUP BY tblDepartment.id, name
    HAVING AVG(e.salary) = (
        SELECT MIN(avg_salary)
        FROM (
            SELECT AVG(salary) AS avg_salary
            FROM tblEmployee
            GROUP BY departID
        ) AS avg_salaries
    );
END


exec spMinAvgSalaryDept

-- task 2

drop procedure spGetLowSalaryEmployees

CREATE PROCEDURE spGetLowSalaryEmployees
    @departID int,
    @salary INT
AS
BEGIN
    SELECT *
    FROM tblEmployee
    WHERE departID = @departID AND salary < @salary
END



exec spGetLowSalaryEmployees @departID=1 ,@salary= 60000;


-- task 3
create trigger one
on database
for CREATE_TABLE
as 
begin
print 'that table has been created successfully.'
end


create table we(
ID INT IDENTITY
);


--task 4
drop table LOG
CREATE TABLE LOG(
Activity varchar(40), 
date_ DATETIME
);




CREATE TRIGGER insertion on
tblEmployee
for 
insert
as
begin
INSERT INTO LOG (Activity, date_)
VALUES ( 'Data is Inserted',  GETDATE());
end


-- task 5

create function SalarySum (@D_ID integer )
returns integer
as
begin

return(SELECT Sum(salary)
    FROM tblEmployee
    WHERE departID = @D_ID )


end



select dbo.SalarySum(2) as Total_Salary
