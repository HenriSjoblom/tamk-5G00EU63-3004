-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-013
-- File: 091-multiple-tables-1.sql
-- Problem:
-- Write a query to display employee's name, department
-- number and department name for all employees who work
-- in Dallas or whose job title is salesman. Order the
-- results alphabetically by employee name.

SELECT e.ename,
       e.deptno,
       d.dname
FROM emp AS "e"
INNER JOIN dept AS "d"
USING (deptno)
WHERE LOWER(d.loc) == 'dallas'
      OR
      LOWER(job) = 'salesman'
ORDER BY e.ename ASC;

-- End of file
