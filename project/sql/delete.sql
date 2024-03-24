--Delete inserted teams
DELETE FROM teams WHERE team_id BETWEEN 1 AND 32;
DELETE FROM teams WHERE champion_id BETWEEN 2001 AND 2023;