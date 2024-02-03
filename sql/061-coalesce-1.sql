-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 061-coalesce-1.sql
-- Problem:
-- Display report for employees in department 30. Display
-- zero for all who do not earn comission Sort the results
-- name (alphabetically) and commission (lowest first).

SELECT deptno,
       ename,
       COALESCE(comm, 0) AS "comm"
FROM emp
ORDER BY ename ASC, COALESCE(comm, 0) ASC;

-- End of file