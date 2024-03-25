let sqlite3 = require("sqlite3").verbose()
let db = new sqlite3.Database("database.db")
//let md5 = require("md5")

const findTeam = () => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database("database.db")
    const query = `SELECT *
                   FROM team;`;

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

const findChampion = () => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database("database.db")
    const query = `SELECT c.id,
                          c.season,
                          c.team_id,
                          t.team_name
                   FROM champion AS c
                   INNER JOIN team AS t
                         ON c.team_id == t.id
                   ORDER BY c.id ASC;
                   `;

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
  findTeam,
  findChampion,
}