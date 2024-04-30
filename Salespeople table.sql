Create table Salespeople
(
 Snum    int Primary key
,Sname   varchar2(50)
,City    varchar2(50)
,Comm    decimal(10,2)
);

Insert into Salespeople
values (
         1001
        ,'Peel'
        ,'London'
        ,0.12
        );
        
Insert into Salespeople
values (
         1002
        ,'Serres'
        ,'San Jose'
        ,0.13
        );
        
Insert into Salespeople
values (
         1004
        ,'Monika'
        ,'London'
        ,0.11
        );

Insert into Salespeople
values (
         1007
        ,'Rifkin'
        ,'Barcelona'
        ,0.15
        );
        
Insert into Salespeople
values (
         1003
        ,'Axelrod'
        ,'New York'
        ,0.10
      );
        
Insert into Salespeople
values (
         1005
        ,'Franc'
        ,'London'
        ,0.26
        );
    
Select * from Salespeople

Commit;