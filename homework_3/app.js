const express = require('express')
const logger = require('morgan')
const ejs = require('ejs')
const app = express()

app.set("view engine", "ejs")
app.use(logger('dev'))

const PORT = 3000
const ADDRESS = 'localhost' //127.0.0.1

app.listen(PORT, ADDRESS, () => {
    console.log(`Server listening on http://${ADDRESS}:${PORT}`)
})

app.get('/', (req, res) => {
    res.render('homepage')
})

app.get('/split_result', (req, res) => {
    const { amount, tax, tip, people } = req.query

    res.render('split_result', {
        amount,
        tax,
        tip,
        people
    })
})