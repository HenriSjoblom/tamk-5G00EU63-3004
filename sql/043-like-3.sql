-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 043-like-3.sql
-- Problem:
-- Display Display the name of all employees who have two
-- L characters in their name. All these must work in
-- department 10 or their manager is 7782. Make the query
-- generic for all names.

SELECT ename
FROM emp
WHERE (LOWER(ename) LIKE '%l%l%'
       AND
       (
         deptno = 10
         OR
         mgr = 7782
       )
      )
      AND
      ( deptno = 10
        OR
        mgr = 7782
      );

-- End of file