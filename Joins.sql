Select * from employees101
Select * from locations
Select * from departments

SELECT *
FROM employees101
WHERE MOD(EXTRACT(YEAR FROM hire_date), 2) = 0;

--WITHOUT JOINS
Select employee_id, First_name ||' '|| last_name as full_name, department_name, postal_code, city
from employees101 e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
Order by 1;


--USING INNER JOIN
Select employee_id, first_name ||' '|| last_name as full_name, department_name, city, country_name
from employees101 e
Inner join departments d
on (e.department_id = d.department_id)
Inner join locations l
on(d.location_id = l.location_id )
Inner join countries c
on (l.country_id=c.country_id)
where city = 'Seattle'
Order by 1

-- For finding manager without Inner join
SELECT e.employee_id, e.first_name ||' '|| e.last_name as full_name, m.first_name ||' '|| m.last_name AS manager_full_name, e.manager_id
FROM employees101 e, employees101 m
where e.manager_id = m.employee_id (+)
Order by 1

--Finding manager with left join
SELECT e.employee_id, e.first_name ||' '|| e.last_name as full_name, m.first_name ||' '|| m.last_name AS manager_full_name, e.manager_id
FROM employees101 e
LEFT JOIN employees101 m ON e.manager_id = m.employee_id
Order by 1