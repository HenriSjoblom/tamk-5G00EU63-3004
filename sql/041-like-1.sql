-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 041-like-1.sql
-- Problem:
-- Display the names of all employees where the third
-- letter of their name contains character a. Make the
-- query generic for all names.

SELECT ename
FROM emp
WHERE ename LIKE '__a%';

-- End of file