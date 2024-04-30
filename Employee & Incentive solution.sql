--Q1.	Write create table syntax for employee table and Incentive table
Create table employee1
(
emp_id          int primary key,
first_name      varchar2(20),
last_name       varchar2(20),
salary          int,
joining_date    date,
department      varchar2(20)
)

Create table incentives
(
Employee_ref_id     int references employee1(emp_id),
incentive_date      date,
incentive_amt       int

commit;


--2.	Write syntax forinsert data into table of employee table and Incentive table
INSERT INTO Employee1 VALUES(1,'John','Abraham',1000000,'01-JAN-13','Banking');
INSERT INTO Employee1 VALUES(2,'Michael','Clarke',800000,'01-JAN-13','Insurance');
INSERT INTO Employee1 VALUES(3,'Roy','Thomas',700000,'01-FEB-13 ','Banking');
INSERT INTO Employee1 VALUES(4,'Tom','Jose',600000,'01-FEB-13','Insurance');
INSERT INTO Employee1 VALUES(5,'Jerry','Pinto',650000,'01-FEB-13','Insurance');
INSERT INTO Employee1 VALUES(6,'Philip','Mathew',650000,'01-JAN-13','Services');

INSERT INTO Incentives VALUES(1,'01-Feb-13',5000);
INSERT INTO Incentives VALUES(2,'01-Feb-13',3000);
INSERT INTO Incentives VALUES(3,'01-Feb-13',4000);
INSERT INTO Incentives VALUES(1,'01-Jan-13',4500);
INSERT INTO Incentives VALUES(2,'01-Jan-13',3500);


--3.	Get all employee details from the employee table
Select * from employee1
Select * from incentives


--4.	Get First_Name,Last_Name from employee table
Select first_name, last_name from employee1


--5.	Get First_Name from employee table using alias name “Employee Name”
Select first_name as "Employee name" from employee1

--6.	Get First_Name from employee table in upper case
Select upper(first_name) from employee1

--7.	Select first 3 characters of FIRST_NAME from EMPLOYEE
Select substr(first_name,1,3) from employee1
Select * from employee1
where first_name like '___'

--8.	Get position of 'o' in name 'John' from employee table
Select instr(first_name,'o') as "Position of 'o' in John" from employee1
where upper(first_name) = upper('john')

--9.	Get FIRST_NAME from employee table after removing white spaces from right side.

