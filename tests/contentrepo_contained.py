
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

# svc_url = 'http://localhost:8085'
# svc_url = 'http://contentrepo:8080'


compose_base = 'docker-compose -f /dockerfiles/configurations/contentrepo.yml'


bucket = 'bucket_' + str(time.time())

obj_name = 'object_' + str(time.time())
local_input_file = os.path.realpath(__file__) #'../LICENSE'  # '/usr/bin/env'
logging.basicConfig( stream=sys.stderr )
logging.getLogger( "log" ).setLevel( logging.DEBUG )
log=logging.getLogger( "log" )

def docker_compose(command):
    subprocess.check_output(shlex.split(compose_base + ' ' + command))

@pytest.fixture(scope="module")
@retry(requests.exceptions.ConnectionError, tries=20, delay=3)
def svc_url():
    # url = 'http://localhost:8085'
    url = 'http://contentrepo:8080'
    # print("TRYING")
    log.debug("Trying to reach " + url + " ...")
    requests.get(url)
    return url

@pytest.fixture(scope="module")
def stack():
    print ('STARTING STACK')

    call(["docker-compose", "-f", "/dockerfiles/configurations/contentrepo.yml", "kill"])
    call(["docker-compose", "-f", "/dockerfiles/configurations/contentrepo.yml", "rm", "-fv"])
    call(["docker-compose", "-f", "/dockerfiles/configurations/contentrepo.yml", "up", "-d"])

    return ('stackk')

@pytest.fixture(scope="module")
def my_cluster(request):

    def fin():
        # subprocess.check_output(shlex.split(compose_base + ' down'))
        docker_compose('kill')
        docker_compose('rm -f -v')

    request.addfinalizer(fin)
    # subprocess.check_output(shlex.split(compose_base + ' up -d'))
    docker_compose('kill')
    docker_compose('rm -f -v')
    docker_compose('up -d')

@pytest.fixture(scope="module")
def my_cluster2(request):

    docker_compose('kill')
    docker_compose('rm -f -v')
    docker_compose('up -d')
    yield

    docker_compose('kill')
    docker_compose('rm -f -v')


def test_get_config(my_cluster2): # svc_url,
    # print (stack)
    # wait_for_web_service(svc_url)
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
