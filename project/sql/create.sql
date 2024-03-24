DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS champion;

--Creates nhl teams table
CREATE TABLE IF NOT EXISTS team (
    id INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY]
    , team_name VARCHAR(200) NOT NULL
    , location VARCHAR(200)
    , division VARCHAR(200)
    , conference VARCHAR(200)
);

-- Create the stanley_cup_champions table
CREATE TABLE IF NOT EXISTS champion (
    id INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY]
    ,season VARCHAR(4) NOT NULL UNIQUE
    , team_id INTEGER [NOT NULL]

    , CONSTRAINT champions__team_id_fk
      FOREIGN KEY (team_id)
      REFERENCES teams (id)

    , CONSTRAINT champions__season_ck
        CHECK (LENGTH(season) = 4)
);