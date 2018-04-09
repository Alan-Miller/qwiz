require('dotenv').config()
const { SERVER_PORT, DB_STRING } = process.env
const express = require('express')
const app = express()
const massive = require('massive')

massive(DB_STRING)
  .then(db => { app.set('db', db) })

app.get(`/api/quiz/:quizID`, (req, res) => {
  app.get('db').get_quiz([req.params.quizID])
    .then(quiz => res.status(200).send(quiz[0]))
    .catch(err => res.status(500).send(err))
})

app.get(`/api/title`, (req, res) => {
  app.get('db').get_quiz_titles()
    .then(titles => res.status(200).send(titles))
    .catch(err => res.status(500).send(err))
})

app.listen(SERVER_PORT, console.log(`Listening on ${SERVER_PORT}`))