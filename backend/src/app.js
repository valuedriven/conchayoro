const express = require('express');
const morgan = require('morgan');
const router = require('./routers');
const logger = require('./util/logger');
const app = express();
const db = require("./models");
db.sequelize.sync();

app.use(morgan('combined', { stream: { write: (message) => logger.info(message) } }));
app.use(express.json());
logger.info('Configuração de middlewares Express');

app.use('/', router);

logger.info('Configuração de router');
  
module.exports = app;