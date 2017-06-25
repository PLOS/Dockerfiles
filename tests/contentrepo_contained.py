
# pytest contentrepo_pytest.py -v

from test_helper import stack, log
import requests
import time
import os

config = 'contentrepo'
url = 'http://contentrepo:8080'

class TestContentRepo():

    bucket = 'bucket_' + str(time.time())
    obj_name = 'object_' + str(time.time())
    local_input_file = os.path.realpath(__file__)

    def test_get_config(self, stack):
        r = requests.get(url + '/config')
        log.debug( "config = %r", r.json() )
        assert r.status_code == 200

    def test_create_bucket(self, stack):
        r = requests.post(url + '/buckets', data={'name':self.bucket})
        assert r.status_code == 201

    def test_create_object(self, stack):
        r = requests.post(url + '/objects', data={'create':'new', 'key':self.obj_name ,'bucketName':self.bucket}, files={'file': open(self.local_input_file)})
        assert r.status_code == 201

    def test_read_object(self, stack):
        r = requests.get(url + '/objects/' + self.bucket + "?key=" + self.obj_name)
        assert r.status_code == 200
        assert open(self.local_input_file).read() == r.text


class TestAnotherContentRepo():

    def test_get_config(self, stack):
        r = requests.get(url + '/config')
        # log.debug( "config = %r", r.json() )
        assert r.status_code == 200
