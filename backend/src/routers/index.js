const express = require('express');
const rootRouter = require('./root.router');
const produtoRouter = require('./produto.router');
const router = express.Router();

router.use('/produtos', produtoRouter);
router.use('/', rootRouter);

module.exports = router;
