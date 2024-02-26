-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-26
-- File: 124-insert-4.sql
-- Problem:
-- table: inventory
--
--  id item       worth  comment
--  -- --------   -----  -------------------
--   1 baseball   150    My first baseball
--   2 bike       2000   For mountain riding
--   3 playcards  10     Funny pictures

INSERT INTO inventory
(
    id,
    item,
    worth,
    comment
)
VALUES
(
    1,
    'baseball',
    150,
    'My first baseball'
);

INSERT INTO inventory
(
    id,
    item,
    worth,
    comment
)
VALUES
(
    2,
    'bike',
    2000,
    'For mountain riding'
);

INSERT INTO inventory
(
    id,
    item,
    worth,
    comment
)
VALUES
(
    3,
    'playcards',
    10,
    'Funny pictures'
);

-- End of file
