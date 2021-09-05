console.log('Inicializando aplicação...');

const envpath =
  process.env.NODE_ENV === undefined ? '.env.development' : `.env.${process.env.NODE_ENV}`;

require('dotenv').config({
  path: envpath,
});

console.log('Inspecionando variáveis de banco de dados...');
console.log(
  process.env.DB_HOSTNAME,
  process.env.DB_USERNAME,
  process.env.DB_PASSWORD,
  process.env.DB_PORT,
  process.env.DB_DIALECT
);

const express = require('express');
const morgan = require('morgan');
const router = require('./routers');
const logger = require('./util/logger');
const app = express();
const db = require('./models');

app.use(morgan('combined', { stream: { write: (message) => logger.info(message) } }));
app.use(express.json());
logger.info('Configuração de middlewares Express');

app.use('/', router);
logger.info('Configuração de router');

module.exports = app;

db.sequelize.sync();

app.get('/', (req, res) => {
  res.json({ message: 'Bem-vindo(a) ao backend do ConchayOro!' });
});

require('./routers/produto.router')(app);
