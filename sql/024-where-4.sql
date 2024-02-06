-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-01-31
-- File: 024-where-4.sql
-- Problem:
-- Display the employee name, job, hiredate between
-- February 20, 1981 and May 1 1981; including the
-- beginning and end dates.

SELECT ename,
       job,
       hiredate
FROM emp
WHERE hiredate BETWEEN '1981-02-20' AND '1981-05-01';

-- End of file
