-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-07
-- File: 082-groupfunctions-2.sql
-- Problem:
-- How many employees work in department 30? Label the
-- column "count of dept 30",

SELECT COUNT(deptno) AS "count of dept 30"
FROM emp
GROUP BY deptno
HAVING deptno = 30;

-- End of file
