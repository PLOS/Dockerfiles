import requests
# import time
import logging
import sys
import os
import pytest
import shlex

from subprocess import call
import subprocess
from retry import retry

# compose_base = 'docker-compose -f /dockerfiles/configurations/contentrepo.yml'


# class EnvoyTest():

logging.basicConfig( stream=sys.stderr )
logging.getLogger( "log" ).setLevel( logging.DEBUG )
log=logging.getLogger( "log" )

# def __init__(self, compose_config):
#     self.compose_base='docker-compose -f /dockerfiles/configurations/'+compose_config+'.yml'
#
# def set_config(compose_config):
#     self.compose_base='docker-compose -f /dockerfiles/configurations/'+compose_config+'.yml'
#     print("Set config to: " + self.compose_base)

# def docker_compose(self, command):
def docker_compose(command):
    env = os.environ.copy()
    env[b'DOCKERFILES'] = b'/dockerfiles'
    subprocess.check_output(shlex.split(compose_base + ' ' + command), env=env)

def docker_compose(compose_base, command):
    env = os.environ.copy()
    env[b'DOCKERFILES'] = b'/dockerfiles'
    subprocess.check_output(shlex.split(compose_base + ' ' + command), env=env)

def funct_a():
    log.debug('function_a')


@retry(requests.exceptions.ConnectionError, tries=30, delay=3)
def wait_for_web_service(url):
	log.debug("Trying to reach " + url + " ...")
	return requests.get(url)

@pytest.fixture(scope="class")
def stack(request):

    log.debug('asdasd')
    # print ("starting stack")
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


    # # url = 'http://localhost:8085'
    # url = 'http://contentrepo:8080'
    # log.debug("Trying to reach " + url + " ...")
    # requests.get(url)
    # return url



# @pytest.fixture(scope="class")
# # def stack(setup):
# def stack(request):
#
#     print ("starting stack")
#     compose_base = getattr(request.module, "config", "unknown")
#
#     docker_compose('kill')
#     docker_compose('rm -f -v')
#     docker_compose('up -d')
#     yield
#
#     docker_compose('kill')
#     docker_compose('rm -f -v')
#     # self.docker_compose('kill')
#     # self.docker_compose('rm -f -v')
#     # self.docker_compose('up -d')
#     # yield
#     #
#     # self.docker_compose('kill')
#     # self.docker_compose('rm -f -v')

# @pytest.fixture(scope="module")
# def stack():
#     docker_compose('kill')
#     docker_compose('rm -f -v')
#     docker_compose('up -d')
#     yield
#
#     docker_compose('kill')
#     docker_compose('rm -f -v')
#
# @pytest.fixture(scope="module")
# @retry(requests.exceptions.ConnectionError, tries=20, delay=3)
# def svc_url(stack):
#     # url = 'http://localhost:8085'
#     url = 'http://contentrepo:8080'
#     log.debug("Trying to reach " + url + " ...")
#     requests.get(url)
#     return url
