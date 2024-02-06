-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 025-where-5.sql
-- Problem:
-- Display the employee name and department number of all
-- employees in departments 10 and 30.

SELECT ename,
       deptno
FROM emp
WHERE deptno = 10
      OR
      deptno = 30;

-- End of file
