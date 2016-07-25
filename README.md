# docker-link

Binary-based tooling for interacting with docker from inside docker

### Use

`docker-tunnel-socket` must have access to `/var/run/docker.sock` on the docker host:

    docker run -d --privileged --userns=host \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v /tools \
        --name docker-link \
        shane/docker-link

Then to use the socket, run:

    docker run --rm -it \
        --link docker-link --volumes-from docker-link \
        shane/docker-link \
        docker ps

or run using `docker-link` as a utility collection:

    docker run --rm -it \
        --link docker-link --volumes-from docker-link \
        ubuntu:xenial \
        /tools/docker/docker -H tcp://docker-link:2375 ps

### Use of :node tag

`docker-tunnel-socket` must have access to `/var/run/docker.sock` on the docker host:

    docker run -d --privileged --userns=host \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v /tools \
        --name docker-link \
        shane/docker-link:node

Then to use the socket, run:

    docker run --rm -it \
        --link docker-link --volumes-from docker-link \
        shane/docker-link:node \
        node -p process.versions

or run using `docker-link` as a utility collection:

    docker run --rm -it \
        --link docker-link --volumes-from docker-link \
        ubuntu:xenial \
        /tools/node/enter node -p process.versions
