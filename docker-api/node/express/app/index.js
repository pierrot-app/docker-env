const express = require('express')
const bodyParser = require("body-parser");
const app = express()


app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/', function (req, res) {
  res.send('Hello World !!')
})

app.listen(7000, function () {
  console.log('Example app listening on port 7000!')
})