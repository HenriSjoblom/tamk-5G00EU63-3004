-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-021
-- File: 094-multiple-tables-4.sql
-- Problem:
-- Display the employee name and department name for all
-- employees who have an a character in their name and who
-- earn more than 1100 but less or equal than 2200. Order
-- the results alphabetically by employee name.

SELECT e.ename,
       d.dname
FROM emp AS e
JOIN dept AS d
  ON e.deptno = d.deptno
WHERE LOWER(e.ename) LIKE '%a%'
      OR
      (
      e.sal > 1100
      AND
      e.sal <= 2200
      )
ORDER BY e.ename ASC;

-- End of file
