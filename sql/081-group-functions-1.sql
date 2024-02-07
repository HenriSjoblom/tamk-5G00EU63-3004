-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-07
-- File: 081-groupfunctions-1.sql
-- Problem:
-- Display number of managers by job title, including the
-- president, in the whole company. Label the column
-- "count of mangers".

SELECT COUNT(*) AS "count of managers"
FROM emp
WHERE job IN ('MANAGER', 'PRESIDENT');


-- End of file
