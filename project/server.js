const express = require('express')
require('dotenv').config()

const {
  findTeam,
  findChampion,
  createChampion,
  deleteChampion,
  findArena,
  findArenaById,
  updateArena,
  findFranchise
} = require('./model')

const app = express()
app.use(express.json())

const port = process.env.PORT || 8080

const HTTP_STATUS_OK = 200
const POST_STATUS_CONFLICT = 409
const STATUS_NOT_FOUND = 404
const STATUS_INTERNAL_ERROR = 500
const INTERNAL_SERVER_ERROR_MESSAGE = "Internal server error"


app.get('/health', (req, res) => {
  res.setHeader('Content-Type', 'application/json')
  res.status(HTTP_STATUS_OK).send('OK')
})

app.get('/api/v1/team', async (req, res) => {
  const location = req.query.location
  const division = req.query.division
  const conference = req.query.conference

  try {
    const response = await findTeam(location, division, conference)

    if (response) {
      res.json(response)
    } else {
      res.status(STATUS_NOT_FOUND)
    }
  } catch (error) {
      console.log(error)
      res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.get('/api/v1/champion', async (req, res) => {
  const season = req.query.season
  const teamId = req.query.team_id
  try {
    const response = await findChampion(season, teamId)
    if (response) {
      res.json(response)
    } else {
      res.status(STATUS_NOT_FOUND)
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.post('/api/v1/champion', async (req, res) => {
  const id = req.body.id
  const season = req.body.season
  const teamId = req.body.team_id
  try {
    const check = await findChampion(id)
    if (check.length != 0) {
      res.status(POST_STATUS_CONFLICT).json({ message: 'Already exists' })
      return
    }
    const response = await createChampion(id, season, teamId)
    if (response) {
      res.json(response)
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.delete('/api/v1/champion/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id, 10)
    const check = await findChampion(id)
    if (check.length === 0) {
      res.status(STATUS_NOT_FOUND).json({ message: 'Id not found' })
      return
    }
    const response = await deleteChampion(id)
    if (response) {
      res.json(response)
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.get('/api/v1/arena', async (req, res) => {
  const teamId = req.query.team_id
  try {
    const response = await findArena(teamId)
    if (response) {
      res.json(response)
    }else {
      res.status(STATUS_NOT_FOUND)
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.patch('/api/v1/arena/:id', async (req, res) => {
  const id = req.params.id
  const name = req.body.name
  const teamId = req.body.team_id
  console.log('IN PATCH')
  try {
    console.log('ID: ' + id)
    const check = await findArenaById(id)
    if (check.length === 0) {
      res.status(STATUS_NOT_FOUND).json({ message: 'Id not found' })
      return
    }
    const response = await updateArena(id, name, teamId)
    if (response) {
      res.status().json(response)
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.get('/api/v1/franchise', async (req, res) => {
  const location = req.query.location
  const division = req.query.division
  const conference = req.query.conference
  const stanleyCup = req.query.stanleyCup
  console.log('stanley ' + stanleyCup)
  console.log('location ' + location)
  console.log('division ' + division)
  console.log('con ' + conference)

  try {
    const response = await findFranchise(location, division, conference, stanleyCup)
    if (response) {
      res.json(response)
    } else {
      res.status(STATUS_NOT_FOUND)
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

// Default: any other request
app.use((req, res) => {
  res.setHeader('Content-Type', 'application/json')
  res.status(STATUS_NOT_FOUND).json({ message: 'Endpoint not found' })
})

app.listen(port, () => {
  console.log(`App listening on port ${port}`)
})
