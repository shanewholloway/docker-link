#!/bin/bash

docker build \
  -t shane/docker-link:v1.11-xenial \
  -t shane/docker-link:v1.11 \
  -t shane/docker-link:xenial \
  -t shane/docker-link \
  -t docker-link \
  -f ./v1.11/xenial/Dockerfile \
  ./v1.11

