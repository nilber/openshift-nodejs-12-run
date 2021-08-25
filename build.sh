#!/bin/bash

DOCKER_IMAGEM=nodejs-12-run
S2I_IMAGEM=nbmaster/openshift-nodejs-12-run
TAG=1.4

# docker system prune
# docker rmi $DOCKER_IMAGEM:$TAG $S2I_IMAGEM:$TAG

docker build src/ -t $DOCKER_IMAGEM:$TAG

s2i build src/ $DOCKER_IMAGEM:$TAG $S2I_IMAGEM:$TAG

docker push $S2I_IMAGEM:$TAG