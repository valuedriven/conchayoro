const express = require('express');
const router = express.Router();

router.get('/', function (req, res) {
   res.send('Bem vindo ao backend DevOps!');
})
  
module.exports = router;