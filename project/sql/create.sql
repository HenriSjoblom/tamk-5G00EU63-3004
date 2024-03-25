DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS champion;
DROP TABLE IF EXISTS arena;

--Creates nhl teams table
CREATE TABLE IF NOT EXISTS team (
    id INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY]
    , name VARCHAR(200) NOT NULL
    , location VARCHAR(200)
    , division VARCHAR(200)
    , conference VARCHAR(200)
);

-- Create the stanley_cup_champions table
CREATE TABLE IF NOT EXISTS champion (
    id INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY]
    , season VARCHAR(4) NOT NULL UNIQUE
    , team_id INTEGER NOT NULL

    , CONSTRAINT champion__team_id_fk
      FOREIGN KEY (team_id)
      REFERENCES teams (id)

    , CONSTRAINT champions__season_ck
        CHECK (LENGTH(season) = 4)
);

-- Create arena table for nhl teams
CREATE TABLE IF NOT EXISTS arena (
    id INTEGER PRIMARY KEY
    , name VARCHAR(200)
    , team_id INTEGER NOT NULL

    , CONSTRAINT arena__team_id_fk
      FOREIGN KEY (team_id)
      REFERENCES teams (id)

);