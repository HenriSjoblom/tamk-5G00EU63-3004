-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-01-31
-- File: 022-where-2.sql
-- Problem:
-- Create a query to display the employee name and
-- department number with employee number 7566.

SELECT ename,
       deptno
FROM emp
WHERE empno = 7566;

-- End of file
