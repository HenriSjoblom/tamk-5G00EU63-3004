-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-021
-- File: 095-multiple-tables-5.sql
-- Problem:
-- Write a query to display the name, job, department
-- number and department name for all employees who: work
-- in accounting department and who earn more than 1000;
-- who work in sales department and earn more than 1000;
-- and who work in operations and earn more than 1000.
-- Ignore commission. Order the results alphabetically
-- by employee name.

SELECT e.ename,
       e.job,
       e.deptno,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
      ON e.deptno = d.deptno
WHERE LOWER(d.dname) IN ('accounting', 'sales', 'operations')
      AND
      e.sal > 1000
ORDER BY e.ename ASC;

-- End of file
