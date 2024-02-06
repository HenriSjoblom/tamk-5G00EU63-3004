-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 028-where-8.sql
-- Problem:
-- [NULL value handling] Display the employee name and
-- job for all employees who do not have a manager.

SELECT ename,
       job
FROM emp
WHERE mgr IS NULL;

-- End of file
