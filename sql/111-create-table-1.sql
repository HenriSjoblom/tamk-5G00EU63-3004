-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-23
-- File: 111-create-table-sql-1.sql
-- Problem:
-- Create table for persons (do not insert any data).
-- Last name, first name, phone number (consider
-- international format), post code (zip), city
-- name and street address.
-- Note: suppose phone numbers can contain only "+" and spaces.
-- Examples: +358 50 12 34 55 66

CREATE TABLE person
(
    id          INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY]
    , first     VARCHAR(200)
    , last      VARCHAR(200)
    , phone     VARCHAR(80)
    , zip       INTEGER
    , city      VARCHAR(200)
    , address   VARCHAR(200)

    CONSTRAINT person__phone_ck
         CHECK (phone LIKE '+%[0-9 ]%')
);

-- End of file
