-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-021
-- File: 101-multiple-tables-and-self-join-1.sql
-- Problem:
-- Display the manager's name and number, employee name
-- and number for those who work under managers BLAKE,
-- FORD or SCOTT. Label the columns "Manager" "Mgr#",
-- "Employee" and "Emp#". Order the results alphabetically
-- by "Manager" and "Employee" columns.

SELECT e2.ename AS "Manager",
       e1.mgr AS "Mgr#",
       e1.ename AS "Employee",
       e1.empno AS "Emp#"
FROM emp AS "e1"
INNER JOIN emp AS "e2"
ON e1.mgr = e2.empno
WHERE LOWER(e2.ename) IN ('blake', 'ford', 'scott')
ORDER BY "Manager" ASC,
         "Employee" ASC;

-- End of file
