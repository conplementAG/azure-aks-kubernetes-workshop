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

  let backend_baseurl = process.env.BACKEND_BASEURL
  if (backend_baseurl === undefined) {
    backend_baseurl = "http://localhost:5000"
  }

  res.render('index',
    {
      color: color,
      version: version,
      backend_baseurl: backend_baseurl,

    });
});

module.exports = router;
