-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-01
-- File: 027-where-7.sql
-- Problem:
-- Display the employee name, job, and salary for all
-- employees whose job is CLERK or ANALYST and their
-- salary is not equal to 1000 or 5000.

SELECT ename,
       job,
       sal
FROM emp
WHERE ( LOWER(job) = 'clerk'
        OR
        LOWER(job) = 'analyst'
      )
      AND
      ( sal <> 1000
        OR
        sal <> 5000
      );

-- End of file
