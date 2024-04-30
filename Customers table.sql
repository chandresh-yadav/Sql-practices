Create table Customers
(
  Cnum      int
 ,Cname     varchar2(50)
 ,City      varchar2(50)
 ,Rating    int
 ,Snum      int
 ,Primary Key (Cnum)
 ,Foreign Key (Snum) References Salespeople (Snum)

);

Insert into Customers
        (
         Cnum
        ,Cname
        ,City
        ,Rating
        ,Snum
        )
Values
        (
         2001
        ,'Hoffman'
        ,'London'
        ,100
        ,1001
        );

Insert into Customers
        (
         Cnum
        ,Cname
        ,City
        ,Rating
        ,Snum
        )
Values
        (
         2002
        ,'Giovanni'
        ,'Rome'
        ,200
        ,1003
        );
        
Insert into Customers
        (
         Cnum
        ,Cname
        ,City
        ,Rating
        ,Snum
        )
Values
        (
         2003
        ,'Liu'
        ,'San Jose'
        ,200
        ,1002
        );
        
Insert into Customers
        (
         Cnum
        ,Cname
        ,City
        ,Rating
        ,Snum
        )
Values
        (
         2004
        ,'Grass'
        ,'Berlin'
        ,300
        ,1002
        );   
    
Insert into Customers
        (
         Cnum
        ,Cname
        ,City
        ,Rating
        ,Snum
        )
Values
        (
         2006
        ,'Clemens'
        ,'London'
        ,100
        ,1001
        );
        
Insert into Customers
        (
         Cnum
        ,Cname
        ,City
        ,Rating
        ,Snum
        )
Values
        (
         2008
        ,'Cisneros'
        ,'San Jose'
        ,300
        ,1007
        );
        
Insert into Customers
        (
         Cnum
        ,Cname
        ,City
        ,Rating
        ,Snum
        )
Values
        (
         2007
        ,'Pereira'
        ,'Rome'
        ,100
        ,1004
        );
Commit      
Select * from Customers