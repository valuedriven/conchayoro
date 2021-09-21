const express = require('express');
const app = express();

app.use(express.json());

app.get('/', (req,res) => {
    res.send('Bem vindo ao backend ConchayOro!');
});

module.exports = app;