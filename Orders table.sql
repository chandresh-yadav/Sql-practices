Create table Orders
(
  Onum       int
 ,Amt        decimal(6,2)
 ,Odate      date
 ,Cnum       int
 ,Snum       int
 ,Primary key (Onum)
 ,Foreign key (Cnum) references Customers (Cnum)
 ,Foreign key (Snum) references Salespeople (Snum)

);

Select * from Orders

SELECT TO_CHAR(Odate, 'YYYY-MM-DD HH24:MI:SS') AS formatted_datetime
FROM Orders;

Insert into Orders
values (
         3001
        ,18.69
        ,TO_DATE('1996-10-03 12:30', 'YYYY-MM-DD HH24:MI')
        ,2008
        ,1007
        );

Insert into Orders
values (
         3003
        ,767.19
        ,TO_DATE('1996-10-03 13:45', 'YYYY-MM-DD HH24:MI')
        ,2001
        ,1001
        );
        
Insert into Orders
values (
         3002
        ,1900.10
        ,TO_DATE('1996-10-03 12:05', 'YYYY-MM-DD HH24:MI')
        ,2007
        ,1004
        );
        
Insert into Orders
values (
         3005
        ,5160.45
        ,TO_DATE('1996-10-03 14:00', 'YYYY-MM-DD HH24:MI')
        ,2003
        ,1002
        );
        
Insert into Orders
values (
         3006
        ,1098.16
        ,TO_DATE('1996-10-03 13:37', 'YYYY-MM-DD HH24:MI')
        ,2008
        ,1007
        );
        
Insert into Orders
values (
         3009
        ,1713.23
        ,TO_DATE('1996-10-04 15:21', 'YYYY-MM-DD HH24:MI')
        ,2002
        ,1003
        );
        
Insert into Orders
values (
         3007
        ,75.75
        ,TO_DATE('1996-10-04 16:02', 'YYYY-MM-DD HH24:MI')
        ,2002
        ,1003
        );
        
Insert into Orders
values (
         3008
        ,4723.00
        ,TO_DATE('1996-10-05 12:07', 'YYYY-MM-DD HH24:MI')
        ,2006
        ,1001
        );
        
Insert into Orders
values (
         3010
        ,1309.95
        ,TO_DATE('1996-10-06 13:12', 'YYYY-MM-DD HH24:MI')
        ,2004
        ,1002
        );
        
Insert into Orders
values (
         3011
        ,9891.88
        ,TO_DATE('1996-10-06 13:09', 'YYYY-MM-DD HH24:MI')
        ,2006
        ,1001
        );
        
Insert into Orders
values (
         3012
        ,3455.78
        ,TO_DATE('1996-10-04 15:21', 'YYYY-MM-DD HH24:MI')
        ,2002
        ,1003
        );
        
Insert into Orders
values (
         3013
        ,1245.98
        ,TO_DATE('1996-10-04 16:32', 'YYYY-MM-DD HH24:MI')
        ,2002
        ,1003
        );
        
Insert into Orders
values (
         3014
        ,3721.53
        ,TO_DATE('1996-10-05 12:45', 'YYYY-MM-DD HH24:MI')
        ,2006
        ,1001
        );
        
Insert into Orders
values (
         3015
        ,734.50
        ,TO_DATE('1996-10-06 13:16', 'YYYY-MM-DD HH24:MI')
        ,2004
        ,1002
        );
        
Insert into Orders
values (
         3016
        ,1729.67
        ,TO_DATE('1996-10-06 13:07', 'YYYY-MM-DD HH24:MI')
        ,2006
        ,1001
        );
        
Commit;