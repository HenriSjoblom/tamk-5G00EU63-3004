--Creates table for teams

CREATE TABLE IF NOT EXISTS teams (
    team_id INTEGER [NOT NULL] [UNIQUE] [PRIMARY KEY],
    team_name VARCHAR(200) NOT NULL,
    location VARCHAR(200),
    division VARCHAR(200),
    conference VARCHAR(200)
);