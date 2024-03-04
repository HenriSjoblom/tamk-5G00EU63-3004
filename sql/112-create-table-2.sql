-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-23
-- File: 112-create-table-sql-2.sql
-- Problem:
-- Create table for football teams (do not insert any data).
-- Coach first name, coach last name, team name and comment.

CREATE TABLE football
(
    id          INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY]
    , first     VARCHAR(200)
    , last      VARCHAR(200)
    , team      VARCHAR(200)
    , comment   VARCHAR(500)
);

-- End of file
