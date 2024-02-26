-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-26
-- File: 123-insert-3.sql
-- Problem:
-- table: weather
--
--  id time_of_reading  high  low  sig comment
--  -- ---------------- ---- ----- --- ------------------------------
--   1 2000-12-11 06:00  5.5   1.5  MK  Snow-rain for a while
--   2 2000-12-12 06:00  4.1   0.3  ES  Strong wind
--   3 2000-12-14 06:00  2.0  -5.8  RD  Night was cold, foggy weather
--   4 2000-12-15 06:00  12.8  7.5  MK  Rainy day

INSERT INTO weather
(
    id,
    time_of_reading,
    high,
    low,
    sig,
    comment
)
VALUES
(
    1,
    '2000-12-11 06:00',
    5.5,
    1.5,
    'MK',
    'Snow-rain for a while'
);

INSERT INTO weather
(
    id,
    time_of_reading,
    high,
    low,
    sig,
    comment
)
VALUES
(
    2,
    '2000-12-12 06:00',
    4.1,
    0.3,
    'ES',
    'Strong wind'
);

INSERT INTO weather
(
    id,
    time_of_reading,
    high,
    low,
    sig,
    comment
)
VALUES
(
    3,
    '2000-12-14 06:00',
    2.0,
    -5.8,
    'RD',
    'Night was cold, foggy weather'
);

INSERT INTO weather
(
    id,
    time_of_reading,
    high,
    low,
    sig,
    comment
)
VALUES
(
    4,
    '2000-12-15 06:00',
    12.8,
    7.5,
    'MK',
    'Rainy day'
);

-- End of file
