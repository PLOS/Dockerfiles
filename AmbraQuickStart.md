# Ambra Quick Start

* Install Docker ([see envoy requirements section only](https://github.com/PLOS/Dockerfiles/tree/develop/envoy#requirements))

* Fetch the sample themes and bring up the basic stack

      mkdir $HOME/ambra_demo
      wget -O - https://plos.github.io/ambraproject/example/themes.tar.gz | tar xz -C $HOME/ambra_demo
      git clone git@github.com:PLOS/Dockerfiles.git
      cd Dockerfiles
      ./nv stack ambra_minimal

  Wait a minute or two until you see the messages that Wombat is starting up.

* To see which ports your services are running on, in another terminal run

      ./nv stack ambra_minimal ps

  For example you can visit the Wombat frontend via
  http://localhost:8082

  If you are not using Linux, Docker is probably running through docker-machine, and instead of visiting localhost, you would use your docker host IP.


## Doing more (the not so quick start)

To update the configuration take a look at [configurations/ambra_minimal.yml](https://github.com/PLOS/Dockerfiles/blob/develop/configurations/ambra_minimal.yml) in your Dockerfiles.

You can edit the themes in /tmp/themes. You will see the configuration above looks to this path. You can update the location in the config if you want to move it.

If you want to update any of the code in the web apps, you can easily rebuild the containers which will build the needed .war applications automatically. See the [readme](https://github.com/PLOS/Dockerfiles).
