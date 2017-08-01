from test_helper import stack, log, assert_status
import requests
import time
import os

compose_config = 'ned_lb'

nedapi = 'http://nedapi-lb'
wait_urls = [nedapi + '/v1/service/config']

class Test():

  def test_auth_request(self, stack):
    assert_status(nedapi + '/v1/service/config')
    assert_status(requests.get(nedapi + '/v1/typeclasses', auth=('dev', 'dev')))
