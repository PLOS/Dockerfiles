Ambra Quick Start
=================

[Set up Docker](https://github.com/PLOS/Dockerfiles/tree/develop/envoy#requirements)

Fetch the sample themes

    wget -O - http://downloads.ambraproject.org/releases/plos-example-themes.tar.gz | tar xz -C /tmp

Pull down PLOS Dockerfiles

    git clone git@github.com:PLOS/Dockerfiles.git

Bring up the stack

    cd Dockerfiles
    ./nv build stack ambra_minimal
    ./nv stack ambra_minimal

To see which port your services are running on, in another terminal run

    ./nv stack ambra_minimal ps

For example you can visit the Wombat frontend via
https://localhost:8082

If you are not using Linux, Docker is probably running through docker-machine, and instead of visiting localhost, you would use your docker host IP.


Doing more (the not so quick start)
-----------------------------------

To update the configuration take a look at [configurations/ambra_minimal.yml](https://github.com/PLOS/Dockerfiles/blob/develop/configurations/akita_multi.yml) in your Dockerfiles.

You can edit the themes in /tmp/plos-example-themes. You will see the configuration above looks to this path. You can update the location in the config if you want to move it.

If you want to update any of the code in the web apps, you can easily rebuild the containers which will build the needed .war applications automatically. See the [readme](https://github.com/PLOS/Dockerfiles).
