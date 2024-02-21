-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-021
-- File: 102-multiple-tables-and-self-join-2.sql
-- Problem:
-- Display location and department name for all employees
-- whose manager is either BLAKE, FORD or JONES and where
-- manager earns more than salary in grade 3. Order the
-- results alphabetically by "Location", "Manager" and
-- "Employee".

SELECT d.loc AS "Location",
       d.dname AS "Department",
       e1.ename AS "Employee",
       e2.ename AS "Manager"
FROM emp AS e1
INNER JOIN emp AS e2
        ON e1.mgr = e2.empno
INNER JOIN dept AS d
        ON e1.deptno = d.deptno
INNER JOIN salgrade AS s
        ON e2.sal BETWEEN s.losal AND s.hisal
WHERE LOWER(e2.ename) IN ('blake', 'ford', 'jones')
      AND
      s.grade > 3
ORDER BY "Location" ASC,
         "Manager" ASC,
         "Employee" ASC;

-- End of file
