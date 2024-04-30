--1. Retrieve the names of all employees who work in the 'Administration' department.

select * from hr.employees
where department_id = (select department_id from hr.departments
where department_name = 'Administration')


select e.* from hr.employees e inner join hr.departments d 
on e.department_id = d.department_id 
where d.department_name = 'Administration'

--2. Find the total number of employees in each department.
--3. Display the employee names along with their department names.
--4. Find the department with the highest number of employees.
--5. Find the average salary of employees in the 'Sales' department.
--6. Display the names of employees who earn more than the average salary.
--7. List the departments that have at least one employee earning more than $10,000.
--8. Find the department(s) with the lowest average salary.
--9. Display the names of all employees along with their manager's name.
--10. List the countries where there are departments located.
--11. Find the names of employees who have the same job title as their manager.

select a.first_name,b.employee_id,b.first_name,a.job_id,b.job_id from hr.employees a inner join hr.employees b
on  a.employee_id = b.manager_id and a.job_id =b.job_id

select  a.first_name,b.first_name,a.job_id,b.job_id,a.salary,b.salary from hr.employees a inner join hr.employees b
on a.salary =b.salary and a.job_id=b.job_id
where a.first_name != b.first_name

select * from hr.employees
order by job_id,salary

select  a.first_name,a.employee_id,a.salary from hr.employees a inner join hr.employees b
on a.salary =b.salary and a.job_id=b.job_id
where a.first_name != b.first_name
intersect
select  b.first_name,b.employee_id,b.salary from hr.employees a inner join hr.employees b
on a.salary =b.salary and a.job_id=b.job_id
where a.first_name != b.first_name


--12. Display the departments with fewer than five employees.
--13. Find the names of employees who work in the same department as 'Steven King'.
--14. List the employees who have a commission percentage greater than their manager.
--15. Find the names of departments located in the 'United States'.
--16. Display the employees who have a salary greater than any employee in the 'Administration' department.
--17. Find the countries where there are no departments located.
--18. List the employees who have a manager in a different department.

select b.employee_id,b.first_name,a.first_name,a.department_id,b.department_id from hr.employees a inner join hr.employees b
on (a.employee_id=b.manager_id)
where a.department_id!=b.department_id

--19. Display the departments with the highest total salary expense.

--20. Find the names of employees who work in the department with the highest average salary.
--21. List the employees who have a salary higher than any employee in the 'Sales' department.




--22. Display the departments with employees who joined the company after 'Steven King'.
select * from hr.employees 
where hire_date < (select hire_date from hr.employees 
where upper(first_name) = upper('steven') and upper (last_name) = upper('king'))


--23. Find the names of employees who have a commission percentage higher than the average commission percentage.
--24. List the employees who do not have a manager in the same department.
--25. List the names of all employees who do not have a manager.*/

select * from hr.employees
where manager_id is null


--26 find department wise employees whose salary is greater than department wise average salary

select first_name,salary,department_id from hr.employees e
where (salary) >= (SELECT avg(salary) from hr.employees d
                                where e.department_id =d.department_id
                              group by department_id)
                              
                              

select first_name,salary,department_id from hr.employees e
where (department_id,salary) >= (SELECT avg(salary) from hr.employees d
                                where e.department_id =d.department_id
                              group by department_id)


with cte as ( select employee_id,first_name ,salary,department_id, avg(salary) over (partition by department_id order by department_id ) AVGG from hr.employees)
select employee_id,first_name,department_id,AVGG from cte
where salary>=AVGG
order by employee_id

select * from hr.employees
order by job_id,salary

with cte as (
select employee_id,job_id , salary from hr.employees
order by job_id,salary)
select employee_id,job_id || salary,salary,
row_number() over (partition by job_id || salary order by job_id || salary ) from cte
where 


with cte as( select * from ( select first_name,salary,job_id,job_id ||' ' || salary namee , row_number() over (partition by job_id || salary order by job_id || salary  ) rr from hr.employees)
where rr > 1)
select first_name ,salary,job_id from cte
where salary = substr(namee,instr(namee,' '),6)


with cte as( select * from ( select first_name,salary,job_id ||' ' || salary namee , row_number() over (partition by job_id || salary order by job_id || salary  ) rr from hr.employees)
where rr > 1)
select substr(namee,instr(namee,' '),4) from cte
where salary  


select first_name,job_id,salary from hr.employees e
where (job_id,salary) =any (select job_id,salary from hr.employees d
                        where e.job_id=d.job_id )
                        
select * from hr.employees



select case when job_id and salary then 1 else 0 end from hr.employees



select substr(trim('   Hi how are you'),1,1) from dual 

select trim ('         Hi how are you ') from dual


select * from hr.employees 
where employee_id in (
with cte as (
select employee_id,job_id,salary,job_id || salary,
row_number()over(partition by job_id || salary order by job_id || salary desc) rr from hr.employees)
select employee_id,salary,job_id,rr from cte
where rr>0 
order by employee_id)
order by employee_id


select e1.employee_id,e1.first_name,e1.salary ,e1.job_id from hr.employees e1 inner join hr.employees e2
on e1.job_id =e2.job_id and e1.salary =e2.salary 
where e1.employee_id != e2.employee_id
order by e1.employee_id
















