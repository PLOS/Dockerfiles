CAS Docker
==========

Requirements
------------
* docker >= 1.3 (www.docker.com)
* docker-compose >= 1.2.0 (https://docs.docker.com/compose/)

Setup
-----

The CAS docker container depends on NED's DB docker image to be built.
Here's how to start NED's docker containers:

    cd <workspace>/named-entity.service/docker/builder && ./ned-build.sh

Build CAS images:

    <workspace>/ned-cas/docker/build-image.sh

Running
-------

Included is a sample docker-compose.yml which represents a configured stack containing NED and NED CAS. Run it like so:

    cd <workspace>/ned-cas/docker
    docker-compose up

CAS login page:
http://localhost:8090/cas/login

NED API:
http://localhost:8081


TODO
----
* Enable SSL with self-signed certificate. Reference private key on a HOST share @
  runtime.

* Update "Register for a New Account" link on login.jsp to point to appropriate 
  Akita instance.

  Tip/Hack: you can change this at runtime by editing registration link in login page.

    $ docker exec -it docker_nedcas_1 /bin/bash

    root@c2df6d770bb7# cd /usr/local/tomcat/webapps/cas/WEB-INF/view/jsp/plos
    root@c2df6d770bb7# vim login.jsp
