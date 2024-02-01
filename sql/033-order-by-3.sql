-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 033-order-by-3.sql
-- Problem:
-- How much each employee pays taxes in department 10 in
-- a year when tax rate is 31%?. Ignore commission. Sort
-- the result by department number (lowest first) and
-- employee name (alphabetically).

SELECT deptno AS "Dept",
       ename AS "Employee",
       sal * 12 * 0.31 AS "Taxes"
FROM emp
WHERE deptno = 10
ORDER BY deptno ASC,
         ename ASC;

-- End of file