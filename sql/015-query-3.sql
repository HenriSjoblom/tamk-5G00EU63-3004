-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-01-31
-- File: 015-query-3.sql
-- Problem:
-- Create a query to display unique jobs.
-- Order the results alphabetically.

SELECT DISTINCT(job)
FROM emp
ORDER BY job ASC;

-- End of file
