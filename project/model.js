let sqlite3 = require("sqlite3").verbose();
let db = new sqlite3.Database("database.db");
let md5 = require("md5");