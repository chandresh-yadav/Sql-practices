Create table phone
(
phone_no int check(phone_no >= 1000000000 and phone_no <= 9999999999)

)

Insert into phone values (8765432100)

drop table phone

