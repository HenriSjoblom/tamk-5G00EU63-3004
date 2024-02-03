-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 073-functions-3.sql
-- Problem:
-- Display the employee number, employee name and
-- "new salary" which is salary increased by 15%.
-- Add column "increase that substracts salary from the
-- "new salary". Round the values to whole numbers.
-- Order the results by name (alphabetically) and
-- "new salary" (lowest first).

SELECT empno,
       ename,
       ROUND(sal + sal * 15.0/100) AS "new salary",
       ROUND( ( sal + sal * 15.0/100 ) - sal) AS "increase"
FROM emp
ORDER BY ename ASC,
         ROUND(sal + sal * 15.0/100) ASC;

-- End of file