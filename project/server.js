const express = require('express');
require('dotenv').config();

const {
  findTeam,
  findChampion,
  createChampion,
  deleteChampion,
  findArena,
  findFranchise,
} = require('./model');

const app = express();
app.use(express.json());

const port = process.env.PORT || 8080;

const HTTP_STATUS_OK = 200
const HTTP_STATUS_404 = 404
const HTTP_STATUS_INTERNAL_ERROR = 500


app.get('/', (req, res) => {
  res.setHeader('Content-Type', 'text/plain')
  res.status(302).send('Hello World!\n')
})

app.get('/health', (req, res) => {
  res.setHeader('Content-Type', 'application/json')
  res.status(HTTP_STATUS_OK).send('OK')
})

app.get('/api/v1/team', async(req, res) => {
  const location = req.query.location
  const division = req.query.division
  const conference = req.query.conference

  try {
    const response = await findTeam(location, division, conference)

    if (response) {
        res.json(response)
    }
  } catch (error) {
    console.log(error)
    res.status(HTTP_STATUS_INTERNAL_ERROR).json({message: "Something went wrong"})
  }
})

app.get('/api/v1/champion', async(req, res) => {
    const season = req.query.season
    const team_id = req.query.team_id
    try {
      const response = await findChampion(season, team_id)
      if (response) {
          res.json(response)
      }
    } catch (error) {
      console.log(error)
      res.status(HTTP_STATUS_INTERNAL_ERROR).json({message: "Something went wrong"})
    }
  })

app.post('/api/v1/champion', async(req, res) => {
  const id = req.body.id
  const season = req.body.season
  const team_id = req.body.team_id
  try {
    const response = await createChampion(id, season, team_id)
    if (response) {
        res.json(response)
    }
  } catch (error) {
    console.log(error)
    res.status(HTTP_STATUS_INTERNAL_ERROR).json({message: "Something went wrong"})
  }
})

app.delete('/api/v1/champion/:id', async(req, res) => {

  try {
    const id = parseInt(req.params.id, 10);
    const check = await findChampion(id);
    if (check.length === 0) {
      res.status(404).json({ message: "Id not found" });
      return;
    }
    const response = await deleteChampion(id)
    if (response) {
        res.json(response)
    }
  } catch (error) {
    console.log(error)
    res.status(HTTP_STATUS_INTERNAL_ERROR).json({message: "Something went wrong"})
  }
})

app.get('/api/v1/arena', async(req, res) => {
  const team_id = req.query.team_id
  try {
    const response = await findArena(team_id)
    if (response) {
        res.json(response);
    }
  } catch (error) {
    console.log(error)
    res.status(HTTP_STATUS_INTERNAL_ERROR).json({message: "Something went wrong"})
  }
})

app.get('/api/v1/franchise', async(req, res) => {
  const location = req.query.location
  const division = req.query.division
  const conference = req.query.conference
  const stanleyCup = req.query.stanleyCup
  console.log("stanley " + stanleyCup)
  console.log("location " + location)
  console.log("division " + division)
  console.log("con " + conference)

  try {
    const response = await findFranchise(location, division, conference, stanleyCup)
    if (response) {
        res.json(response)
    }
  } catch (error) {
    console.log(error)
    res.status(HTTP_STATUS_INTERNAL_ERROR).json({message: "Something went wrong"})
  }
})


    /*
    // https://expressjs.com/en/guide/routing.html#route-parameters
    app.get('/search/last/:last', (req, res) => {
        res.setHeader('Content-Type', 'application/json');
        res.status(302).send(`${JSON.stringify(req.params)}\n`);
    })

    app.get('/query', (req, res) => {
	let first = req.query.first;
	let last = req.query.last;
	let name = first + ' ' + last;
	res.setHeader('Content-Type', 'application/json');
	res.status(302).send(`${JSON.stringify(req.query)}\n`);
    })
    */

app.use((req, res) => {	// Default: any other request
    res.setHeader('Content-Type', 'application/json');
    res.status(HTTP_STATUS_404).json({});
});


app.listen(port, () => {
    console.log(`App listening on port ${port}`)
})