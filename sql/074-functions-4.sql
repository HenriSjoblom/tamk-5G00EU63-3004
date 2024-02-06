-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 074-functions-4.sql
-- Problem:
-- Write a query to display the employee's name and job
-- title in lowercae for all employees whose name starts
-- with letter a, m or j. Order the results by name
-- (alphabeticaly) and job (alphabetically). Display
-- results for all employees: leave other empoyees' job
-- titles unaffected.

SELECT ename,
       CASE WHEN SUBSTRING(LOWER(ename), 1, 1) = 'a'
                 OR
                 SUBSTRING(LOWER(ename),1, 1) = 'm'
                 OR
                 SUBSTRING(LOWER(ename), 1, 1) = 'j'
                 THEN LOWER(job)
            ELSE job
            END AS "job"
FROM emp
ORDER BY ename ASC,
         job ASC;

-- End of file
