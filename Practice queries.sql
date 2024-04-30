Select * from employees101
Select * from departments
Select * from locations
Select * from countries
Select * from regions


--Find unique job id
Select distinct job_id
from employees101

--Display the department name of employees
Select first_name,last_name ,e.department_id, d.department_name
from employees101 e
inner join departments d on e.department_id = d.department_id


--Display the department name along with the number of employees in each department
Select count(e.department_id) as no_of_employees, e.department_id, d.department_name
from departments d
inner join employees101 e on e.department_id = d.department_id
group by e.department_id, d.department_name
order by 1 desc

--Employees who do not have manager
Select * from employees101
where manager_id is null

--Display the job title and the number of employees for each job title.
Select job_id as job_title, count(employee_id) as number_of_employees
from employees101
group by job_id
order by 2 desc

--Display the job title, number of employees and which department are they from.
Select job_id as job_title, count(employee_id) as number_of_employees
from employees101 e
inner join departments d on e.department_id = d.department_id
group by job_id
order by 2 desc


--Employees with commission percentage
Select first_name ||' '|| last_name as full_name, commission_pct from employees101
where commission_pct is not null

--Display the employee name and their manager's name.
Select e.employee_id, e.first_name ||' '||e.last_name as Employee_name, m.first_name ||' '|| m.last_name as Manager_name, e.manager_id
from employees101 e
Join employees101 m on e.manager_id = m.employee_id
order by 1

Select e.employee_id, e.first_name ||' '||e.last_name as Employee_name, m.first_name ||' '|| m.last_name as Manager_name, e.manager_id
from employees101 e
Left Join employees101 m on e.manager_id = m.employee_id
order by 1

Select e.employee_id, e.first_name ||' '|| e.last_name as employee_name, m.first_name ||' '|| m.last_name as manager_name, e.manager_id
from employees101 e, employees101 m
where e.manager_id = m.employee_id (+)

--Display the manager's ID and the number of employees they manage.
Select e.manager_id, m.first_name, count(e.employee_id) as Number_of_employees from employees101 e
Left Join employees101 m on e.manager_id = m.employee_id
group by e.manager_id, m.first_name
order by 1

--Display the department name along with the location city.
Select department_name, l.location_id, l.city from departments d
Inner join locations l on d.location_id = l.location_id

--Display managers of each department
Select d.department_name, d.manager_id, e.first_name from employees101 e
inner join departments d on d.manager_id = e.employee_id

--With departments having no managers (null values)
Select d.department_name, d.manager_id, e.first_name from departments d
left join employees101 e on d.manager_id = e.employee_id

--Find the highest salary for each job title.
Select job_id, max(salary) from employees101
group by job_id

--Display the employee ID and salary of employees who earn the highest salary in their department
--(2nd query is right but took help for that)
Select department_id, max(salary) from employees101
group by department_id

SELECT d.department_id, d.department_name, e.employee_id, first_name, salary
FROM employees101 e
join departments d on e.department_id = d.department_id
WHERE (e.department_id, e.salary) IN (
    SELECT department_id, MAX(salary)
    FROM employees101
    GROUP BY department_id
)


-- List all employees who are not managers.
Select distinct e.employee_id, e.first_name from employees101 e
left join employees101 m on m.employee_id = e.manager_id
where e.employee_id != m.manager_id
order by 1


Select e.employee_id, m.manager_id, e.first_name ||' '|| e.last_name as Employee_name
from employees101 e
left join employees101 m on e.employee_id = m.manager_id
where m.manager_id is null
order by 1

--Find the total salary expense for each department.
Select job_id, d.department_name, sum(salary) from employees101 e
join departments d on d.department_id = e.department_id
group by job_id, d.department_name
order by 3 desc

--List employees who earn more than their manager.
Select e.employee_id, e.first_name, e.salary as emp_salary, m.salary as manager_salary from employees101 e
join employees101 m on e.manager_id = m.employee_id
where e.salary > m.salary


--List employees who earn less than their manager.
Select e.employee_id, e.first_name, e.salary as own_salary, m.salary as employee_salary from employees101 e
join employees101 m on m.manager_id = e.employee_id
where m.salary > e.salary

--Display employees who are also managers
Select distinct e.employee_id, m.manager_id, e.first_name from employees101 e
left join employees101 m on m.manager_id = e.employee_id
where m.manager_id is not null
order by 1


--department wise 3rd highest salary 




--list all employees from Sales department
Select e.*,d.* from employees101 e
inner join departments d on e.department_id = d.department_id
where d.department_name = 'Sales'

--Same with subquery
Select e.* from employees101 e
where department_id in (Select department_id from departments where department_name = 'Sales')

--list all employees from Marketing department
Select e.* from employees101 e
join departments d on d.department_id = e.department_id
where d.department_name = 'Marketing'


