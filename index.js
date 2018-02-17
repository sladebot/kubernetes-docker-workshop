var express = require('express')
var app = express()
const MongoClient = require('mongodb').MongoClient

MongoClient.connect('mongodb://dbserver', (err, database) => {
  if(err) {
    console.log('Could not connect to mongo')
    process.exit(1)
  }
  console.log('Connected to mongo')
})

app.set('port', (process.env.PORT || 5000))
app.use(express.static(__dirname + '/public'))

app.get('/', function(request, response) {
  response.send('Hello World!')
})

app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'))
})
