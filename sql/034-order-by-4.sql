-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 033-order-by-3.sql
-- Problem:
-- Display the name, salary and calculate new salary and
-- commission for all employees whose commission amount is
-- greater than their salary increased by 10%. Sort the
-- result by employee name (alphabetically), salary
-- (lowest first) and commission (lowest first).

SELECT ename AS "Employee",
       sal AS "Montly Salary",
       sal * 1.1 AS "Sal 10%",
       comm AS "Comm"
FROM emp
WHERE comm > sal * 1.1
ORDER BY ename ASC,
         sal ASC,
         comm ASC;

-- End of file