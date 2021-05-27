console.log("Inicializando servidor...")

const envpath = process.env.NODE_ENV === undefined  ? '.env.development' : `.env.${process.env.NODE_ENV}`;

require('dotenv').config({  
  path: envpath
})

console.log("Inspecionando variáveis de banco de dados...");
console.log(process.env.DB_HOSTNAME, process.env.DB_USERNAME, process.env.DB_PASSWORD, process.env.DB_PORT, process.env.DB_DIALECT);

const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const db = require("./models");

const app = express();

app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

db.sequelize.sync();

app.get("/", (req, res) => {
  res.json({ message: "Bem-vindo(a) ao backend do ConchayOro!" });
});

require("./routers/produto.router")(app);
const port = process.env.BACKEND_PORT;
app.listen(port, () => {
  console.log(`Servidor está em execução na porta ${port}`);
});