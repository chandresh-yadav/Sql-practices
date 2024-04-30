Select * from salespeople
Select * from customers
Select * from orders


--1.	List all customers with a rating of 100.
Select * from customers
where rating = 100

--2.	Find all records in the Customer table with NULL values in the city column.
Select * from customers
where city is null


--3.	Find the largest order taken by each salesperson on each date.
Select trunc(o.odate), s.snum, s.sname, max(o.amt) from orders o
inner join salespeople s
on o.snum = s.snum
group by trunc(o.odate), s.snum, s.sname
order by 2

--4.	Arrange the Orders table by descending customer number.
Select * from orders
order by snum desc


--5.	Find which salespeople currently have orders in the Orders table.
Select * from salespeople
where snum in (
select snum from orders)


--6.	List names of all customers matched with the salespeople serving them.
Select * from customers
where snum in (
select snum from salespeople)


--7.	Find the names and numbers of all salespeople who had more than one customer.
--Using inline and subquery
Select rr.snum, s.sname, rr.total_customers
from (Select snum, count(cnum) as total_customers from customers
group by snum) rr  join salespeople s
on rr.snum = s.snum
order by rr.total_customers desc

--Using join
Select c.snum, s.sname, count(c.cnum) as total_customers from customers c
inner join salespeople s
on c.snum = s.snum
group by c.snum, s.sname
order by total_customers desc


--8.	Count the orders of each of the salespeople and output the results in descending order.
Select snum, count(onum) from orders
group by snum
order by count(onum) desc


--9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
Select * from customers
where upper(city) = upper('San Jose')

--10.	Match salespeople to customers according to what city they lived in
Select s.city, s.sname, c.cname from salespeople s
inner join customers c
on s.snum = c.snum
where c.city = s.city


--11.	Find the largest order taken by each salesperson.
Select s.snum, s.sname, largest_orders from (Select snum, max(amt) as largest_orders from orders
group by snum) a
right join salespeople s
on s.snum = a.snum
order by s.snum


--12.	Find customers in San Jose who has a rating above 200
Select * from customers
Where upper(city) = upper('San jose') and rating > 200

--13.	List the names and commissions of all salespeople in London.
Select * from salespeople
where upper(city) = upper('london')

--14.	List all the orders of salesperson Monika from the Orders table.
Select * from orders o
join salespeople s
on s.snum = o.snum
where upper(s.sname) = upper('Monika')

--15.	Find all customers with orders on October 3.
Select * from customers
where cnum in (
Select cnum from orders
where to_char(odate) = to_char('03-OCT-96'))


--16.	Give the sums of the amounts from the orders table, grouped by date
Select trunc(odate), sum(amt) from orders
group by trunc(odate)

--17.	Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
Select trunc(odate), sum(amt) from orders
group by trunc(odate)
having sum(amt) > 2000

--18.	Select all orders that had amounts that were greater than at least one of the orders from October 6.

Select * from orders
where amt > (Select min(amt) from orders
where to_char(odate) = to_char('06-OCT-96'))



--19.	Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
Select * from salespeople s
where exists (
select snum from customers c
where rating = 300
and s.snum = c.snum)

--20.	Find all pairs of customers having the same rating.
Select * from customers c
cross join customers cu
where c.cname != cu.cname and c.rating = cu.rating



--21.	Find all customers with CNUM, 1000 above the SNUM of Serres.
Select * from customers
where cnum > (
Select snum+1000 from salespeople
where upper(sname) = upper('Serres'))




--22.	Give the salespeople’s commissions as percentage instead of decimal numbers
Select comm*100 from salespeople


--23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders which are less than $3000.00 in value.
Select snum, trunc(odate), max(amt) from orders
group by snum, trunc(odate)
having max(amt) > 3000
order by trunc(odate)


--24.	List the largest orders on October 3, for each salesperson
Select * from (Select snum, trunc(odate) as rr, max(amt) from orders
group by snum, trunc(odate))
where to_char(rr) = to_char('03-OCT-96')

--25.	Find all customers located in cities where Serres (SNUM 1002) has customers.
Select * from customers
where city in (
Select city from customers
where snum = 1002)

--26.	Select all customers with a rating above 200.00.
Select * from customers
where rating > 200

--27.	Count the number of salespeople currently listing orders in the Orders table.
Select count(snum) from (
Select snum from salespeople
where snum in (
Select snum from orders))


--28.	Write a query that produces all customers serviced by salespeople with a commission above 12%.
--Output the customer’s name and the salesperson‘s rate of commission.
--Using subquery and then join
Select a.snum, c.cnum, c.cname, a.percnt from (
Select c.*, comm*100 as percnt from salespeople c
where comm*100 > 12) a
join customers c
on c.snum = a.snum

--Using join
select c.cname , s.comm from Customers c
inner join Salespeople s
on c.snum = s.snum
where Comm*100 > 12

--29.	Find salespeople who have multiple customers.
Select * from salespeople
where snum in(
Select snum from (Select snum, count (cnum) from customers
group by snum
having count(cnum)>1))


--30.	Find salespeople with customers located in their city
Select distinct s.sname from salespeople s
inner join customers c
on s.snum = c.snum
where s.city = c.city

--31.	Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
Select * from salespeople
where upper(sname) like upper('P__I%')


--32.	Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’
--Assume you do not know his customer number.
Select * from orders
where cnum in (
Select cnum from customers
where upper(cname) = upper('Cisneros'))


--33.	Find the largest orders for ‘Serres’ and ‘Rifkin’.

Select snum, larg_order from (Select snum, max(amt) as larg_order from orders
group by snum) a
where snum in (
Select snum from salespeople
where upper(sname) = upper('Serres') or upper(sname) = upper('Rifkin'))
) -- Doubt where need to add name of sales person without using join


--34.	Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.
Select snum, sname, comm, city from salespeople


--35.	Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range
Select * from customers
where cname between 'A' and 'G'

--36.	Select all the possible combinations of customers that you can assign.



--37.	Select all orders that are greater than the average for October 4.

Select * from orders
where amt > (
Select avg(amt) from orders
where upper(to_char(odate)) = upper(to_char('04-oct-96')))
--used upper because small letter oct returned null because oct in original table is in caps

--38.	Write a select command using a correlated sub query that selects the names and numbers of all customers
--with ratings equal to the maximum for their city.
Select * from customers c
where rating in (
select max(rating) from customers cu
where cu.city = c.city )

--39.	Write a query that totals the orders for each day and places the results in descending order.

Select trunc(odate), sum(amt) from orders
group by trunc(odate)
order by 2 desc

--40.	Write a select command that produces the rating followed by the name of each customer in San Jose.
Select * from customers
where upper(city) = upper('San Jose')


--41.	Find all orders with amounts smaller than any amount for a customer in San Jose.
Select * from orders
where amt < (
Select max(amt) from orders
where cnum in (
Select cnum from customers
where upper(city)= upper('San Jose')))

--42.	Find all orders with above average amounts for their customers.

Select * from orders
where amt > (
Select avg (amt) from orders) 

--43.	Write a query that selects the highest rating in each city.
Select city, max(rating) from customers
group by city


--44.	Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100
Select o.amt*(s.comm) from salespeople s
inner join orders o
on s.snum = o.snum
where o.cnum in (
Select cnum from customers
where rating > 100)

--45.	Count the customers with rating above San Jose’s average.
Select * from customers
where rating > (Select rating from (Select city, avg(rating) as rating from customers
group by city
having upper(city) = upper('san jose')))


--46.	Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed
select * from salespeople s , salespeople p
where s.sname = p.sname 
---Did not understand the question

--47.	Find all salespeople that are located in either Barcelona or London
Select * from salespeople
where upper(city) in (upper('barcelona') , upper('london'))


--48.	Find all salespeople with only one customer.
Select * from salespeople
where snum in (
Select snum from (Select snum, count(cnum) from customers
group by snum
having count(cnum) = 1))

--49.	Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson
Select c.cname,cu.cname from customers c, customers cu
where c.snum = cu.snum and c.cnum != cu.cnum


--50.	Write a query that will give you all orders for more than $1000
Select * from orders
where amt >1000

--51.	Write a query that lists each order number followed by the name of the customer who made that order.
Select o.onum, c.cnum, c.cname from orders o
inner join customers c
on c.cnum = o.cnum

--52.	Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service,
--one using a join and one a correlated subquery. Which solution is more elegant?
Select s.snum, s.sname,c.cname, s.city,c.city from salespeople s
inner join customers c
on c.snum = s.snum
where c.city != s.city -- need help


--53.	Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres





--54.	Write 2 queries that will produce all orders taken on October3 or October 4.

Select * from orders
where to_char(odate) in (to_char('03-OCT-96'), to_char('04-OCT-96'))


--2nd query




--55.	Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates
Select * from orders o, orders c 
where o.cnum=c.cnum and o.onum!=c.onum
-- Did not understand the question, irrelevant and illogical


--56.	Find only those customers whose ratings are higher than every customer in Rome.
Select * from customers
where rating > (
Select max(rating) from customers
where upper(city) = upper('rome'))

--57.	Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.


--Select * from
Select cnum,cname,city,rating from customers 
--where rating >= 100 a
where rating > 100 or upper(city) = upper('rome')
--Was using subquery unnecessarily


--58.	Find all rows from the Customer table for which the salesperson number is 1001.
Select * from customers
where snum = 1001

--59.	Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.
Select * from (Select snum, sum(amt) as aa from orders
group by snum) a
where aa > (Select max(amt) from orders)

--dinesh approach
select sum(amt),snum from orders
group by snum 
having sum(amt) > (
select max(amt) from orders)

--60.	Write a query that selects all orders that have Zeroes or NULL in the Amount field
Select * from orders
where amt is null or amt = 0

--61.	Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically,
--and the latter has a rating of less than 200.




--62.	List all salespeople’s names and the commission they have earned.
Select sname, comm from salespeople


--63.	Write a query that produces the names and cities of all customers with the same rating as Hoffman.
--Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.

Select * from customers
where rating in (
Select rating from customers
where cnum = 2001)


--64.	Find all salespeople for whom there are customers that follow them in alphabetical order
Select * from salespeople
where snum in (
Select snum from customers)
order by sname

--65.	Write a query that produces the names and ratings of all customers of all who have above average orders.
Select * from customers
where cnum in (
select cnum from orders
where amt > (
Select avg(amt) from orders))


--66.	Find the sum of all purchases from the Orders table.
Select sum(amt) from orders

--67.	Write a select command that produces the order number, amount, and date for all rows in the Order table.
Select onum, amt, odate from orders


--68.	Count the number of not null rating fields in the Customer table including duplicates
Select rating, count(rating) from customers
group by rating
having rating is not null


--69.	Write a query that gives the names of both the salesperson and the customer for each order after the order number.
Select o.onum, s.sname, c.cname from orders o
inner join salespeople s
on s.snum = o.snum
inner join customers c
on c.cnum = o.cnum

--70.	List the commissions of all salespeople servicing customers in London.
Select * from salespeople
where snum in (
Select snum from customers
where upper(city) = upper('London'))

--71.	Write a query using ANY or ALL that will find all salespeople who have no customers located in their city




--72.	Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.




--73.	Write a query that selects all customers serviced by Peel or Motika.
Select * from customers
where snum in (
Select snum from salespeople
where upper(sname) in upper('Peel') or upper(sname) in upper('Monika'))


--74.	Count the number of salespeople registering orders for each day.
--(If a salesperson has more than one order on a given day, he or she should be counted only once.)
Select snum, dd, total_count, count(snum) as atleast_once from (
Select snum, trunc(odate) as dd, count(snum) as total_count from orders
group by snum, trunc(odate)) a
group by snum, dd, total_count
order by 2

--75.	Find all orders attributed to salespeople in London.
Select * from orders
where snum in (
Select snum from salespeople
where upper(city) = upper('London'))


--76.	Find all orders by customers not located in the same cities as their salespeople.
Select o.* from orders o 
inner join customers c
on o.cnum = c.cnum
inner join salespeople s
on s.snum = o.snum
where s.city != c.city

--77.	Find all salespeople who have customers with more than one current order.
Select * from salespeople s
where snum in (Select snum from (Select cnum, snum, count(onum) from orders
group by cnum, snum
having count(onum) > 1))--ask how to display count

--78.	Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has at least one other customer
--(besides the customer being selected) with orders in the Orders table.
Select o.* from customers c
inner join orders o
on c.cnum = o.cnum
where c.cnum in(
Select cnum from (
Select snum, cnum, count(cnum) from orders
group by snum, cnum
having count(cnum) > 1))

--79.	Write a query that selects all customers whose name begins with ‘C’
Select * from customers
where cname like 'C%'

--80.	Write a query on the Customers table that will find the highest rating in each city. 
--Put the output in this form:  for the city (city) the highest rating is : (rating).
Select 'for the city' ||' '||city|| ' ' ||'the highest rating is' ||' '||cc as information from
(
Select city, max(rating) as cc from customers
group by city)


--81.	Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.
Select snum, sum(amt) from orders
group by snum
--doubt

--82.	Write a query that lists customers in descending order of rating. 
--Output the rating field first, followed by the customers’ names and numbers.
Select rating, cname, cnum from customers
order by 1


--83.	Find the average commission for salespeople in London.
Select city, avg (comm) from salespeople
group by city
having upper(city) = upper('London')


--84.	Find all orders credited to the same salesperson that services Hoffman.
Select * from orders
where snum in(
Select snum from orders
where cnum in(
Select cnum from customers
where upper(cname) = upper('Hoffman')))



--85.	Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.
Select * from salespeople
where comm between 0.10 and 0.12


--86.	Write a query that will give you the names and cities of all salespeople in London with commission above 0.10
Select * from salespeople
where upper(city) = upper('London') and comm > 0.10

--87.	What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = '03-OCT-1996' AND CNUM > 2003));





--88.	Write a query that selects each customer’s smallest order.
Select * from customers
where cnum in (
Select cnum from (Select cnum, min(amt) from orders
group by cnum))


Select cnum, min(amt) from orders
group by cnum


--89.	Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.
--using regular exp
Select * from (
Select c.*, dense_rank() over (order by cname) as rr from customers c
where regexp_like (cname,'^[g]','i'))
where rr = 2


--using rownum
select * from (
select e.*,rownum rr from customers e
where cname like 'G%'
order by cname)
where rr= 1

--90.	Write a query that counts the number of different not NULL city values in the Customers table.
Select * from customers
where city is not null

--91.	Find the average amount from the Orders table.
Select avg(amt) from orders


--92.	What would be the output from the following query?
SELECT * FROM ORDERS WHERE NOT  (Odate = '03-OCT-96' OR Snum > 1006) AND amt >= 1500;





--93.	Find all customers who are not located in San Jose & whose rating is above 200.
Select * from customers
where rating > 200
and upper(city) = upper('San jose')

--94.	Give a simpler way to write this query:
--SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);

Select * from salespeople
where comm between 0.12 and 0.14

--95.	Evaluate the following query:
SELECT * FROM orders WHERE NOT ((Odate = '03-OCT-1996' AND Snum>1002) OR amt>2000);


--96.	Which salespeople attend to customers not in the city they have been assigned to?
Select * from salespeople s
inner join customers c
on c.snum = s.snum
where s.city != c.city
--check

--97.	Which salespeople get commission greater than 0.11 and serving customers rated less than 250?
Select * from salespeople 
where comm > 0.11 and snum in (Select
snum from customers 
where rating < 250)


--98.	Which salespeople have been assigned to the same city but get different commission percentages?
Select distinct s.snum, s.sname, s.city, s.comm from salespeople s
cross join salespeople ss
where s.city = ss.city and  s.comm != ss.comm

--99.	Which salesperson has earned the most by way of commission?
Select snum, max(comm) as rr from salespeople
group by snum
order by rr desc

--100.	Does the customer who has placed the maximum number of orders have the maximum rating?
NO

Select cnum from
(Select cnum, count(onum), dense_rank() over (order by count(onum) desc) as rr from orders
group by cnum)
where rr = 1 and cnum in (
Select cnum from customers
where rating = (Select max(rating) from customers))


--101.	Has the customer who has spent the largest amount of money been given the highest rating?

--consideres sum of all amts spent by customers
Select * from (Select cnum, sum(amt), dense_rank() over (order by sum(amt) desc) as rr from orders
group by cnum)
where rr = 1
and cnum in (
Select cnum from customers
where rating = 
(Select max(rating) from customers))

--considered individual amts spent by customers
Select * from (Select cnum, max(amt), dense_rank() over (order by max(amt) desc) as rr from orders
group by cnum)
where rr = 1
and cnum in (
Select cnum from customers
where rating = 
(Select max(rating) from customers))

--in both cases the ans is NO

--102.	List all customers in descending order of customer rating.
Select * from customers
order by rating desc

--103.	On which days has Hoffman placed orders?
Select * from orders
where cnum in (
Select cnum from customers
where upper(cname) = upper('Hoffman'))

--104.	Do all salespeople have different commissions?
Select * from salespeople s
inner join salespeople ss
on s.snum = ss.snum
where s.comm != ss.comm
---wrong

--105.	Which salespeople have no orders between 10/03/1996 and 10/05/1996?
Select * from orders
where Not (odate between '03-OCT-96' and '05-OCT-96')

select * from countries 
where country_id not in ( 
select country_id from countries
where rownum = 1)





select e.*,dense_rank()over (order by rownum) from employees101 e

select e.*,dense_rank()over (order by rownum) from countries e

--Regular exp practice
Select regexp_substr ('chandresh shrinath yadav','[^ ]+',1,level) from dual
connect by level <= regexp_count('chandresh shrinath yadav','[^ ]+')

Select regexp_count('chandresh shrinath yadav','[^ ]+') from dual