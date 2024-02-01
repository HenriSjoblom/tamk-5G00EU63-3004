-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-01-31
-- File: 014-query-2.sql
-- Problem:
-- Display name and calculated salaries for all employees
-- for the first quarter of the year. Ignore commissions.

SELECT ename,
       sal * 3 AS "first quarter"
FROM emp;

-- End of file
