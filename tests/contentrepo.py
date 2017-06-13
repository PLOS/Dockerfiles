# from app import app
import unittest
import requests
import time

# from proboscis.asserts import assert_equal
# from proboscis import test

svc_url = 'http://localhost:8085'

bucket = 'bucket_' + str(time.time())

class AppTests(unittest.TestCase):

    # def setUp(self):
    #     self.app = app.test_client()
    #
    # def tearDown(self):
    #     pass

    # svc_url = 'http://contentrepo:8080'

    def test_add_noparams(self):
        self.assertEqual(404, 404)

    def test_get_config(self):
        r = requests.get(svc_url + '/config')
        # r.json()
        self.assertEqual(r.status_code, 200)

    def test_create_bucket(self):
        r = requests.post(svc_url + '/buckets', data={'name':bucket})
        self.assertEqual(r.status_code, 201)

    def test_create_object(self):
        object1 = 'object_' + str(time.time())
        files = {'file': open('/usr/bin/env', 'rb')}

        r = requests.post(svc_url + '/objects', data={'create':'new', 'key':object1 ,'bucketName':bucket}, files=files)

        self.assertEqual(r.status_code, 201)

if __name__ == "__main__":
    unittest.main()
