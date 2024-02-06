-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 031-order-by-1.sql
-- Problem:
-- Display employee name, salary and new column where each
-- salary is raised by 15%. Display only employees that
-- work under manager blake. Sort the results by "new
-- salary" (lowest first) and employee name
-- (alphabetically).

SELECT A.ename,
       A.sal,
       A.sal * 1.15 AS "new salary"
FROM emp AS A
INNER JOIN emp AS B
        ON A.mgr = B.empno
WHERE LOWER(B.ename) = 'blake'
ORDER BY A.sal * 1.15 ASC,
         A.ename ASC;

-- End of file
