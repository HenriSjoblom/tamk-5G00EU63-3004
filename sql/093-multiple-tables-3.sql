-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-021
-- File: 093-multiple-tables-3.sql
-- Problem:
-- Write a query to display the employee name, department
-- name and location of all employees who earn
-- a commission. Order the results alphabetically by
-- employee name.

SELECT e.ename,
       d.dname,
       d.loc
FROM emp AS "e"
INNER JOIN dept AS "d"
USING (deptno)
WHERE e.comm > 0
ORDER BY e.ename ASC;

-- End of file
