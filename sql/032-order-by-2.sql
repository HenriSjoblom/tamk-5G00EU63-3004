-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 032-order-by-2.sql
-- Problem:
-- Display employee number, name, department number and
-- hiring date for all employees whose ID number is above
-- 7900 or below 7600. Sort the results by the employee
-- number (lowest first).

SELECT empno,
       ename,
       deptno,
       hiredate
FROM emp
WHERE empno > 7900
      OR
      empno < 7600
ORDER BY empno ASC;

-- End of file