-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-02
-- File: 062-coalesce-2.sql
-- Problem:
-- Display the total net income of each employee per
-- month. The total income is result of salary and
-- comission which both are paid monthly. The salary's
-- tax rate is 31% and comission's tax rate is 20%.
-- Sort the results by the net income (lowest first).

SELECT ename AS "Name",
       COALESCE(sal, 0) * 0.69 + COALESCE(comm, 0) * 0.8  AS "Net Income",
       COALESCE(sal, 0) * 0.31 + COALESCE(comm, 0) * 0.2 AS "Tax"
FROM emp
ORDER BY sal * 0.69 + comm * 0.8 ASC;

-- End of file
