var express = require('express');
var router = express.Router();

router.get('/live', function (req, res, next) {
  res.status(200).json({ status: "LIVE" })
}).get('/ready', function (req, res, next) {
  res.status(200).json({ status: "READY" })
});

module.exports = router;
