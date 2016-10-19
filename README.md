PLOS Dockerfiles
================

Requirements
------------
* docker >= 1.10
* docker-compose >= 1.7
* git  (optional, for checking out missing project sources if they are not found)

Terminology
-----------

An _image_ is built for every project or service (ie - rhino). When you start an image that service should be up and running.

A _stack_ is a combination of services. The docker-compose files in the configurations/ directory are stacks.

Setup
-----

All the directories in the projects/ directory correspond to a PLOS project in github. The folder should have the same name as their github project. And those projects should be checked out at the same level as this Dockerfiles project. For example, lets assume you have your git projects checked out like so:

    (workspace)/wombat
    (workspace)/rhino
    (workspace)/Dockerfiles

This way (workspace)/Dockerfiles/projects/wombat/ knows where to find the source code.

If you want docker images to build for certain versions of a project, make sure to switch to that branch or tag in the source directory of the project before building the docker images.


Building images
---------------

The _build.sh_ script can be used to build single images or whole stacks.

Note that images are tagged with the git branch you have checked out for that project. For example if you build rhino while you have the development branch checked out, it will create a rhino:development image. configurations files refer to specific branches.... (finish this)

Image builds will only work for projects you have the source code locally checked out for, but the builder script will do its best to clone git project repos that it needs source code for.


Running a stack
---------------

The _stack.sh_ script is a wrapper around docker-compose. It can be used to bring stacks up and down.

Here is how you would run one stack:

    ./stack.sh wombat

Now, in the case above you can visit some pages to see they are up:

    http://localhost:8001/DesktopPlosOne  # wombat
    http://localhost:8080                 # rhino
    http://localhost:8085                 # content repo

Note, that before running one of these docker-compose files you need to make sure you have built the images it depends on (see above).


Testing
-------

See the tests/ directory. These are not exhaustive service tests. They are supposed to test your containers, such that you can update the Dockerfiles and be sure that it does not break anything. Tests themselves run in the 'testrunner' container so testing requirements are isolated from the host.


Development/Conventions
-----------------------

For each project the images created for it should be tagged with a version number and with the name of the git branch.

In each image, create a file at /root/version.txt that contains the version number representing the built artifacts. For example, "0.5.0-SNAPSHOT".

Here are some of the files you will find in each of the project directories, and what they are used for:

__build-image.sh__ - Builds an image from the source code of the project

__compile.sh__ - An intermediate build container is used before the final image is created. This script performs inside that container what is needed to turn your project source code into its compiled assets (commonly .war files) and then collects additional files (commonly config files and database migrations) into a common place so the runnable image can grab them.

__Dockerfile__ - The Dockerfile for the runable image of the project

__run.sh__ - The script that is run in the foreground inside your container. This commonly consists of seeding the database, processing configuration templates, and running a service like tomcat.

__(configuration templates)__ - You will see various files (ie - context.xml) in project directories. These are specific to that project and are simple templates that are processed at run time with whatever environment variables were set (most commonly in the docker-compose file).

Scaling/Load Balancing
----------------------

There is a scaling demo that runs multiple instances of NED using Consul. Here is roughly how you would use it.

* Start stack: `./stack.sh nedapi_consul`
* See the consul UI: http://localhost:8500/ui
* Run more NED instances: `./stack.sh nedapi_consul scale nedapi=4`
* Refresh the consul UI to see the added services
* Run `journalctl -f` on host to watch haproxy log to see its spanning requests to different containers
* Visit NED proxy at http://localhost:8081/v1/service/config while watching that log is spanning requests
* You can see proxy stats at http://localhost:1936/ but it wont be accurate since scaling restarts haproxy which reset the values to 0


Docker Registry
---------------

Note: Some registry functionality might currently not work due to compose schema.

The Docker registry is a place to host images. Images can be pushed and pulled from our local Docker Registry (2.0). If an image is there you, you can pull from it instead of having to build it.

To use our registry make sure you have configured your Docker daemon such that it can talk to our repo (see confluence doc).

As an example, here is how you would run the new Ambra stack from the repo:

    ./registry.sh pull_stack configurations/web_delivery.yml
    ./stack.sh web_delivery.yml

To see the Wombat home page, visit:
    http://localhost:8081

Note: The above example requires you to have Ambra templates and plos-themes checked out locally.

You can use the included registry.yml file to bring up the registry on your server.

Status/Todo
-----------

* Akita and Lemur apps will have problems with CAS because of this bug:
https://github.com/dlindahl/omniauth-cas/issues/41
* Setup Postgres helper method for Lemur
* Lemur needs to separate app and db config
* Figure out why Lemur frontend needs specific npm and bower versions
* Dockerize: ploscli, AricleAdmin
- Replace tomcat:6-jre8 with tomcat:7-jre8-alpine for smaller images


Troubleshooting
---------------

Some of our projects make use of PLOS's maven repository, and there is a different route to it if you are in network. New containers copy the host's resolve.conf file into the container. However, in Ubuntu 14, it seems this file is managed differently on the host.

To allow resolve.conf to populate as it used to I had to open
/etc/NetworkManager/NetworkManager.conf

and comment out this line:

    dns=dnsmasq
