--Delete inserted teams
DELETE FROM teams WHERE team_id BETWEEN 1 AND 32;
DROP TABLE IF EXISTS champions;