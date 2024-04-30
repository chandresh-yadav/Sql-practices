Select * from employees101
Select * from departments


--Total Number of Employees in Each Department
Select d.department_name, count(employee_id)
from employees101 e
inner join departments d on e.department_id = d.department_id
group by d.department_name
order by 2 desc;

--Average Salary by Job Title:
Select job_id, avg(salary) from employees101
group by job_id
order by 2 desc;

--Maximum Salary by Department:
Select d.department_name, max(salary)
from employees101 e
inner join departments d on e.department_id = d.department_id
group by d.department_name
order by 2 desc;


--Minimum, Maximum, and Average Salary for a Specific Job Title:
Select job_id, min(salary), max(salary), avg(salary) from employees101
group by job_id
order by 2 desc;

--Total Number of Employees in each job title
Select e.job_id, count(employee_id)
from employees101 e
inner join departments d on e.department_id = d.department_id
group by e.job_id
order by 2;

--Total Salary Expenses by Department:
Select d.department_name, sum(salary)
from employees101 e
inner join departments d on e.department_id = d.department_id
group by d.department_name
order by 2 desc;

--Number of Employees with a Salary Above Average:
SELECT COUNT(*)
FROM employees101
WHERE salary > (SELECT AVG(salary) FROM employees101);





