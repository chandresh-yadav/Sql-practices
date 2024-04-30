Select * from c_practice

Select * from employees101

Select * from myteam

select * from shoes

select * from Student

Select * from departments

Select * from locations

Select * from countries
Select * from regions

Select employee_id, first_name, d.department_name from employees101 e
Inner join departments d
on (e.department_id = d.department_id);

Select e.employee_id, first_name ||' '|| last_name as full_name, e.manager_id
from employees101 e
Inner join departments d
on (e.manager_id = d.manager_id)

Select e.employee_id, e.first_name ||' '|| e.last_name as Full_name, m.first_name ||' '|| m.last_name as manager_name, e.manager_id
from employees101 e
Left join employees101 m
on e.manager_id = m.employee_id
order by 1


SELECT e.employee_id, e.first_name ||' '|| e.last_name as full_name, m.first_name ||' '|| m.last_name AS manager_full_name, e.manager_id
FROM employees101 e, employees101 m
where e.manager_id = m.employee_id (+)
Order by 1