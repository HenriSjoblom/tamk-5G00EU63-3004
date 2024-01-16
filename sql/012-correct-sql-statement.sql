-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-01-16
-- File: 011-list-tables.sql
-- Problems:
-- SELECT  empno, ename
--                salary x 12 ANNUAL SALARY
--                emp
--        ;
-- 1. the "x" is not multiplication. Use "*"
-- 2. There is missing comma (,) after "ename" col
-- 3. Missing "FROM"
-- 4. Missing "AS" between 12 and ANNUAL
-- 5. Missing quates around from "ANNUAL SALARY"
-- 6. Correct column name "salary" to "sal"

SELECT empno
       , ename,
       , sal * 12 AS "ANNUAL SALARY"
FROM emp;

-- End of file
