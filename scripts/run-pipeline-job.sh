#!bin/sh

docker run --rm -t -i \
         --volume /var/run/docker.sock:/var/run/docker.sock \
         --volume $PWD:$PWD \
          --workdir $PWD \
         gitlab/gitlab-runner:latest \
         exec docker \
              --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
              --docker-pull-policy if-not-present \
              --env "HOSTNAME=localhost" \
              --env "CI_PROJECT_NAMESPACE=webgct-namespace" \
              --env "CI_PROJECT_NAME=webgct" \
              $1
