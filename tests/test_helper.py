import requests
import time
import logging
import sys
import os
import pytest
import shlex

from subprocess import call
import subprocess
from retry import retry

compose_base = 'docker-compose -f /dockerfiles/configurations/contentrepo.yml'


class EnvoyTest():

    def __init__(self, compose_config):

        this.compose_base='docker-compose -f /dockerfiles/configurations/'+compose_config+'.yml'

    def docker_compose(self, command):
        env = os.environ.copy()
        env[b'DOCKERFILES'] = b'/dockerfiles'
        subprocess.check_output(shlex.split(compose_base + ' ' + command), env=env)

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
