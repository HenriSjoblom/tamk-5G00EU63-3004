let sqlite3 = require("sqlite3").verbose()
let db = new sqlite3.Database("database.db")
//let md5 = require("md5")

const findTeams = () => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database("database.db")
    const query = `SELECT *
                   FROM teams;`;

    db.all(query, [], (err, rows) => {
      db.close();
      if (err) {
          reject(err);
      } else {
          resolve(rows);
      }
    })
  })
}

module.exports = {
  findTeams,
}