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
    , time_of_reading   VARCHAR(200)
    , high              VARCHAR(200)
    , low               VARCHAR(80)
    , sig               VARCHAR(2)
    , comment           VARCHAR(200)


    , CONSTRAINT person__sig_ck
           CHECK (LENGTH(sig) = 2)

    , CONSTRAINT weather__temperature_ck
           CHECK (high LIKE '-[0-9]+.[0-9]' OR high LIKE '[0-9]+.[0-9]')
                 AND
                 (low LIKE '-[0-9]+.[0-9]' OR low LIKE '[0-9]+.[0-9]')
);

-- End of file
