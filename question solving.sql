--1
Select * from customers
where rating = 100

--2
Select * from customers
where city is null

--3
Select to_char(odate), max(amt) from orders
group by to_char(odate)
order by 1

--4
Select * from orders
order by cnum desc

--5
Select distinct s.snum, s.sname from salespeople s
inner join orders o on s.snum = o.snum
order by 1

--6
Select c.cnum, c.cname from customers c
inner join salespeople s on c.snum = s.snum
order by 1

--7
Select s.snum, s.sname, count(c.cnum) from salespeople s
inner join customers c on c.snum = s.snum
group by s.snum, s.sname
Having count(c.cnum)>1
order by 1

--8
Select s.snum, s.sname, count(o.onum) as total_orders from salespeople s
inner join orders o on o.snum = s.snum
group by s.snum, s.sname
order by 3 desc

--9
Select * from customers
where city = 'San Jose'

--10 Match salespeople to customers according to what city they lived in.
Select s.sname, c.cname, c.city from salespeople s
inner join customers c on c.snum = s.snum

--11
Select s.sname, max(o.onum) from salespeople s
inner join orders o on o.snum = s.snum
group by s.sname
order by 2 desc

--12
Select * from customers
where city = 'San Jose' and rating > 200

--13
Select * from salespeople
where city = 'London'

--14 List all the orders of salesperson Monika from the Orders table.
Select * from orders o
inner join salespeople s on s.snum = o.snum
where s.sname = 'Monika'

--15 (Not perfect)
Select c.cname from customers c
inner join orders o on c.cnum = o.cnum
where o.odate = to_char('03-OCT-96')
