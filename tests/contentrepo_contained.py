
# pytest contentrepo_pytest.py -v
# from test_helper import EnvoyTest
from test_helper import stack
import requests
import time
import logging
import sys
import os
import pytest
import shlex
#
# from subprocess import call
import subprocess
from retry import retry

# compose_base = 'docker-compose -f /dockerfiles/configurations/contentrepo.yml'


bucket = 'bucket_' + str(time.time())

obj_name = 'object_' + str(time.time())
local_input_file = os.path.realpath(__file__) #'../LICENSE'  # '/usr/bin/env'


logging.basicConfig( stream=sys.stderr )
logging.getLogger( "log" ).setLevel( logging.DEBUG )
log=logging.getLogger( "log" )


config = 'contentrepo'
url = 'http://contentrepo:8080'
#
# def docker_compose(command):
#     env = os.environ.copy()
#     env[b'DOCKERFILES'] = b'/dockerfiles'
#     subprocess.check_output(shlex.split(compose_base + ' ' + command), env=env)
#
# @retry(requests.exceptions.ConnectionError, tries=30, delay=3)
# def wait_for_web_service(url):
# 	log.debug("Trying to reach " + url + " ...")
# 	return requests.get(url)
#
# @pytest.fixture(scope="class")
# def stack(request):
#
#     log.debug('asdasd')
#     # print ("starting stack")
#     compose_base = getattr(request.module, "config", "unknown")
#     url = getattr(request.module, "url", "http://unknown:123")
#
#     log.debug('url: ' + url)
#
#     docker_compose('kill')
#     docker_compose('rm -f -v')
#     docker_compose('up -d')
#     wait_for_web_service(url)
#     yield
#
#     docker_compose('kill')
#     docker_compose('rm -f -v')


#
# @pytest.fixture()
# def stack():
#     log.debug('asdasd')
#     print ("starting stack")
#     # compose_base = getattr(request.module, "config", "unknown")
#     #
#     # docker_compose('kill')
#     # docker_compose('rm -f -v')
#     # docker_compose('up -d')
#     # yield
#     #
#     # docker_compose('kill')
#     # docker_compose('rm -f -v')


# class TestContentRepo(EnvoyTest):
class TestContentRepo():

    config = 'contentrepo'

    url = 'http://contentrepo:8080'
    #
    # def docker_compose(command):
    #     env = os.environ.copy()
    #     env[b'DOCKERFILES'] = b'/dockerfiles'
    #     subprocess.check_output(shlex.split(compose_base + ' ' + command), env=env)

    # # def __init__(self):
    # @pytest.fixture(scope="class")
    # def setup():
    #     set_config('contentrepo')
    #     # super('contentrepo')

    # @pytest.fixture(scope="class")
    # def stack(self,setup):
    #     print ("starting stack")
    #     self.docker_compose('kill')
    #     self.docker_compose('rm -f -v')
    #     self.docker_compose('up -d')
    #     yield
    #
    #     self.docker_compose('kill')
    #     self.docker_compose('rm -f -v')

    #
    # @pytest.fixture(scope="class")
    # def stack():
    #     log.debug("asdas")
    #     # print ("starting stack")
    #


    # @pytest.fixture(scope="class")
    # @retry(requests.exceptions.ConnectionError, tries=20, delay=3)
    # def svc_url(request):
    #
    #     log.debug('asdasd')
    #     print ("starting stack")
    #     # compose_base = getattr(request.module, "config", "unknown")
    #
    #     docker_compose('kill')
    #     docker_compose('rm -f -v')
    #     docker_compose('up -d')
    #     yield
    #
    #     docker_compose('kill')
    #     docker_compose('rm -f -v')
    #
    #
    #     # url = 'http://localhost:8085'
    #     url = 'http://contentrepo:8080'
    #     log.debug("Trying to reach " + url + " ...")
    #     requests.get(url)
    #     return url


    def test_get_config(self, stack):
        funct_a()
        r = requests.get(url + '/config')
        self.log.debug( "config = %r", r.json() )
        assert r.status_code == 200
    #
    # def test_create_bucket(self, svc_url):
    #     r = requests.post(svc_url + '/buckets', data={'name':bucket})
    #     assert r.status_code == 201
    #
    # def test_create_object(self, svc_url):
    #     r = requests.post(svc_url + '/objects', data={'create':'new', 'key':obj_name ,'bucketName':bucket}, files={'file': open(local_input_file)})
    #     assert r.status_code == 201
    #
    # def test_read_object(self, svc_url):
    #     r = requests.get(svc_url + '/objects/' + bucket + "?key=" + obj_name)
    #     assert r.status_code == 200
    #     assert open(local_input_file).read() == r.text
