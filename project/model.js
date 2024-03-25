let sqlite3 = require("sqlite3").verbose()
let db = new sqlite3.Database("database.db")
//let md5 = require("md5")

const findTeam = () => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database("database.db")
    const query = `SELECT t.id,
                          t.team_name,
                          t.location,
                          t.division,
                          t.conference,
                          COUNT(c.season) as stanley_cups,
                          a.name AS "arena_name"
                   FROM team AS t
                   LEFT JOIN champion AS c
                         ON t.id == c.team_id
                   INNER JOIN arena AS a
                         ON t.id == a.team_id
                   GROUP BY t.team_name
                   ORDER BY a.id ASC;`

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

const findArena = () => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database("database.db")
    const query = `SELECT a.id,
                          a.name,
                          a.team_id,
                          t.team_name
                   FROM arena AS a
                   INNER JOIN team AS t
                         ON a.team_id == t.id
                   ORDER BY a.id ASC;
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
  findArena,
}