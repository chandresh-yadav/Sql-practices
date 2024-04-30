Select rownum, first_name from employees101
order by first_name asc;

SELECT rownum, e.*
FROM (
    SELECT *
    FROM employees101
    ORDER BY first_name desc
) e
