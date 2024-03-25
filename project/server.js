const express = require('express');
require('dotenv').config();

const {
  findTeam,
  findChampion
} = require('./model');

const app = express();
app.use(express.json());

const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.setHeader('Content-Type', 'text/plain');
  res.status(302).send('Hello World!\n');
})

app.get('/health', (req, res) => {
    res.status(200).send('OK');
})

app.get('/api/v1/team', async(req, res) => {
  try {
    const response = await findTeam();
    if (response) {
        res.json(response);
    }
  } catch (error) {
    console.log(error)
    res.status(500).json({message: "Something went wrong"});
  }
})

app.get('/api/v1/champion', async(req, res) => {
    try {
      const response = await findChampion();
      if (response) {
          res.json(response);
      }
    } catch (error) {
      console.log(error)
      res.status(500).json({message: "Something went wrong"});
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
    res.status(404).json({});
});


app.listen(port, () => {
    console.log(`App listening on port ${port}`)
})