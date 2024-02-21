-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-021
-- File: 103-multiple-tables-and-self-join-3.sql
-- Problem:
-- Display all employee names who earn more than their
-- managers. Ignore commission. Order the results
-- alphabetically by employee name.

SELECT e1.ename
FROM emp AS "e1"
JOIN emp AS "e2"
ON e1.mgr = e2.empno
WHERE e1.sal > e2.sal
ORDER BY e1.ename ASC;

-- End of file
