-- Author: Henri Sjöblom <henri.sjoblom@tuni.fi>
-- Date: 2024-02-26
-- File: 122-insert-2.sql
-- Problem:
-- table: football
--
--  id first  last     team        comment
--  -- -----  -------  ----------- ----------------------
--   1 Jim    Anders   Manchester  UPS 10
--   2 Mark   Knofles  Liverpool   Rockwell international
--   3 Jenny  Richards Highland    Scottish national

INSERT INTO football
(
    id,
    first,
    last,
    team,
    comment
)
VALUES
(
    1,
    'Jim',
    'Anders',
    'Manchester',
    'UPS 10'
);

INSERT INTO football
(
    id,
    first,
    last,
    team,
    comment
)
VALUES
(
    2,
    'Mark',
    'Knofles',
    'Liverpool',
    'Rockwell international'
);

INSERT INTO football
(
    id,
    first,
    last,
    team,
    comment
)
VALUES
(
    3,
    'Jenny',
    'Richards',
    'Highland',
    'Scottish national'
);

-- End of file
