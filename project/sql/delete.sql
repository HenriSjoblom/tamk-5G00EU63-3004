--Delete inserted teams
DELETE
FROM team
WHERE id BETWEEN 1 AND 32;


DELETE
FROM champion
WHERE id BETWEEN 2001 AND 2023;


DELETE
FROM arena
WHERE id BETWEEN 1 AND 32;
