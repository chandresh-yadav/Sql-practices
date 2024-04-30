Select * from customer_table
Select * from vendors
Select * from employee
Select * from sparepart
Select * from purchase
Select * from ser_det

select *,rownum() over (partition by a.cid, b.spgst
order by b.spgst desc ) h into #temp from customer_table as a left join ser_det as c on a.cid=c.cid
left join purchase as b on c.spid=b.spid

--Q no 25
Select v.VNAME, sp.SPNAME 
From purchase pu
Join vendors v ON pu.VID = v.VID
Join sparepart sp ON pu.SPID = sp.SPID
where pu.spgst = (Select max(spgst) from purchase)
order by pu.spgst desc;

--Update statement
Update sparepart
set spname = 'Four wheeler engine oil'
where Spid = 4003

SELECT * 
FROM dba_users
order by username desc


--Q no 27
Select c.cname, s.veh_no, sp.spname, p.pdate, v.vname, sp.spunit, v.vadd, e.ename
from ser_det s
join customer_table c on s.cid = c.cid
join employee e on s.eid = e.eid
join sparepart sp on sp.spid = s.spid
join purchase p on p.spid = s.spid
join vendors v on p.vid = v.vid
where s.veh_no = 'MH-14PA335'


--Different approach
Select c.cname, veh_no, sp.spname, p.pdate, v.vname, sp.spunit, v.vadd, e.ename from customer_table c
join ser_det s on c.cid = s.cid
join sparepart sp on sp.spid = s.spid
join purchase p on p.spid = s.spid
join vendors v on v.vid = p.vid
join employee e on e.eid = s.eid
where s.veh_no = 'MH-14PA335'


--Q no 6
Select * from (Select s.*, rownum as r from sparepart s)
where r = (Select round(count(*)/2) from sparepart)

--Q no 7
Select e.*,rownum from(Select s.*, rowid as r from sparepart s
order by rowid desc) e
where rownum < 5


--example
Select * from (Select s.*, rownum as r from sparepart s)
where r = 4003


--Q9 --ALternate approach to delete previous duplicate records barring the latest entry
Select * FROM ser_det s1
WHERE s1.rowid < (
    SELECT MAX(s2.rowid)
    FROM ser_det s2
    WHERE s1.cid = s2.cid
);

