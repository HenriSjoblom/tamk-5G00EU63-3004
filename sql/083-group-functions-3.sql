-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-07
-- File: 083-groupfunctions-3.sql
-- Problem:
-- Display the highest and lowest salaries for employees
-- including departments 10 and 30. Label the columns
-- "high" and "low"

SELECT MAX(sal) AS "high",
       MIN(sal) AS "low"
FROM emp
WHERE deptno = 30 OR deptno = 10;

-- End of file
