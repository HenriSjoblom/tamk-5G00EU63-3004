-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 072-functions-2.sql
-- Problem:
-- Write query to display following report for all
-- employees. Pay attention to the order of the displayed
-- rows.

SELECT LOWER(ename) AS "Name",
       LENGTH(ename) as "Characters"
FROM emp
ORDER BY LENGTH(ename) ASC,
         LOWER(ename) ASC;

-- End of file