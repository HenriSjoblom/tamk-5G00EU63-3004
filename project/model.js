const sqlite3 = require("sqlite3").verbose()

const findTeam = (location, division, conference) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database("database.db")

    // Initialize an array to store the WHERE conditions
    const whereConditions = [];
    const queryParams = [];

    if (location) {
      whereConditions.push("LOWER(location) = ?")
      queryParams.push(location.toLowerCase())
    }
    if (division) {
      whereConditions.push("LOWER(division) = ?")
      queryParams.push(division.toLowerCase())
    }
    if (conference) {
      whereConditions.push("LOWER(conference) = ?")
      queryParams.push(conference.toLowerCase())
    }

    let whereStart= ""
    if (queryParams.length > 0) {
      whereStart = "WHERE "
    }
    // Construct the complete WHERE clause
    const whereClause = whereConditions.join(" AND ");

    const query = `SELECT id,
                          name,
                          location,
                          division,
                          conference
                   FROM team
                   ${whereStart} ${whereClause}
                   ORDER BY id ASC;`
    console.log(query)
    console.log(queryParams)
    db.all(query, queryParams, (err, rows) => {
      db.close()
      if (err) {
          reject(err)
      } else {
          resolve(rows)
      }
    })
  })
}

const findChampion = (season, team_id) => {
  return new Promise((resolve, reject) => {

    // Initialize an array to store the WHERE conditions
    const whereConditions = [];
    const queryParams = [];

    if (season) {
      whereConditions.push("season = ?")
      queryParams.push(season)
    }
    if (team_id) {
      whereConditions.push("team_id = ?")
      queryParams.push(team_id)
    }

    let whereStart= ""
    if (queryParams.length > 0) {
      whereStart = "WHERE "
    }

    // Construct the complete WHERE clause
    const whereClause = whereConditions.join(" AND ")

    const db = new sqlite3.Database("database.db")
    const query = `SELECT c.id,
                          c.season,
                          c.team_id,
                          t.name AS "team_name"
                   FROM champion AS c
                   INNER JOIN team AS t
                         ON c.team_id == t.id
                   ${whereStart} ${whereClause}
                   ORDER BY c.id ASC;
                   `;

    db.all(query, queryParams, (err, rows) => {
      db.close()
      if (err) {
          reject(err)
      } else {
          resolve(rows)
      }
    })
  })
}

const findArena = (team_id) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database("database.db")

    let queryParams = []
    let whereClause = ""
    if (team_id) {
      whereClause = "WHERE a.team_id = ?";
      queryParams = [team_id]
    }

    const query = `SELECT a.id,
                          a.name,
                          a.team_id,
                          t.name AS "team_name"
                   FROM arena AS a
                   INNER JOIN team AS t
                         ON a.team_id == t.id
                   ${whereClause}
                   ORDER BY a.id ASC;
                   `;

    db.all(query, queryParams, (err, rows) => {
      db.close()
      if (err) {
          reject(err)
      } else {
          resolve(rows)
      }
    })
  })
}

const findFranchise = (location, division, conference, stanley_cups) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database("database.db")


   // Initialize an array to store the WHERE conditions
   const whereConditions = []
   const queryParams = []
   let havingClause = ""

   if (stanley_cups) {
    havingClause = "HAVING stanley_cups > 0";
  }
   if (location) {
     whereConditions.push("LOWER(location) = ?")
     queryParams.push(location.toLowerCase());
   }
   if (division) {
     whereConditions.push("LOWER(division) = ?")
     queryParams.push(division.toLowerCase());
   }
   if (conference) {
     whereConditions.push("LOWER(conference) = ?")
     queryParams.push(conference.toLowerCase())
   }

   let whereStart= ""
   if (queryParams.length > 0) {
    whereStart = "WHERE "
   }
   // Construct the complete WHERE clause
   const whereClause = whereConditions.join(" AND ")

   const query = `SELECT t.id,
                         t.name AS "team_name",
                         t.location,
                         t.division,
                         t.conference,
                         a.name AS "arena_name",
                         COUNT(c.season) as stanley_cups
                  FROM team AS t
                  LEFT JOIN champion AS c
                        ON t.id == c.team_id
                  INNER JOIN arena AS a
                        ON t.id == a.team_id
                  ${whereStart} ${whereClause}
                  GROUP BY t.name
                  ${havingClause}
                  ORDER BY t.id ASC;`;

    console.log("WHERE CLAUSE " + whereClause)
    console.log("QUERY: " + query)
    db.all(query, queryParams, (err, rows) => {
      db.close()
      if (err) {
          reject(err)
      } else {
          resolve(rows)
      }
    })
  })
}


module.exports = {
  findTeam,
  findChampion,
  findArena,
  findFranchise
}