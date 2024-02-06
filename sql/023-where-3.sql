-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-01-31
-- File: 023-where-3.sql
-- Problem:
-- Display the employee name and salary
-- (ignore commission) for all employees whose salary
-- is not in the range 1500 and 2850. Values 1500 and 2850
-- are not included.

SELECT ename,
       sal
FROM emp
WHERE sal < 1500
      OR
      sal > 2850;

-- End of file
