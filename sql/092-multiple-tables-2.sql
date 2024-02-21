-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-020
-- File: 092-multiple-tables-2.sql
-- Problem:
-- Create a unique listing of all jobs in company's
-- branches in Boston or New York. Order the results
-- alphabetically by job names.

SELECT DISTINCT(e.job)
FROM emp AS "e"
INNER JOIN dept AS "d"
USING (deptno)
WHERE LOWER(d.loc) = 'boston'
      OR
      LOWER(d.loc) = 'new york'
ORDER BY e.job ASC;

-- End of file
