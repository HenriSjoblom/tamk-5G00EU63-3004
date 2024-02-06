-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 026-where-6.sql
-- Problem:
-- Display the employee name and salary of employees whose
-- salary is more than 1500 and are in department 10 or
--  30. Label the columns "Employee" and "Monthly Salary".


SELECT ename AS "Employee",
       sal AS "Monthly Salary"
FROM emp
WHERE sal > 1500
      AND
      ( deptno = 10
        OR
        deptno = 30
      );

-- End of file
