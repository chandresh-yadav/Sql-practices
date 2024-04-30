Select department_id, first_name, salary,
rank() over (Partition by department_id order by salary desc) as rank,
dense_rank() over (Partition by department_id order by salary desc) as denserank
from employees101


--Only department id with salary
Select department_id, trunc(avg(salary)) from employees101
group by department_id
order by 1


--Department id with department name having avf salary using corelated subquery
Select e.department_id, (Select department_name
                         from departments
                         where department_id = e.department_id) as dept_name,
                         trunc(avg(salary))
from employees101 e
group by e.department_id
order by 1

Select e.department_id, d.department_name, trunc(avg(salary))
from employees101 e
left join departments d on e.department_id = d.department_id
group by e.department_id, d.department_name
order by 1


--Departments that do not have any employees using subquery
Select department_id, department_name
from departments
where department_id not in (Select department_id
                            from employees101 where department_id is not null)
order by 1
   
--ERROR                            
Select distinct d.department_id, d.department_name
from employees101 e, departments d
where d.department_id not IN (Select department_id
                     from employees101 e
                     where e.department_id = d.department_id)
order by 1

Select distinct d.department_name, d.department_id
from departments d, employees101 e
where d.department_id not in (Select department_id
                              from employees101 e
                              where e.department_id = d.department_id)
order by 2

Select first_name from employees101
where substr(first_name,1,1) between 'A' and 'G'
select * from employees101

select substr('chandresh yadav',1, instr('chandresh yadav',' ')) from dual



