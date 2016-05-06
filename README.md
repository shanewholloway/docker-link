# docker-link

Binary-based tooling for interacting with docker from inside docker

### Use

`docker-tunnel-socket` must have access to `/var/run/docker.sock` on the docker host:

    docker run -d --privileged --userns=host \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --name docker-link docker-link

Then to use the socket, run:

    docker run --rm -it \
        --link docker-link --volumes-from docker-link \
        docker-link docker ps

or run using `docker-link` as a utility collection:

    docker run --rm -it \
        --link docker-link --volumes-from docker-link \
        ubuntu:xenial /tools/docker/docker -H tcp://docker-link:2375 ps
