'use strict';

const UtilitarioScripts = require('./utilitarios-scripts');

class ContainerTest {
  constructor() {
    this.options = { shell: true, cwd: this.baseDir, stdio: 'inherit' };
    const tempoDb = this.criarConteinerDb();
    const tempoBackend = this.criarConteinerBackend();
    const tempoFrontend = this.criarConteinerFrontend();
    const tempoSetupDb = this.setupDb();
    const tempoTestes = this.executarTestes();
    console.log('===> Tempos decorridos:');
    console.log(`===> Inicializar container db: ${tempoDb} segundos`);
    console.log(`===> Inicializar container backend: ${tempoBackend} segundos`);
    console.log(`===> Inicializar container frontend: ${tempoFrontend} segundos`);
    console.log(`===> Setup DB: ${tempoSetupDb} segundos`);
    console.log(`===> Testes: ${tempoTestes} segundos`);
  }
}

ContainerTest.prototype.criarConteinerDb = function () {
  const parametros = {
    command: 'docker-compose',
    args: ['-f ambiente/docker-compose.yml', 'up', '-d', '--build', 'db'],
    options: this.options,
  };
  return UtilitarioScripts.runCommand(parametros);
};

ContainerTest.prototype.criarConteinerBackend = function () {
  const parametros = {
    command: 'docker-compose',
    args: ['-f ambiente/docker-compose.yml', 'up', '-d', '--build', 'backend'],
    options: this.options,
  };
  return UtilitarioScripts.runCommand(parametros);
};

ContainerTest.prototype.criarConteinerFrontend = function () {
  const parametros = {
    command: 'docker-compose',
    args: ['-f ambiente/docker-compose.yml', 'up', '-d', '--build', 'frontend'],
    options: this.options,
  };
  return UtilitarioScripts.runCommand(parametros);
};

ContainerTest.prototype.setupDb = function () {
  const parametros = {
    command: 'docker-compose',
    args: ['-f ambiente/docker-compose.yml', 'exec', 'backend', 'npm run db:setup:dev'],
    options: this.options,
  };
  return UtilitarioScripts.runCommand(parametros);
};

ContainerTest.prototype.executarTestes = function () {
  const parametros = {
    command: 'npx',
    args: ['cypress', 'run'],
    options: this.options,
  };
  return UtilitarioScripts.runCommand(parametros);
};

module.exports = new ContainerTest();
