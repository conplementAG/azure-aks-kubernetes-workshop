var express = require('express');
var router = express.Router();

router.get('/', function (req, res, next) {
  let color = process.env.COLOR
  if (color === undefined) {
    color = "red"
  }

  let version = process.env.VERSION
  if (version === undefined) {
    version = "0.0.0.0"
  }

  let backend_host = process.env.BACKEND_HOST
  if (backend_host === undefined) {
    backend_host = "http://localhost:5000"
  }

  res.render('index',
    {
      color: color,
      version: version,
      backend_host: backend_host,
    });
});

module.exports = router;
