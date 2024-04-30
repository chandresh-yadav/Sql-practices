Select * from customer_table
Select * from vendors
Select * from employee
Select * from sparepart
Select * from purchase
Select * from ser_det


Select substr('Welcome',level,1) from dual
connect by level <= length('welcome');

Select substr ('Welcome', 1, level) from dual
connect by level <= length('Welcome');

Select substr ('Welcome', level) from dual
connect by level <= length('Welcome');


--Q.1 List all the customers serviced.
Select distinct cname from customer_table c
inner join ser_det s
on c.cid = s.cid
order by 1

--Alternate aproach
Select * from customer_table
where cid in (Select cid from ser_det)
order by 2

--Q.2 Customers who are not serviced.
Select c.* from customer_table c
left join ser_det s
on c.cid = s.cid
where s.cid is null

--Q.3 Employees who have not received the commission.
Select * from employee
where eid not in(Select eid from ser_det
group by eid
having sum(comm) > 0)

--Q.4 Name the employee who have maximum Commission.
Select distinct e.ename from employee e
inner join ser_det s
on e.eid = s.eid
where s.comm = (Select max(comm) from ser_det)

--Q.5 Show employee name and minimum commission amount received by an employee.
Select e.ename, min(comm) from ser_det s
join employee e
on s.eid = e.eid
group by e.ename
having min(comm) > 0

--Q.6 Display the Middle record from any table.
Select * from (Select s.*, rownum as r from ser_det s)
where r = (Select round(count(*)/2) from ser_det)

--Q.7 Display last 4 records of any table.
Select e.*,rownum from (Select rowid, c.* from customer_table c
order by rowid desc) e
where rownum < 5

--Q.8 Count the number of records without count function from any table.
Select max(rownum) from employee

--Q.9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).
Select rowid, s.* from ser_det s
where cid = (Select cid from ser_det
group by cid
having count(cid)>1)
order by rowid desc

--Q.10 Show the name of Customer who have paid maximum amount 
Select s.cid,c.cname from ser_det s
join customer_table c
on c.cid = s.cid
where total = (Select max(total) from ser_det)

--Alternate approach
Select * from customer_table
where cid In (Select cid from ser_det
where total IN (Select max(total) from ser_det))

--Q.11 Display Employees who are not currently working.
Select * from employee
where edol is not null

--Q.12 How many customers serviced their two wheelers.
Select count(distinct cid) from ser_det
where upper(typ_veh) = Upper('Two wheeler')


--Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.





--Q.14 Customers who have Colored their vehicles.
Select * from customer_table
where cid in (Select cid from ser_det
              where upper(typ_ser) = upper('Color') )

--Q.15 Find the annual income of each employee inclusive of Commission
Select e.eid, sum(comm), e.esal*12, nvl(sum(comm),0) + e.esal*12 from ser_det s
right join employee e
on e.eid = s.eid
group by e.eid,e.esal




--Q.16 Vendor Names who provides the engine oil.
Select * from vendors
where vid in (Select vid from purchase
where spid in 
(Select spid from sparepart
where upper(spname) Like upper('%engine oil')))


--Q.17 Total Cost to purchase the Color and name the color purchased.
Select p.pqty*p.sprate,s.spname from purchase p
inner join sparepart s
on p.spid = s.spid
where p.spid in (Select spid from sparepart
where upper(spname) like upper('%colour'))

--Q.18 Purchased Items which are not used in "Ser_det"
Select * from purchase
where spid not in (Select spid from ser_det)
order by spid

--Updated statement as entries were wrong while entering
update purchase
set vid = 2002
where pid = 5002
commit

--Q.19 Spare Parts Not Purchased but existing in Sparepart
Select * from sparepart
where spid not in (Select spid from purchase)
order by spid

--Q.20 Calculate the Profit/Loss of the Firm. consider one month salary of each employee for Calculation.





--Q.21 Specify the names of customers who have serviced their vehicles more than one time.
Select cname from customer_table
where cid in
(Select cid from ser_det
group by cid
having count(cid) > 1)

--Q.22 List the Items purchased from vendors locationwise.
Select s.spname,v.* from sparepart s
inner join purchase p
on p.spid = s.spid
inner join vendors v
on v.vid = p.vid

--Q.23 Display count of two wheeler and four wheeler from ser_details
Select typ_veh,count(typ_veh) from ser_det
group by typ_veh


--Q.24 Display name of customers who paid highest SPGST and for which item

Select * from customer_table
where cid in(
Select cid from ser_det
where spid in(
Select spid from purchase
where spgst in (
Select max(spgst) from purchase
where spid in (Select spid from ser_det))))


--Q25 Display vendors name who have charged highest SPGST rate  for which item
Select * from vendors
where vid in (Select vid from purchase
              where sprate in (Select max(Sprate) from purchase))
              

--Q26   list name of item and employee name who have received item


Select s.spname, e.ename from sparepart s
inner join purchase p
on s.spid = p.spid
inner join employee e
on e.eid = p.eid



--Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle
--And Name the Item used for Service, And specify the purchase date of that Item with his vendor and
--Item Unit and Location, And employee Name who serviced the vehicle. for Vehicle NUMBER "MH-14PA335".'
Select c.cname, veh_no, sp.spname, p.pdate, v.vname, sp.spunit, v.vadd, e.ename from customer_table c
join ser_det s on c.cid = s.cid
join sparepart sp on sp.spid = s.spid
join purchase p on p.spid = s.spid
join vendors v on v.vid = p.vid
join employee e on e.eid = s.eid
where s.veh_no = 'MH-14PA335'


--Q28 who belong this vehicle  MH-14PA335" Display the customer name 
Select * from customer_table
where cid in (Select cid from ser_det
where veh_no = 'MH-14PA335')


--Q29 Display the name of customer who belongs to New York and when he /she service their  vehicle on which date
Select c.cname,c.cadd, s.ser_Date from customer_table c
inner join ser_det s
on c.cid = s.cid
where upper(cadd) = upper('New York')


--Q 30 from whom we have purchased items having maximum cost?
Select * from vendors
where vid in (Select vid from purchase
where total in (Select max(total) from purchase))

--Q31 Display the names of employees who are not working as Mechanic and that employee done services
Select eid, ename from employee
where eid in (
Select eid from ser_det
where eid in (Select eid from employee
where ejob not in upper('Mechanic')))

--Q32 Display the various jobs along with total number of employees in each job. The output should
--contain only those jobs with more than two employees.
Select ejob, count(ejob) as employees from employee
group by ejob
having count(ejob) > 2

--Q33 Display the details of employees who done service  and give them rank according to their no. of services
--Step1 - First found eid, count and ranking
Select eid, eid_count, Rank() over (order by eid_count desc) as rank
from (
Select eid, count(eid) as eid_count from ser_det
where eid in (Select eid from employee)
group by eid)

--Step 2 - used join to achieve ename as well
Select eid, ename, eid_count, Rank() over (order by eid_count desc) as rank
from (
Select s.eid, e.ename, count(s.eid) as eid_count from ser_det s
inner join employee e
on e.eid = s.eid
where s.eid in (Select eid from employee)
group by s. eid, e.ename)
order by eid

--Q 34 Display those employees who are working as Painter and fitter and who provide service and total count of service done by fitter and painter
Select s.eid, e.ename, e.ejob, count(s.eid) as no_of_service from ser_det s
inner join employee e
on e.eid = s.eid
where s.eid in (Select eid from employee
where s.eid in (Select eid from employee
where upper(ejob) = upper('fitter') or upper(ejob) = upper('painter')))
group by s.eid, e.ename, e.ejob
order by no_of_service

--Q35 Display employee salary and as per highest salary provide Grade to employee 

Select h.*,
case
    when rr = 1 then 'A'
    when rr = 2 then 'B'
    when rr = 3 then 'C'
    when rr = 4 then 'D'
    when rr = 5 then 'E'
END AS ABC
from(
select e.*,dense_rank()over (order by esal desc)rr from employee e
where esal is not null) h


--Q36  display the 4th record of emp table without using group by and rowid
Select * from (select e.*, rownum rr from employee e)
where rr = 4


--Q37 Provide a commission 100 to employees who are not earning any commission.

Select eid,ename, nvl(bb,100)
from (
Select eid, ename, total_comm, nvl(total_comm,100),
case
    when total_comm = 0 then 100
    else total_comm
end as bb
from (Select distinct e.eid, e.ename, sum(s.comm) total_comm from employee e
left join ser_det s
on s.eid = e.eid
group by e.eid,e.ename
order by e.eid))

--function to get 100 in place of 0
Select nvl(nullif(comm,0),100) from ser_det
Select decode(comm,0,100,comm) from ser_det

--Null if approach
Select distinct e.eid, e.ename,s.comm, nvl(nullif(s.comm,0),100) from employee e
left join ser_Det s
on e.eid = s.eid
order by e.eid

--Vague approach
select eid ,comm from ser_det
where comm>0
union all
select eid, to_number(replace(comm,0,100)) from ser_det
where comm=0



--Q38 write a query that totals no. of services for each day and place the results in descending order
Select ser_date, from (
Select ser_date, count(typ_ser) from ser_det
group by ser_date
order by ser_date desc
union
Select ser_date, count(typ_ser) as total_services from ser_det
group by ser_date

--Additional approach just to add total at the end
with cte as(
Select to_char(ser_date)rr, count(typ_ser)dd from ser_det
group by ser_date
order by ser_date desc),

cte2 as (select 'Total',sum (dd) from cte)

select * from cte
union all
select * from cte2

--Q39 Display the service details of those customer who belong from same city 
Select distinct c.cname, c.cadd, c.cid, s.typ_ser
from customer_table c
left join customer_table a
on a.cadd = c.cadd
left join ser_det s
on s.cid = c.cid
order by c.cadd desc


--Alternate approach
Select a.cid, a.cname, a.cadd, s.typ_ser
from customer_table a
join customer_table b
on b.cadd = a.cadd
inner join ser_det s
on s.cid = a.cid
where a.cname <> b.cname and a.cadd = b.cadd


--Q40 write a query join customers table to itself to find all pairs of customers service by a single employee
Select * from customer_table a
join customer_table b

Select eid from employee
where eid in (
Select eid from ser_det
where cid in
(select cid from customer_table))


Select * from customer_table
where cid in(
select cid from ser_det
where eid in(
select eid from employee))--Not working

--Q41 List each service number followed by name of the customer who made  that service
Select c.cid, c.cname, s.spid from ser_det s
inner join customer_table c
on s.cid = c.cid
where s.cid in
(Select cid from customer_table)
order by c.cid


--Q42 Write a query to get details of employee and provide rating on basis of maximum services provide by employee  .Note (rating should be like A,B,C,D)

Select eid, ename, total_services,
case
    when rr = 1 then 'A'
    when rr = 2 then 'B'
    when rr = 3 then 'C'
    else 'D'
end as rating 
from (Select distinct e.eid, e.ename, count(s.eid) as total_services, dense_rank() over (order by count(s.eid) desc) as rr from employee e
left join ser_det s
on e.eid = s.eid
group by e.eid,e.ename
order by 3 desc) a

--Q43 Write a query to get maximum service amount of each customer with their customer details
Select c.cid, c.cname, max(s.ser_amt) from customer_table c
inner join ser_det s
on c.cid = s.cid
group by c.cid,c.cname
order by c.cid

--Q44 Get the details of customers with his total no of services ?
Select c.cid, c.cname, count(s.cid) from customer_table c
left join ser_det s
on c.cid = s.cid
group by c.cid, c.cname
order by c.cid

--Q45 From which location sparpart purchased  with highest cost ?
Select vadd from vendors
where vid in (Select vid from purchase
              where sprate in (
              Select max(sprate) from purchase))
              
--Q46 Get the details of employee with their service details who has salary is null
Select * from employee
where esal is null and eid in (
Select eid from ser_det)

--Q47 find the sum of purchase location wise 
Select vadd, sum(p.total)
from vendors v
join purchase p
on v.vid = p.vid
group by vadd

--Q.48 write a query sum of purchase amount in word location wise ?
--Syntax for conversion number in word select --to_char(to_date(17874,'j'),'jsp') from dual

Select vadd, rr, to_char(to_date(rr,'j'),'jsp')
from (Select vadd, round(sum(p.total)) rr 
from vendors v
join purchase p
on v.vid = p.vid
group by vadd)


--Q49 Find the customer who has spent the largest amount money and give highest rating
--Practice
Select * from customer_table 
where cid in (
Select cid from ser_det
where total in (
select max(total) from ser_det))

--Didnt work with cte as null was not given any rating
With cte as (Select cid,rr,total,
case
    when rr = 1 then 'highest rating'
    when rr = 2 then 'medium rating'
    else 'lowest rating'
end rating
from(
Select cid, dense_rank() over (order by sum(total) desc) as rr, sum(total) total from ser_det
group by cid))

select c.cname, e.rr,e.total,e.rating from customer_table c
left join cte e
on c.cid = e.cid
order by e.total desc

--Final ans
Select b.cid,a.rr,a.total,
case
    when rr = 1 then 'highest rating'
    when rr = 2 then 'medium rating'
    else 'lowest rating'
end rating
from(
Select cid, dense_rank() over (order by sum(total) desc) as rr, sum(total) total from ser_det
group by cid) a right join customer_table b
on a.cid = b.cid

--Q50 select the total amount in service for each customer for which the total is greater than the amount of the largest service amount in the table
Select cid, total_amt, largest_service_amt from (Select cid, sum(total) total_amt, max(total) largest_service_amt from ser_det
group by cid
order by cid) a
where total_amt > largest_service_amt

--Q51  List the customer name and sparepart name used for their vehicle and  vehicle type
Select c.cid, c.cname, sp.spname, s.typ_veh, s.veh_no from customer_table c
inner join ser_det s
on s.cid = c.cid
inner join sparepart sp
on sp.spid = s.spid
where c.cid in (
Select cid from ser_det
where spid in(
Select spid from sparepart))
order by c.cid

--Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table 
Select sp.spname, e.ename, c.cname, s.qty, s.sp_rate, s.sp_amt from ser_det s
inner join sparepart sp
on sp.spid = s.spid
inner join customer_table c
on s.cid = c.cid
inner join employee e
on s.eid = e.eid


--Q53 specify the vehicles owners who’s tube damaged
Select c.cid, c.cname as veh_owner, s.typ_ser from customer_table c
inner join ser_det s
on c.cid = s.cid
where typ_ser = upper('tube damaged')


-------------------------------------

create view chand as(
select * from employees101
where salary between 10000 and 15000)

select * from chand


drop view chand

--------------------------------------


--Q.54 Specify the details who have taken full service.
Select * from ser_det
where upper(typ_ser) = upper('full servicing')


--Q.55 Select the employees who have not worked yet and left the job
Select * from employee
where eid not in (select eid from ser_det) and edol is not null

--Q.56  Select employee who have worked first ever
Select * from (Select e.*, dense_rank() over (order by edoj) as rr from employee e
order by edoj)
where rr = 1

--Q.57 Display all records falling in odd date
Select * from purchase
where mod(extract(day from pdate),2) =1

--learning extract
Select extract(day from pdate) from purchase

--Q.58 Display all records falling in even date
Select * from purchase
where mod(extract(day from pdate),2) = 0


--Q.59 Display the vendors whose material is not yet used
Select * from vendors
where vid not in 
(Select vid from purchase
where spid in 
(Select spid from ser_det))

--Without using sub query 
Select distinct v.vid, v.vname from vendors v
left join purchase p 
on p.vid = v.vid
left join ser_det s
on s.spid = p.spid
minus
Select distinct v.vid, v.vname from vendors v
left join purchase p 
on p.vid = v.vid
right join ser_det s
on s.spid = p.spid

--Q.60 Difference between purchase date and used date of spare part
Select abs(s.ser_date - p.pdate) from purchase p
inner join ser_det s
on s.spid = p.spid