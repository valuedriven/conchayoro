'use strict';

const spawnSync = require('child_process').spawnSync;
const { performance } = require('perf_hooks');
var path = require('path');

class UtilitarioScripts {
  constructor() {
    this.baseDir = path.dirname(__dirname);
    this.options = { shell: true, cwd: this.baseDir, stdio: 'inherit' };
  }
}

UtilitarioScripts.prototype.runCommand = function (parametros) {
  const inicio = performance.now();
  spawnSync(parametros.command, parametros.args, parametros.options, (err, stdout, stderr) => {
    if (err) {
      throw err;
    }
    console.log(`stdout: ${stdout}`);
    console.log(`stderr: ${stderr}`);
  });
  const fim = performance.now();
  const tempoDecorrido = (fim - inicio) / 60;
  return tempoDecorrido.toFixed(1);
};

module.exports = new UtilitarioScripts();
