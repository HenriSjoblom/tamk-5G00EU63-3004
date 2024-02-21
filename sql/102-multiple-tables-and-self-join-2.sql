-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-021
-- File: 102-multiple-tables-and-self-join-2.sql
-- Problem:
-- Display the department number, employee name and all
-- the employees that work in the same department
-- (Colleagues). Label columns "Dept", "Employee" and
-- "Colleague". Order the results by "Dept"
-- (lowest first), "Employee" (alphabetically)
-- and "Colleague" (alphabetically).

SELECT e1.deptno AS "Dept",
       e1.ename AS "Employee",
       e2.ename AS "Colleague"
FROM emp AS "e1"
JOIN emp AS "e2"
ON e1.deptno = e2.deptno
WHERE LOWER(e2.ename) IN ('blake', 'ford', 'scott')
ORDER BY "Dept" ASC,
         "Employee" ASC,
         "Colleague" ASC;

-- End of file
