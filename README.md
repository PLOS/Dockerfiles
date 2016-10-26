PLOS Dockerfiles
================

This repo contains the dockerizations for PLOS projects. It provides complete stacks which are runnable combinations of PLOS services. For example with one command you can start up a stack containing Rhino, Wombat, Content Repo, MySQL, Solr, Plos Queue, and MogileFS.

To keep your host clean, all projects are built and tested in disposable containers.


Requirements
------------
* docker >= 1.10
* docker-compose >= 1.7
* git

It is recommended you configure Docker to run [without sudo](https://docs.docker.com/engine/installation/linux/ubuntulinux/#/create-a-docker-group).

Quick Start
-----------

To make sure you are setup correctly, I recommend building a minimal stack and seeing that the tests pass for it.

    ./build.sh stack solr
    tests/run.sh solr

For a slightly more complex stack try bringing up the content repo.

    ./build.sh stack contentrepo
    ./stack.sh contentrepo

See Troubleshooting below if you have problem with Maven running too slow.

Images
------

An _image_ is built for every project or service (ie - rhino). When you start an image that service should be up and running in a container that you can access from the host.

All images are production grade and designed in a [Twelve-Factor](https://12factor.net/) style. They are setup to be configured at run time using environment variables.


Configurations
--------------

Generally these images cannot run on their own since, like most apps, they depend on additional services like a database. This is where docker-compose comes in.

Compose lets you specify a combination of services in a yaml file and allows you to specify the environment variables needed to wire your services together. It uses an isolated bridged/NAT network by default.

In the configurations/ directory you can these yaml files. _common.yml_ contains the definition of every service and some default setups for them. The other files (ie - contentrepo.yml) inherit common.yml to specify only the services needed for a contentrepo _stack_ and overrides defaults as needed.

Note that these are only sample configurations. You should create your own depending on the combination of services you require. The samples mostly include top to bottom stacks, but you are not required to do this. For example we bring up a CAS server in the Akita stack. But you can set environment variables to point to production CAS instead of bringing up that service. Feel free to mix and match.


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


Development Conventions
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
* Alpine everything for smaller images
* plos-themes and apache-conf (and patch so we can use environment vars for run time config)
* Consider an extra common container for gathering things like consul, mysql-connector-java, and mogile.
* Make haproxy config more generic so we can pass in service names and not create special versions needed for each service.

Troubleshooting
---------------

Some of our projects make use of PLOS's maven repository, and there is a different route to it if you are in network. New containers copy the host's resolve.conf file into the container. However, in Ubuntu 14, it seems this file is managed differently on the host.

To allow resolve.conf to populate as it used to I had to open
/etc/NetworkManager/NetworkManager.conf

and comment out this line:

    dns=dnsmasq

Then restart the NetworkManager service.
