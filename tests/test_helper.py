import requests
import logging
import sys
import os
import pytest
import shlex

from subprocess import call
import subprocess
from retry import retry

logging.basicConfig( stream=sys.stderr )
logging.getLogger( "log" ).setLevel( logging.DEBUG )
log=logging.getLogger( "log" )

def docker_compose(compose_base, command):
    env = os.environ.copy()
    env[b'DOCKERFILES'] = b'/dockerfiles'
    compose = 'docker-compose -f /dockerfiles/configurations/'+compose_base+'.yml'
    # log.debug("RUN: " + compose + ' ' + command)
    subprocess.check_output(shlex.split(compose + ' ' + command), env=env)

@retry(requests.exceptions.ConnectionError, tries=30, delay=3)
def wait_for_web_service(url):
	log.debug("Trying to reach " + url + " ...")
	return requests.get(url)

@pytest.fixture(scope="class")
def stack(request):

    compose_base = getattr(request.module, "config", "unknown")
    url = getattr(request.module, "url", "http://unknown:123")

    log.debug('url: ' + url)
    log.debug('compose_base: ' + compose_base)

    docker_compose(compose_base, 'kill')
    docker_compose(compose_base, 'rm -f -v')
    docker_compose(compose_base, 'up -d')
    wait_for_web_service(url)
    yield

    docker_compose(compose_base, 'kill')
    docker_compose(compose_base, 'rm -f -v')
