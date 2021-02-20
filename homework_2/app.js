const http = require('http')
const url = require('url')
const fs = require('fs')


fs.readFile('./EnglishDictionary.txt', 'utf8', (err, data) => {
    if (err) {
        return console.log("oops", err)
    }
    dictionary = data.split('\n').filter((element) => {
        return element != ''
    })
})

function searchString(str) {

    word = new RegExp(str+'  ', 'i')

    dictionary.forEach(element => {
        if (element.match(word)) {
            dictionaryEntry = element
        }
    })
}
        
//console.log(searchString())
//console.log(dictionaryEntry)



const server = http.createServer((req, res) => {
    const queryObject = url.parse(req.url,true).query
    console.log(queryObject)

    if (req.url === '/') {
        res.write('Welcome to Dictionary!')
        res.end()
    }
    if (Object.keys(queryObject).length === 1) {
        searchWord = Object.values(queryObject)[0]
        searchString(searchWord)
        res.write(dictionaryEntry)
        res.end()
    }

})

const PORT = '3000'
const DOMAIN = 'localhost'

server.listen(PORT, DOMAIN, () => {
    console.log(`Server listening on http://${DOMAIN}:${PORT}`)
})