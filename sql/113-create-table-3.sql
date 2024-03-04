-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-23
-- File: 113-create-table-sql-3.sql
-- Problem:
-- Create table for weather report (do not insert any
-- data). Time of reading, temperature in Celsius,
-- comment column, two letter signature initials, like
-- "JD", of a person who made the temperature reading,
-- the low reading, the high reading.
-- Note: temperatures in format: -10.5 or 30.8

CREATE TABLE weather
(
    id                  INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY]
    , time_of_reading   TIMESTAMP
    , high              DECIMAL
    , low               DECIMAL
    , sig               VARCHAR(200)
    , comment           VARCHAR(200)

    , CONSTRAINT person__sig_ck
           CHECK (LENGTH(sig) = 2)
);

-- End of file
