Create table Customer_table
(
  CID                INT PRIMARY KEY
 ,CNAME              VARCHAR2(30)
 ,CADD               VARCHAR2(30)
 ,C_CONTACT          INT
 ,C_CREDITDAYS       INT
 ,CJ_DATE            DATE
 ,SEX                VARCHAR2(10)
 
)

Select * from Customer_table

Insert into Customer_table
values (
         1001
        ,'CYONA BLAKE'
        ,'NEW YORK'
        ,1235684
        ,20
        ,TO_DATE('2011-01-20', 'YYYY-MM-DD')
        ,'FEMALE'
        );
        
Insert into Customer_table
values (
         1002
        ,'JOHN SMITH'
        ,'NEW JERSEY'
        ,1341684
        ,20
        ,TO_DATE('2011-02-21', 'YYYY-MM-DD')
        ,'MALE'
        );
        
              
Insert into Customer_table
values (
         1003
        ,'JORDAN WOOD'
        ,'PRAGUE'
        ,1805184
        ,20
        ,TO_DATE('2011-03-22', 'YYYY-MM-DD')
        ,'MALE'
        );

Insert into Customer_table
values (
         1004
        ,'CHRISTINA'
        ,'MANHATTAN'
        ,1125684
        ,31
        ,TO_DATE('2013-04-23', 'YYYY-MM-DD')
        ,'FEMALE'
        ); 
        
Insert into Customer_table
values (
         1005
        ,'TOM HILL'
        ,'LONDON'
        ,1239284
        ,10
        ,TO_DATE('2015-06-25', 'YYYY-MM-DD')
        ,'MALE'
        );
        
Insert into Customer_table
values (
         1006
        ,'KAMILA JOSEF'
        ,'PARIS'
        ,124568
        ,9
        ,TO_DATE('2011-07-28', 'YYYY-MM-DD')
        ,'FEMALE'
        );
        
Insert into Customer_table
values (
         1007
        ,'ANDRU SYMON'
        ,'TEXAS'
        ,125654
        ,15
        ,TO_DATE('2016-04-01', 'YYYY-MM-DD')
        ,'MALE'
        );
        
Insert into Customer_table
values (
         1008
        ,'SANJU SAMSUNG'
        ,'NEW YORK'
        ,12346341
        ,4
        ,TO_DATE('2013-03-23', 'YYYY-MM-DD')
        ,'MALE'
        );
        
        