
# pytest contentrepo_pytest.py -v

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


bucket = 'bucket_' + str(time.time())

obj_name = 'object_' + str(time.time())
local_input_file = os.path.realpath(__file__) #'../LICENSE'  # '/usr/bin/env'
logging.basicConfig( stream=sys.stderr )
logging.getLogger( "log" ).setLevel( logging.DEBUG )
log=logging.getLogger( "log" )

def docker_compose(command):
    env = os.environ.copy()
    env[b'DOCKERFILES'] = b'/dockerfiles'
    subprocess.check_output(shlex.split(compose_base + ' ' + command), env=env)

@pytest.fixture(scope="module")
def stack():
    docker_compose('kill')
    docker_compose('rm -f -v')
    docker_compose('up -d')
    yield

    docker_compose('kill')
    docker_compose('rm -f -v')

@pytest.fixture(scope="module")
@retry(requests.exceptions.ConnectionError, tries=20, delay=3)
def svc_url(stack):
    # url = 'http://localhost:8085'
    url = 'http://contentrepo:8080'
    log.debug("Trying to reach " + url + " ...")
    requests.get(url)
    return url


def test_get_config(svc_url):
    r = requests.get(svc_url + '/config')
    log.debug( "config = %r", r.json() )
    assert r.status_code == 200

def test_create_bucket(svc_url):
    r = requests.post(svc_url + '/buckets', data={'name':bucket})
    assert r.status_code == 201

def test_create_object(svc_url):
    r = requests.post(svc_url + '/objects', data={'create':'new', 'key':obj_name ,'bucketName':bucket}, files={'file': open(local_input_file)})
    assert r.status_code == 201

def test_read_object(svc_url):
    r = requests.get(svc_url + '/objects/' + bucket + "?key=" + obj_name)
    assert r.status_code == 200
    assert open(local_input_file).read() == r.text
