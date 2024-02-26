-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-23
-- File: 114-create-table-sql-4.sql
-- Problem:
-- Create inventory table (do not insert any data)
-- Note: worth is expressed in whole numbers only.

CREATE TABLE inventory
(
    id          INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY]
    , item      VARCHAR(200)
    , worth     INTEGER
    , comment   VARCHAR(200)

    , CONSTRAINT person__worth_ck
           CHECK (MOD(worth, 1) = 0)
);

-- End of file
