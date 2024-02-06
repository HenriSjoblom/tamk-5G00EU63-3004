-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 042-like-2.sql
-- Problem:
-- Display name and department of every employees who
-- have a vowel (aeiouy or in uppercase) at the second
-- character and whose work description includes sales or
-- analysis. Sort the results by the department number
-- (lowest first) and person name (alphabetically).

SELECT ename AS "Name",
       deptno AS "Department"
FROM emp
WHERE (
        LOWER(ename) LIKE '_a%'
        OR
        LOWER(ename) LIKE '_e%'
        OR
        LOWER(ename) LIKE '_i%'
        OR
        LOWER(ename) LIKE '_o%'
        OR
        LOWER(ename) LIKE '_u%'
        OR
        LOWER(ename) LIKE '_y%'
      )
      AND
      (
        LOWER(job) LIKE '%sales%'
        OR
        LOWER(job) LIKE '%analyst%'
      )
ORDER BY deptno ASC,
         ename ASC;

-- End of file
