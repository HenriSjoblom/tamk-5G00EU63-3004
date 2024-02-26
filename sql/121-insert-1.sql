-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-26
-- File: 121-insert-1.sql
-- Problem:
-- table: person
--
-- id last   first   phone  zip   city       address
-- -- -----  -----   ------ ----- ---------- -----------
--  1 Doe    John    123455 11122 New York   2th avenue
--  2 Jordan Mike    221122 01212 Washington South Park 3
--  3 Durak  Stephen 550011 55654 Miami      Sea Drive 112

INSERT INTO person
(
    id,
    last,
    phone,
    zip,
    city,
    address
)
VALUES
(
    1,
    'Doe',
    'John',
    123455,
    11122,
    'New York',
    '2th avenue'
);

INSERT INTO person
(
    id,
    last,
    phone,
    zip,
    city,
    address
)
VALUES
(
    2,
    'Jordan',
    'Mike',
    221122,
    01212,
    'Washington',
    'South Park 3'
);

INSERT INTO person
(
    id,
    last,
    phone,
    zip,
    city,
    address
)
VALUES
(
    3,
    'Durak',
    'Stephen',
    550011,
    55654,
    'Miami',
    'Sea Drive 112'
);
-- End of file
