Select first_name, salary from employees101
where salary > (Select avg(Salary) from employees101)
order by salary

Select e.first_name, e.salary
from employees101 e
join (Select avg(salary) sal from employees101) avg_sal
on e.salary > avg_sal.sal
order by e.salary


Select *
from employees101
where (department_id, salary) in (Select department_id, max(salary)
                                  from employees101
                                  group by department_id)


Select * from departments
where department_id not in (Select distinct department_id from departments)

Select * from employees101

SELECT department_id, department_name
FROM departments
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM employees101
);


SELECT d.department_id, d.department_name
FROM departments d
LEFT JOIN employees101 e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL


SELECT *
FROM departments
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM employees101 
    where department_id is not null
);





















Select *
from employees101
where department_id Not In (Select department_id
                            from employees101
                            where department_id is not null)

Select * from departments





SELECT *
FROM employees101
WHERE (department_id,salary) NOT IN (Select distinct department_id, max(salary) from departments)


Select department_name
from departments
where department_id in (Select department_id from employees)


SELECT d.department_id, d.department_name
FROM departments d


select distinct a.department_id from departments a ,employees101 b
where a.department_id not in (select department_id from employees101 b
where a.department_id = b.department_id)

--delete dup records
create table abc (
id     int,
name  varchar2(20),
numbe   int
);

insert into abc values (1,'dinesh',800);
insert into abc values (2,'ajay',801);
insert into abc values (2,'ajay',801);
insert into abc values (3,'darpan',802);

select * from abc

select id, a from (Select id, row_number() over (partition by id order by id) as a from abc) as b where a>1
delete from abc where id > (Select id from abc_cte where a>1)


Delete from abc where id IN 
(Select id from abc
group by id
having count(*) > 1)

commit

