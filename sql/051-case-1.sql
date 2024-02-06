-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 051-case-1.sql
-- Problem:
-- Write a query to change all the SALESMAN job
-- descriptions to SALES PERSON. Order the results by job
-- (alphabetically) and name (alphabetically).

SELECT ename AS "Name",
       CASE WHEN LOWER(job) = 'salesman'
                 THEN 'SALES PERSON'
            ELSE job
       END AS "New Job Name"
FROM emp
ORDER BY job ASC,
         ename ASC;

-- End of file
