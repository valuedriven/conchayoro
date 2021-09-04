'use strict';

const UtilitarioScripts = require('./utilitarios-scripts');

class RunPipelineJob {
  constructor() {
    this.options = { shell: true, cwd: this.baseDir, stdio: 'inherit' };
    const tempoExecucao = this.runPipelineJob();
    console.log('===> Tempo decorrido:');
    console.log(`===> Executar pipelineJob: ${tempoExecucao} segundos`);
  }
}

RunPipelineJob.prototype.runPipelineJob = function () {
  const parametro = process.argv.slice(2);
  const command = 'docker';
  const arg1 = 'run';
  const arg2 =
    '--rm -t -i ' +
    '--volume /var/run/docker.sock:/var/run/docker.sock ' +
    '--volume $PWD:$PWD ' +
    '--workdir $PWD';
  const arg3 =
    'gitlab/gitlab-runner:latest ' +
    'exec docker ' +
    '--docker-volumes "/var/run/docker.sock:/var/run/docker.sock" ' +
    '--docker-pull-policy if-not-present ' +
    '--env "HOSTNAME=localhost" ' +
    '--env "CI_PROJECT_NAMESPACE=webgct-namespace" ' +
    '--env "CI_PROJECT_NAME=webgct" ' +
    parametro;
  const parametros = {
    command: command,
    args: [arg1, arg2, arg3],
    options: this.options,
  };
  return UtilitarioScripts.runCommand(parametros);
};

module.exports = new RunPipelineJob();
