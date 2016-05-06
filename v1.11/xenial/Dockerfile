FROM ubuntu:xenial

ENV APP_DIR=/tools/docker \
  V_CONTAINER_NAME=${NAME:-docker-link} \
  V_DOCKER_ENGINE=1.11.1 \
  V_DOCKER_COMPOSE=1.7.0 \
  V_DOCKER_MACHINE=0.7.0

COPY docker-tunnel-socket $APP_DIR/

RUN apt-get update \
 && apt-get -y install --no-install-recommends \
        curl ca-certificates socat \
 && rm -r /var/lib/apt/lists/* \
 \
 && mkdir -p $APP_DIR \
 && cd $APP_DIR \
 \
 && curl -sSL https://github.com/docker/machine/releases/download/v$V_DOCKER_MACHINE/docker-machine-`uname -s`-`uname -m` \
   -o docker-machine \
 && curl -sSL https://github.com/docker/compose/releases/download/$V_DOCKER_COMPOSE/docker-compose-`uname -s`-`uname -m` \
   -o docker-compose \
 && curl -sSL https://get.docker.com/builds/`uname -s`/`uname -m`/docker-$V_DOCKER_ENGINE.tgz \
   -o docker-$V_DOCKER_ENGINE.tgz \
 && tar --strip=1 -xvzf ./docker-$V_DOCKER_ENGINE.tgz docker/docker \
 && rm $APP_DIR/docker-$V_DOCKER_ENGINE.tgz \
 \
 && chmod +x \
      docker-compose \
      docker-machine \
      docker-tunnel-socket \
 && /bin/true

ENV PATH=$PATH:$APP_DIR \
    DOCKER_HOST=tcp://$V_CONTAINER_NAME:2375

VOLUME $APP_DIR
EXPOSE 2375
CMD $APP_DIR/docker-tunnel-socket

MAINTAINER Shane Holloway <shane.holloway@ieee.org>
# TO IMAGE shane/docker-link:v1.11-xenial

