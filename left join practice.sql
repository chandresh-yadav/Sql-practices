Create table t1
(
exp int
)


Create table t2
(
exp1 int
)

Insert into t1 values (1);
Insert into t1 values (null);
Insert into t1 values (2);
Insert into t1 values (1);
Insert into t1 values (null);
Insert into t1 values (3);
Insert into t1 values (4);
Insert into t1 values (null);
Insert into t1 values (5);


drop table t2

Insert into t2 values (5);
Insert into t2 values (null);
Insert into t2 values (7);
Insert into t2 values (6);
Insert into t2 values (null);
Insert into t2 values (10);
Insert into t2 values (8);
Insert into t2 values (null);
Insert into t2 values (null);
Insert into t2 values (1);




select * from t1
select * from t2

Select t1.exp, t2.exp1 from t1
right join t2 on t1.exp = t2.exp1
