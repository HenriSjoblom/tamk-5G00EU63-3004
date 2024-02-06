-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 028-where-8.sql
-- Problem:
-- [NULL value handling] Display the employee name,
-- salary, and commission for all employees who earn
-- commissions.

SELECT ename,
       sal,
       comm
FROM emp
WHERE comm > 0;

-- End of file
