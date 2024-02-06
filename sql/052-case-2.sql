-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 052-case-2.sql
-- Problem:
-- Every employee in department 30 is entitled to
-- commission as follows: display 100 basic comission
-- for everyone who haven't had it previously and those
-- who already earn commission, get 5% increase. Other
-- departments are not affected. Sort the results by
-- updated commission (lowest first) and name
-- (alphabetically).

SELECT ename,
       CASE WHEN ( deptno = 30
                 AND
                   ( comm <= 0
                     OR
                     comm IS NULL
                   )
                 )
                THEN 100
            WHEN  deptno = 30
                THEN  comm + 5.0/100 * comm
            ELSE comm
       END AS "comm"
FROM emp
ORDER BY comm ASC,
         ename ASC;

-- End of file
