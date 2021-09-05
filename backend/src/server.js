const app = require('./app');
const logger = require('./config/logger');

const port = 3000;

app.listen(port, () => {
  logger.info(`DevOps backend disponível na porta ${port}`);
});
