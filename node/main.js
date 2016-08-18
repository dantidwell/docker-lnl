var http = require('http');
var express = require('express');

var app = express();
var server = http.createServer(app);

app.get('/hello/world', (req, res) => { 
  res.send('Hello, world!\n');
});

var port = process.env.NODE_ENV === 'docker' ? 80 : 3000;
server.listen(port, () => { 
  console.log(`[${new Date()}] Listening on port ${port}`);
});