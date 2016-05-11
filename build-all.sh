#!/bin/bash

docker build \
  -t shane/docker-link:v1.11-xenial \
  -t shane/docker-link:v1.11 \
  -t shane/docker-link:xenial \
  -t shane/docker-link \
  -f ./v1.11/xenial/Dockerfile \
  ./v1.11 \
&& docker build \
  -t shane/docker-link:v1.11-xenial-node \
  -t shane/docker-link:v1.11-node \
  -t shane/docker-link:xenial-node \
  -t shane/docker-link:node \
  -f ./v1.11/xenial-node/Dockerfile \
  ./v1.11

