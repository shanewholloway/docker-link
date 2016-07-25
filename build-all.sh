#!/bin/bash

docker build \
  -t shane/docker-link:v1.11 \
  -t shane/docker-link:latest \
  -f ./v1.11/xenial/Dockerfile \
  ./v1.11

docker build \
  -t shane/docker-link:v1.11-node \
  -t shane/docker-link:node \
  -f ./v1.11/xenial-node/Dockerfile \
  ./v1.11

docker build \
  -t shane/docker-link:v1.12 \
  -f ./v1.12/xenial/Dockerfile \
  ./v1.12

docker build \
  -t shane/docker-link:v1.12-node \
  -f ./v1.12/xenial-node/Dockerfile \
  ./v1.12

