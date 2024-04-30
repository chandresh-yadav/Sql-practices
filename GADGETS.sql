Create table gadgets
(
id       decimal(10,2)
,name    varchar2(20)
,type    varchar2(20)
,price   decimal(10,2)
,description    varchar2(20)

)

Insert into gadgets
values (101,'iphone 13 pro','Smartphones',125000,'Apple')

Insert into gadgets
values (102,'iphone 14 pro','Smartphones',130000,'Apple')

Insert into gadgets
values (103,'Samsung s24 ultra','Smartphones',120000,'Samsung','samsung@gmail.com')

Select * from gadgets

Alter table gadgets
modify brand varchar2 (20) constraint he not null;

Alter table gadgets
Add constraint he not null (brand);

alter table gadgets
add email varchar2(20)
 
Alter table gadgets
Add constraint apple primary key (email);

Insert into gadgets (email)
values ('hello@gmail.com')
where id = 102
commit;

delete from gadgets
where id = 104

Alter table gadgets
drop column email

Alter table gadgets
rename column description to brand

Update gadgets
set email = to_char('apple@gmail.com')
where id = 101
commit;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM all_cons_columns
WHERE table_name = 'GADGETS' AND column_name = 'brand';

-- FOR ALL CONSTARINTS BUT NO COLUMN NAME
Select * from all_constraints
where table_name = 'GADGETS'

--FOR CONSTRAINTS ON ALL COLUMNS OF A TABLE
Select * from all_cons_columns
Where table_name ='GADGETS'

--FOR SPECIFIC COLUMN OF A TABLE
SELECT acc.constraint_name, ac.constraint_type, ac.
FROM all_cons_columns acc
JOIN all_constraints ac ON acc.constraint_name = ac.constraint_name
WHERE acc.table_name = 'GADGETS' AND acc.column_name = 'BRAND';

