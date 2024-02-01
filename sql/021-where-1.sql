-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-01-31
-- File: 021-where-1.sql
-- Problem:
-- Create a query to display the employee name and salary
--  of employees who earn more than 2850.

SELECT ename,
       sal
FROM emp
WHERE sal > 2850;

-- End of file
