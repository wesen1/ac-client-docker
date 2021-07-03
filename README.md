# ac-client-docker
Dockerfile for a standard AssaultCube client

This is using the AssaultCube client files from the current [1.2.0.2 release](https://github.com/assaultcube/AC/releases/download/v1.2.0.2/AssaultCube_v1.2.0.2.tar.bz2).


## Usage

### docker (default files, will be reset when the container is stopped)

`docker run --rm wesen1/assaultcube-client:1.2.0.2`


## Build

1. Run `apt-get install docker-compose`
2. Run `docker build -t ac-client .`
