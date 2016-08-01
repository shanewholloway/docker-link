FROM ubuntu:xenial

ENV TOOLS_DIR=/tools \
    V_CONTAINER_NAME=${NAME:-docker-link} \
    # https://github.com/docker/docker/releases \
    V_DOCKER_ENGINE=1.12.0 \
    # https://github.com/docker/compose/releases \
    V_DOCKER_COMPOSE=1.8.0 \
    # https://github.com/docker/machine/releases \
    V_DOCKER_MACHINE=v0.8.0

COPY docker-tunnel-socket $TOOLS_DIR/docker/

RUN apt-get update \
 && apt-get -y install --no-install-recommends \
        wget curl ca-certificates socat bzip2 xz-utils \
 && rm -r /var/lib/apt/lists/* \
 \
 && mkdir -p $TOOLS_DIR/docker/ \
 && cd $TOOLS_DIR/docker \
 \
 && curl -sSL "https://github.com/docker/machine/releases/download/$V_DOCKER_MACHINE/docker-machine-`uname -s`-`uname -m`" \
   -o docker-machine \
 && curl -sSL "https://github.com/docker/compose/releases/download/$V_DOCKER_COMPOSE/docker-compose-`uname -s`-`uname -m`" \
   -o docker-compose \
 && curl -sSL "https://get.docker.com/builds/`uname -s`/`uname -m`/docker-$V_DOCKER_ENGINE.tgz" \
     | tar -xzv --strip=1 docker/docker \
 \
 && chmod +x \
      $TOOLS_DIR/docker/docker \
      $TOOLS_DIR/docker/docker-compose \
      $TOOLS_DIR/docker/docker-machine \
      $TOOLS_DIR/docker/docker-tunnel-socket \
 && /bin/true

EXPOSE 2375
CMD $TOOLS_DIR/docker/docker-tunnel-socket
ENV PATH=$PATH:$TOOLS_DIR/docker \
    DOCKER_HOST=tcp://$V_CONTAINER_NAME:2375


MAINTAINER Shane Holloway <shane.holloway@ieee.org>
# TO IMAGE shane/docker-link:xenial

