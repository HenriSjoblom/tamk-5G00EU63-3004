-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 031-order-by-1.sql
-- Problem:
-- Display employee name, salary and new column where each
-- salary is raised by 15%. Display only employees that
-- work under manager blake. Sort the results by "new
-- salary" (lowest first) and employee name
-- (alphabetically).

SELECT ename,
       sal,
       sal * 1.15 AS "new salary"
FROM emp
WHERE mgr = (SELECT empno
             FROM emp
             WHERE LOWER(ename) = 'blake')
ORDER BY sal * 1.15 ASC,
         ename ASC;

-- End of file
