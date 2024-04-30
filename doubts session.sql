Select * from employees101
order by 1
Select * from departments

--1
Select count(employee_id) from employees101

--2
Select e.department_id, d.department_name, count(employee_id)
from employees101 e Inner join departments d on e.department_id = d.department_id
group by e.department_id, d.department_name
order by 1 desc

--3,4
Select e.manager_id, d.first_name, count(e.employee_id) from employees101 e
left join employees101 d on e.manager_id = d.employee_id
group by e.manager_id, d.first_name
order by 1


--5
Select * from employees101
where department_id = (Select department_id from departments where department_name = 'IT')


--6
Select d.department_id, d.department_name, count(e.employee_id)
from employees101 e
inner join departments d on e.department_id = d.department_id
group by d.department_id, d.department_name
having count(e.employee_id)>10


--7
Select d.department_name, sum(e.salary)
from employees101 e
inner join departments d on e.department_id = d.department_id
group by d.department_name
order by 1

--8
Select d.department_name, max(salary), min(salary), avg(salary)
from employees101 e
inner join departments d on e.department_id = d.department_id
group by d.department_name
order by 1


Select * from (select employee_id, salary, row_number() over (order by salary asc) as rnum from employees101)
where rnum=10


Select * from (Select employee_id, salary, rank() over (order by salary desc) as rnk
               from employees101)
where rnk = 100;

SELECT e1.employee_id, e1.salary
FROM employees101 e1
JOIN employees101 e2 ON e1.salary = e2.salary
WHERE e1.employee_id <> e2.employee_id
ORDER BY e1.salary;

SELECT employee_id, salary, job_id
FROM employees101
WHERE salary IN (
    SELECT salary
    FROM employees101
    GROUP BY salary
    HAVING COUNT(*) > 1
)
ORDER BY salary;
