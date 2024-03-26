SQL FILES USAGE

This project contains SQLite database called database.db in /project folder
and three SQL files in the project/sql folder.

create.sql: This file allows creating tables if they do not already exist
            in the database.
insert.sql: Use this file to insert test data into the tables.
delete.sql: This file allows deleting the data inserted by insert.sql.

To create tables, run the following command in your terminal in project folder:
sqlite3 database.db < create.sql

To insert test data, use:
sqlite3 database.db < insert.sql

To delete the inserted data, execute:
sqlite3 database.db < delete.sql
