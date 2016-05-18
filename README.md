PLOS Dockerfiles
================

Requirements
------------
* docker >= 1.10
* docker-compose >= 1.6
* curl (optional, for running the tests)
* git  (optional, for checking out missing project sources if they are not found)

Status
------
* Article ingestion might be broken due to schema updates
* Some registry functionality might not work due to compose schema


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

To build a docker image for a project, run the build script. For example:

    projects/wombat/build-image.sh
    projects/rhino/build-image.sh
    projects/content-repo/build-image.sh
    projects/plos-solr/build-image.sh

Or build them all with:

    projects/build-all.sh

This will only work for projects you have the source code locally checked out for, but the builder script will do its best to clone git project repos that it needs source code for.


Running
-------

To see a list of sample stacks that combine the use of these images run app.sh. Here is how you would run one stack:

    ./app.sh wombat

Now, in the case above you can visit some pages to see they are up:

    http://localhost:8001/DesktopPlosOne  # wombat
    http://localhost:8080                 # rhino
    http://localhost:8085                 # content repo

Note, that before running one of these docker-compose files you need to make sure you have built the images it depends on (see above).


Testing
-------

See the tests/ directory. These are not exhaustive service tests. They are supposed to test your containers, such that you can update the Dockerfiles and be sure that it does not break anything.


Development/Conventions
-----------------------

For each project the images created for it should be tagged with a version number and with the name of the git branch.

In each image, create a file at /root/version.txt that contains the version number representing the built artifacts. For example, "0.5.0-SNAPSHOT".


Scaling/Load Balancing
----------------------

There is a scaling demo that runs multiple instances of NED using Consul. Here is roughly how you would use it.

* Start stack: `./app.sh nedapi_consul`
* See the consul UI: http://localhost:8500/ui
* Run more NED instances: `./app.sh nedapi_consul scale nedapi=4`
* Refresh the consul UI to see the added services
* Run `journalctl -f` on host to watch haproxy log to see its spanning requests to different containers
* Visit NED proxy at http://localhost:8081/v1/service/config while watching that log is spanning requests
* You can see proxy stats at http://localhost:1936/ but it wont be accurate since scaling restarts haproxy which reset the values to 0


Docker Registry
---------------

The Docker registry is a place to host images. Images can be pushed and pulled from our local Docker Registry (2.0). If an image is there you, you can pull from it instead of having to build it.

To use our registry make sure you have configured your Docker daemon such that it can talk to our repo (see confluence doc).

As an example, here is how you would run the new Ambra stack from the repo:

    ./registry.sh pull_stack configurations/web_delivery.yml
    docker-compose -f configurations/web_delivery.yml up

To see the Wombat home page, visit:
    http://localhost:8081

Note: The above example requires you to have ambra templates and plos-themes checked out locally.

Status/Todo
-----------

* Akita and Lemur apps will have problems with CAS because of this bug:
https://github.com/dlindahl/omniauth-cas/issues/41
* Setup postgres helper method for lemur
* Lemur needs to seperate app and db config
* Figure out why lemur frontend needs specific npm and bower versions


Tips
----

Some of our projects make use of PLOS's maven repository, and there is a different route to it if you are in network. New containers copy the host's resolve.conf file into the container. However, in Ubuntu 14, it seems this file is managed differently on the host.

To allow resolve.conf to populate as it used to I had to open
/etc/NetworkManager/NetworkManager.conf

and comment out this line:

    dns=dnsmasq
