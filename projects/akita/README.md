Akita Docker
============

Requirements
------------
* docker >= 1.3 (www.docker.com)
* docker-compose >= 1.2.0 (https://docs.docker.com/compose/)
* NED docker image
* NED CAS docker image

Setup
-----

The Akita Docker container depends on NED's Docker images to be built.

Build them like so:

    <workspace>/ned-cas/docker/build-image.sh

    cd <workspace>/named-entity.service/docker/builder && ./ned-build.sh

You can see if the NED images where successfully built with 'docker images|grep nedapi'. There should be a nedapi:current and tags with various version numbers.

Build Akita images:

    <workspace>/akita/docker/build-image.sh

Running
-------

Included is a sample docker-compose.yml which represents a configured stack. Run it like so:

    cd <workspace>/akita/docker
    docker-compose up

Visit some pages to see they are up:

http://localhost/registration/new     # Akita registration page:
http://localhost:1080                 # mailcatcher
http://localhost:8090/cas/login       # CAS login page
