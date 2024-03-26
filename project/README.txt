GENERAL

Author: Firstnam Lastname <email@tuni.fi>
Date: 2024-03-26


DESCRIPTION

NHL Team API

The NHL Team API serves information about National Hockey League (NHL) teams.
Beyond teams, the API shares a bit history. It reveals Stanley Cup wins and
has information about arenas in the league.

Api has four endpoints:
    1. /team
        - basic information about NHL teams
    2. /champion
        - provides historical data related to Stanley Cup wins
    3. /arena
        - retrieve details about each team’s home arena
    4 /franchise
        - franchise endpoint combines information from the other endpoints
        - additionally, it calculates the total number of Stanley Cups won by
          each franchise



INSTALL

Install the required dependencies listed in package.json using command
    - npm install

Create a .env file in the project root directory. Env file should include
PORT variable. Otherwise, port is default 8080.

Ensure you have an SQLite database file named database.db in the project folder.
If not, create an empty SQLite database file. project/sql/Readme.txt contains
instruction to set up database.


USAGE

To start API use command
    - npm start

API will be available at http://localhost:{PORT} which is specified in .env file
and otherwise it is 8080.


API DESCRIPTION

The NHL Team API provides information related to National Hockey League (NHL)
teams. It offers four distinct endpoints:
    1. /team
        - basic information about NHL teams
        - sorting possible by using location, division and conference
    2. /champion
        - provides historical data related to Stanley Cup wins
        - sorting based season and team id
        - possibility to create and delete entities
    3. /arena
        - retrieve details about each team’s home arena
        - sorting possible by using team id
        - possibility to update entities
    4 /franchise
        - franchise endpoint combines information from the other endpoints
        - additionally, it calculates the total number of Stanley Cups won by
          each franchise
        - sorting possible by using location, division, conference and stanley cup win


API EXAMPLES

curl --silent --include http://localhost:8080/api/v1/team
curl --silent --include http://localhost:8080/api/v1/team?location=sunrise&conference=eastern&division=atlantic
curl --silent --include http://localhost:8080/api/v1/champion
curl --silent --include http://localhost:8080/api/v1/champion?season=2006&team_id=6
curl --silent --include http://localhost:8080/api/v1/arena
curl --silent --include http://localhost:8080/api/v1/arena?team_id=9
curl --silent --include http://localhost:8080/api/v1/franchise
curl --silent --include http://localhost:8080/api/v1/franchise?location=chicago&conference=western&division=central&stanleyCup=true

curl -d  '{"id":"2027", "season": "2027", "team_id":"13"}' -H 'Content-Type: application/json' --silent --include http://localhost:8080/api/v1/champion

curl -X "DELETE" --silent --include http://localhost:8080/api/v1/champion/2024

curl -X PATCH -H "Content-Type: application/json" -d '{"name": "Colorado Center", "teamId": "8" }' --silent --include http://localhost:8080/api/v1/arena/8
