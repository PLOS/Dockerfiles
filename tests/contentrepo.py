import unittest
import requests
import time
import logging
import sys
import os
# from retrying import retry

from retry import retry

# from proboscis.asserts import assert_equal
# from proboscis import test

# svc_url = 'http://localhost:8085'
svc_url = 'http://contentrepo:8080'

bucket = 'bucket_' + str(time.time())

obj_name = 'object_' + str(time.time())
local_input_file = os.path.realpath(__file__) #'../LICENSE'  # '/usr/bin/env'
logging.basicConfig( stream=sys.stderr )
logging.getLogger( "log" ).setLevel( logging.DEBUG )
log=logging.getLogger( "log" )

class AppTests(unittest.TestCase):

    # def setUp(self):
    #     self.app = app.test_client()
    #
    # def tearDown(self):
    #     pass

    @retry(requests.exceptions.ConnectionError, tries=30, delay=3)
    def wait_for_web_service(self, url):
    	log.debug("Trying to reach " + url + " ...")
    	return requests.get(url)

    def test_1_get_config(self):
        self.wait_for_web_service(svc_url)
        r = requests.get(svc_url + '/config')
        log.debug( "config= %r", r.json() )
        self.assertEqual(r.status_code, 200)

    def test_2_create_bucket(self):
        r = requests.post(svc_url + '/buckets', data={'name':bucket})
        self.assertEqual(r.status_code, 201)

    def test_3_create_object(self):
        r = requests.post(svc_url + '/objects', data={'create':'new', 'key':obj_name ,'bucketName':bucket}, files={'file': open(local_input_file)})
        self.assertEqual(r.status_code, 201)

    def test_4_read_object(self):
        r = requests.get(svc_url + '/objects/' + bucket + "?key=" + obj_name)
        self.assertEqual(r.status_code, 200)
        self.assertEqual(open(local_input_file).read(), r.text)

if __name__ == "__main__":
    unittest.main()
