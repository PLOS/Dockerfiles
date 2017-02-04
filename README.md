PLOS Dockerfiles
================

This repo contains the dockerizations for PLOS projects. It provides complete stacks which are runnable combinations of PLOS services. For example with one command you can start up a stack containing Rhino, Wombat, Content Repo, MySQL, Solr, Plos Queue, and MogileFS.

To keep your host clean, all projects are built and tested in disposable containers.


Requirements
------------
This requires the 'envoy' project and follows its conventions.


Quick Start
-----------

To make sure you are setup correctly, I recommend building a minimal stack and seeing that the tests pass for it.

    ./ev build stack solr
    ./ev test solr

For a slightly more complex stack try bringing up the content repo.

    ./ev build stack contentrepo
    ./ev stack contentrepo

This one might take some time to finish because building mogile from CPAN can be slow. However, after the first time it will be cached so subsequent builds will be fast.

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


Running a stack
---------------

The `ev stack` command is a wrapper around docker-compose. It can be used to bring stacks up and down.

Here is how you would run one stack:

    ./ev stack wombat

Now, in the case above you can visit some pages to see they are up:

    http://localhost:8001/DesktopPlosOne  # wombat
    http://localhost:8080                 # rhino
    http://localhost:8085                 # content repo

Note, that before running one of these docker-compose files you need to make sure you have built the images it depends on (see above).


Scaling/Load Balancing
----------------------

There is a scaling demo that runs multiple instances of NED using Consul. Here is roughly how you would use it.

* Start stack: `./ev stack nedapi_consul`
* See the consul UI: http://localhost:8500/ui
* Run more NED instances: `./ev stack nedapi_consul scale nedapi=4`
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
    ./ev stack web_delivery.yml

To see the Wombat home page, visit:
    http://localhost:8081

Note: The above example requires you to have Ambra templates and plos-themes checked out locally.

You can use the included registry.yml file to bring up the registry on your server.

Todo/Outstanding
----------------

* Akita and Lemur apps will have problems with CAS because of this bug:
https://github.com/dlindahl/omniauth-cas/issues/41
* Setup Postgres helper method for Lemur
* Lemur needs to separate app and db config
* Figure out why Lemur frontend needs specific npm and bower versions
* Dockerize: ploscli, AricleAdmin
* plos-themes and apache-conf (and patch so we can use environment vars for run time config)
* Consider an extra common container for gathering things like consul, mysql-connector-java, and mogile.
* Make haproxy config more generic so we can pass in service names and not create special versions needed for each service. (https://github.com/hashicorp/consul-template/issues/532)

Troubleshooting
---------------

Some of our projects make use of PLOS's maven repository, and there is a different route to it if you are in network. New containers copy the host's resolve.conf file into the container. However, in Ubuntu 14, it seems this file is managed differently on the host.

To allow resolve.conf to populate as it used to I had to open
/etc/NetworkManager/NetworkManager.conf

and comment out this line:

    dns=dnsmasq

Then restart the NetworkManager service.
