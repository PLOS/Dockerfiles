PLOS Dockerfiles
================

Requirements
------------
* docker >= 1.6 (www.docker.com)
* docker-compose >= 1.2.0 (https://docs.docker.com/compose/)


Setup
-----

All the directories in the projects/ directory correspond to a PLOS project in github. The folder should have the same name as their github project. And those projects should be checked out at the same level as this Dockerfiles project. For example, lets assume you have your git projects checked out like so:

<workspace>/named-entity.service
<workspace>/ned-cas
<workspace>/Dockerfiles

This way <workspace>/Dockerfiles/projects/named-entity.service/ knows where to find the source code.

If you want docker images to build for certain versions of a project, make sure to switch to that branch or tag in the source directory of the project before building the docker images.


Use
---

To build a docker image for a project, run the build script. For example:

    projects/akita/build-image.sh
    projects/named-entity.service/build-image.sh
    projects/ned-cas/build-image.sh

Or build them all with:

    projects/*/build-image.sh

Of course this will only work for projects you have the source code locally checked out for.

To see a list of sample stacks that combine the use of these images see the configurations/ directory. Here is how you would run one:

    docker-compose -f configurations/akita_nedapi_nedcas.yml up

Now, in the case above you can visit some pages to see they are up:

http://localhost/registration/new     # Akita registration page:
http://localhost:1080                 # mailcatcher
http://localhost:8090/cas/login       # CAS login page


Development/Conventions
-----------------------

For each project the images created for it should be tagged with a version number and with "current". Current represents the last docker build you ran. It should be noted that "current" does not mean latest.

In each image, create a file at /root/version.txt that contains the version number representing the built artificats. For example, "0.5.0-SNAPSHOT".


Tips
----

Some of our projects make use of PLOS's internal maven repository. So you have to be in network to resolve. Containers seem to pull the host's resolve.conf file into the container. However, in Ubuntu 14, it seems this file is managed differently on the host.

To allow resolve.conf to populate as it used to I had to open
/etc/NetworkManager/NetworkManager.conf

and comment out this line: 
dns=dnsmasq
