const Environment = require('./util/environment');
Environment.init();
const logger = require('./util/logger');
logger.info(`app.js - inicializando`);
logger.debug(`NODE_ENV ${process.env.NODE_ENV}`);
logger.debug(`LOG_LEVEL ${process.env.LOG_LEVEL}`);
logger.debug(`DB_HOSTNAME ${process.env.DB_HOSTNAME}`);
logger.debug(`DB_PORT ${process.env.DB_PORT}`);
logger.debug(`DB_NAME ${process.env.DB_NAME}`);
logger.debug(`DB_USERNAME ${process.env.DB_USERNAME}`);

const app = require('./app');

logger.info(`server.js - inicializando`);

const port = process.env.BACKEND_PORT || 3000;

app.listen(port, () => {
  logger.info(`app.js - aplicação em execução na porta ${port}`);
});
