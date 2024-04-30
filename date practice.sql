Select employee_id, first_name, hire_date,months_between(sysdate,hire_date), round(months_between(sysdate,hire_date)) from employees101 e


SELECT 
    TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('1995-11-15', 'YYYY-MM-DD')) / 12) AS Years,
    TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, TO_DATE('1995-11-15', 'YYYY-MM-DD')), 12)) AS Months,
    TRUNC(MOD(SYSDATE - TO_DATE('1995-11-15', 'YYYY-MM-DD'), 30.4375)) AS Days
FROM dual;

Select * from employees101
where extract (year from)