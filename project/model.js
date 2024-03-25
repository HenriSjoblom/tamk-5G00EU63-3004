const sqlite3 = require('sqlite3').verbose()

const findTeam = (location, division, conference) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('database.db')

    // Initialize an array to store the WHERE conditions
    const whereConditions = []
    const queryParams = []

    if (location) {
      whereConditions.push('LOWER(location) = ?')
      queryParams.push(location.toLowerCase())
    }
    if (division) {
      whereConditions.push('LOWER(division) = ?')
      queryParams.push(division.toLowerCase())
    }
    if (conference) {
      whereConditions.push('LOWER(conference) = ?')
      queryParams.push(conference.toLowerCase())
    }

    let whereStart = ''
    if (queryParams.length > 0) {
      whereStart = 'WHERE '
    }
    // Construct the complete WHERE clause
    const whereClause = whereConditions.join(' AND ')

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

const findChampion = (season, teamId) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('database.db')
    // Initialize an array to store the WHERE conditions
    const whereConditions = []
    const queryParams = []

    if (season) {
      whereConditions.push('season = ?')
      queryParams.push(season)
    }
    if (teamId) {
      whereConditions.push('team_id = ?')
      queryParams.push(teamId)
    }

    let whereStart = ''
    if (queryParams.length > 0) {
      whereStart = 'WHERE '
    }

    // Construct the complete WHERE clause
    const whereClause = whereConditions.join(' AND ')

    const query = `SELECT c.id,
                          c.season,
                          c.team_id,
                          t.name AS "team_name"
                   FROM champion AS c
                   INNER JOIN team AS t
                         ON c.team_id == t.id
                   ${whereStart} ${whereClause}
                   ORDER BY c.id ASC;
                   `

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

const createChampion = (id, season, teamId) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('database.db')
    const queryParams = [id, season, teamId]
    const query = `INSERT INTO champion
                    (
                    id,
                    season,
                    team_id
                    )
                    VALUES
                    (
                    ?,
                    ?,
                    ?
                    );
                    `

    console.log('QUERY PARAMS ' + queryParams)
    console.log('QUERY: ' + query)

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

const deleteChampion = (id) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('database.db')
    const queryParams = [id]
    const query = `DELETE
                   FROM champion
                   WHERE id = ?
                    `

    console.log('QUERY PARAMS ' + queryParams)
    console.log('QUERY: ' + query)

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

const findArena = (teamId) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('database.db')

    let queryParams = []
    let whereClause = ''
    if (teamId) {
      whereClause = 'WHERE a.team_id = ?'
      queryParams = [teamId]
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
                   `

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

const findArenaById = (id) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('database.db')

    const queryParams = [id]
    const query = `SELECT id,
                          name,
                          team_id
                   FROM arena
                   WHERE id = ?
                   `

    console.log('PARAMS ' + queryParams)
    console.log('QUERY: ' + query)
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

const updateArena = (id, name, teamId) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('database.db')

    const queryParams = [name, teamId, id]
    const query = `UPDATE arena
                   SET name = ?,
                       team_id = ?
                   WHERE id = ?
                   `

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

const findFranchise = (location, division, conference, stanleyCup) => {
  return new Promise((resolve, reject) => {
    const db = new sqlite3.Database('database.db')

    // Initialize an array to store the WHERE conditions
    const whereConditions = []
    const queryParams = []
    let havingClause = ''

    if (stanleyCup) {
      havingClause = 'HAVING stanley_cups > 0'
    }
    if (location) {
      whereConditions.push('LOWER(location) = ?')
      queryParams.push(location.toLowerCase())
    }
    if (division) {
      whereConditions.push('LOWER(division) = ?')
      queryParams.push(division.toLowerCase())
    }
    if (conference) {
      whereConditions.push('LOWER(conference) = ?')
      queryParams.push(conference.toLowerCase())
    }

    let whereStart = ''
    if (queryParams.length > 0) {
      whereStart = 'WHERE '
    }
    // Construct the complete WHERE clause
    const whereClause = whereConditions.join(' AND ')

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
                  ORDER BY t.id ASC;`

    console.log('WHERE CLAUSE ' + whereClause)
    console.log('QUERY: ' + query)
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
  createChampion,
  deleteChampion,
  findArena,
  findArenaById,
  updateArena,
  findFranchise
}
