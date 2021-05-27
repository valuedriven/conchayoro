const express = require('express');
const produtoRouter = require('./produto.router');
const router = express.Router();

router.use('/produtos', produtoRouter);

module.exports = router;
