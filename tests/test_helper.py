import requests
import logging
import sys
import os
import pytest
import shlex

from subprocess import call
import subprocess
from retry import retry

logging.basicConfig(stream=sys.stderr )
logging.getLogger("log").setLevel( logging.DEBUG )
log=logging.getLogger("log")

def docker_compose(compose_config, command):
  # compose = 'docker-compose -f /dockerfiles/configurations/'+compose_config+'.yml'
  # log.debug("RUN: " + compose + ' ' + command)
  subprocess.check_output(shlex.split('docker-compose -f /dockerfiles/configurations/'+compose_config+'.yml ' + command))

@retry(requests.exceptions.ConnectionError, tries=30, delay=3)
def wait_for_web_service(url):
  log.debug("Trying to reach " + url + " ...")
  return requests.get(url)

@pytest.fixture(scope="class")
def stack(request):

  compose_config = getattr(request.module, "compose_config", "unknown")
  wait_urls = getattr(request.module, "wait_urls", "http://unknown:123")

  # log.debug('wait_urls: ' + wait_urls)
  log.debug('compose_config: ' + compose_config)

  docker_compose(compose_config, 'kill')
  docker_compose(compose_config, 'rm -f -v')
  docker_compose(compose_config, 'up -d')

  for url in wait_urls:
    wait_for_web_service(url)

  yield

  docker_compose(compose_config, 'kill')
  docker_compose(compose_config, 'rm -f -v')
