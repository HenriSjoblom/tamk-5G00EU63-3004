-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 071-functions-1.sql
-- Problem:
-- Write a query to display all results for all employees
-- in lowercase. Order the reults by name (alphabetically)
-- and job (alphabetically).

SELECT LOWER(ename) AS "Name",
       LOWER(job) AS "Job",
       sal AS "Salary"
FROM emp
ORDER BY ename ASC,
         job ASC;

-- End of file
