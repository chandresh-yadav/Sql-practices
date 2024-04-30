
select a.cid,b.spgst, dense_rank()  over (partition by a.cid, b.spgst
order by b.spgst desc ) h  from customer_table a left join ser_det c on a.cid=c.cid
left join purchase b on c.spid=b.spid


--Q no 24
select * from(
select a.cid,b.spgst, rank()  over (
order by b.spgst desc) h  from customer_table a left join ser_det c on a.cid=c.cid
left join purchase b on c.spid=b.spid
where b.spgst is not null) 
where h=1

Select rownum over cid from customer_table


SELECT
    department_id, first_name, last_name, salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ,salary ORDER BY salary desc) rn
  FROM employees101
  
--Q3--wrong approach since same employees have multiple entries with commission 0 and 150
Select e.ename,s.comm from employee e
Inner join ser_det s
on e.eid = s.eid
where s.comm = 0

--right
Select * from employee
where eid not in(Select eid from ser_det
group by eid
having sum(comm) > 0)