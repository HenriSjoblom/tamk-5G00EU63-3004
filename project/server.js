const express = require('express')
const Joi = require('joi')

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
const HTTP_STATUS_CREATED = 201
const STATUS_BAD_REQUEST = 400
const STATUS_NOT_FOUND = 404
const POST_STATUS_CONFLICT = 409
const STATUS_INTERNAL_ERROR = 500
const STATUS_NOT_IMPLEMENTED = 501
const NOT_IMPLEMENTED_MESSAGE = 'Not implemented'
const INTERNAL_SERVER_ERROR_MESSAGE = 'Internal server error'

app.get('/health', (req, res) => {
  res.setHeader('Content-Type', 'application/json')
  res.status(HTTP_STATUS_OK).send('OK')
})

app.get('/api/v1/team', async (req, res) => {
  const location = req.query.location
  const division = req.query.division
  const conference = req.query.conference

  const teamGetSchema = Joi.object({
    location: Joi.string().min(1),
    division: Joi.string().min(1),
    conference: Joi.string().min(1)
  })

  try {
    // validate parameters
    const { error } = teamGetSchema.validate({ location, division, conference })
    if (error) {
      res.status(STATUS_BAD_REQUEST).json({ message: error.details[0].message })
      return
    }
    const response = await findTeam(location, division, conference)

    if (response) {
      res.json(response)
    } else {
      res.status(STATUS_NOT_IMPLEMENTED).json({ message: NOT_IMPLEMENTED_MESSAGE })
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.get('/api/v1/champion', async (req, res) => {
  const season = req.query.season
  const teamId = req.query.team_id

  const championGetSchema = Joi.object({
    season: Joi.string().min(1),
    teamId: Joi.number().min(1)
  })

  try {
    // validate parameters
    const { error } = championGetSchema.validate({ season, teamId })
    if (error) {
      res.status(STATUS_BAD_REQUEST).json({ message: error.details[0].message })
      return
    }

    const response = await findChampion(season, teamId)
    if (response) {
      res.json(response)
    } else {
      res.status(STATUS_NOT_IMPLEMENTED).json({ message: NOT_IMPLEMENTED_MESSAGE })
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

  const championPostSchema = Joi.object({
    id: Joi.number().required().min(1),
    season: Joi.string().required().min(1),
    teamId: Joi.number().required().min(1)
  })

  try {
    // validate parameters
    const { error } = championPostSchema.validate({ id, season, teamId })
    if (error) {
      res.status(STATUS_BAD_REQUEST).json({ message: error.details[0].message })
      return
    }

    // check id not exists
    const check = await findChampion(id)
    if (check.length !== 0) {
      res.status(POST_STATUS_CONFLICT).json({ message: 'Already exists' })
      return
    }
    const response = await createChampion(id, season, teamId)
    if (response) {
      const createdRow = await findChampion(id)
      res.status(HTTP_STATUS_CREATED).json({ createdRow })
    } else {
      res.status(STATUS_NOT_IMPLEMENTED).json({ message: NOT_IMPLEMENTED_MESSAGE })
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.delete('/api/v1/champion/:id', async (req, res) => {
  const championDeleteSchema = Joi.object({
    id: Joi.number().required().min(1)
  })

  try {
    const id = parseInt(req.params.id, 10)

    // validate parameter
    const { error } = championDeleteSchema.validate({ id })
    if (error) {
      res.status(STATUS_BAD_REQUEST).json({ message: error.details[0].message })
      return
    }

    const check = await findChampion(id)
    if (check.length === 0) {
      res.status(STATUS_NOT_FOUND).json({ message: 'Id not found' })
      return
    }
    const response = await deleteChampion(id)
    if (response) {
      res.status(HTTP_STATUS_OK).json({ message: `Id ${id} deleted` })
    } else {
      res.status(STATUS_NOT_IMPLEMENTED).json({ message: NOT_IMPLEMENTED_MESSAGE })
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.get('/api/v1/arena', async (req, res) => {
  const teamId = req.query.team_id

  const arenaGetSchema = Joi.object({
    teamId: Joi.number().min(1)
  })

  try {
    // validate parameter
    const { error } = arenaGetSchema.validate({ teamId })
    if (error) {
      res.status(STATUS_BAD_REQUEST).json({ message: error.details[0].message })
      return
    }

    const response = await findArena(teamId)
    if (response) {
      res.json(response)
    } else {
      res.status(STATUS_NOT_IMPLEMENTED).json({ message: NOT_IMPLEMENTED_MESSAGE })
    }
  } catch (error) {
    console.log(error)
    res.status(STATUS_INTERNAL_ERROR).json({ message: INTERNAL_SERVER_ERROR_MESSAGE })
  }
})

app.patch('/api/v1/arena/:id', async (req, res) => {
  const id = req.params.id
  const name = req.body.name
  const teamId = req.body.teamId

  const arenaGetSchema = Joi.object({
    id: Joi.number().required().min(1),
    name: Joi.string().min(1),
    teamId: Joi.number().required().min(1)
  })

  try {
    // validate parameters
    const { error } = arenaGetSchema.validate({ id, name, teamId })
    if (error) {
      res.status(STATUS_BAD_REQUEST).json({ message: error.details[0].message })
      return
    }

    const check = await findArenaById(id)
    if (check.length === 0) {
      res.status(STATUS_NOT_FOUND).json({ message: 'Id not found' })
      return
    }
    const response = await updateArena(id, name, teamId)
    if (response) {
      const updatedEntity = await findArenaById(id)
      res.status(HTTP_STATUS_OK).json(updatedEntity)
    } else {
      res.status(STATUS_NOT_IMPLEMENTED).json({ message: NOT_IMPLEMENTED_MESSAGE })
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

  const franchiseGetSchema = Joi.object({
    location: Joi.string().min(1),
    division: Joi.string().min(1),
    conference: Joi.string().min(1),
    stanleyCup: Joi.boolean()
  })

  try {
    const { error } = franchiseGetSchema.validate({ location, division, conference, stanleyCup })
    if (error) {
      res.status(STATUS_BAD_REQUEST).json({ message: error.details[0].message })
      return
    }

    const response = await findFranchise(location, division, conference, stanleyCup)
    if (response) {
      res.json(response)
    } else {
      res.status(STATUS_NOT_IMPLEMENTED).json({ message: NOT_IMPLEMENTED_MESSAGE })
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
