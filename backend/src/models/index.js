const Sequelize = require("sequelize");

console.log("Realizando conexão com banco de dados...")

const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USERNAME, process.env.DB_PASSWORD, {
  host: process.env.DB_HOSTNAME,
  port: process.env.DB_PORT,
  dialect: process.env.DB_DIALECT,
  pool: {
    max: parseInt(process.env.DB_POOL_MAX),
    min: parseInt(process.env.DB_POOL_MIN),
    acquire: parseInt(process.env.DB_POOL_ACQUIRE),
    idle: parseInt(process.env.DB_POOL_IDLE)
  }
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.produtos = require("./produto.model.js")(sequelize, Sequelize);

module.exports = db;