from test_helper import stack, log, assert_status
import requests
import time
import os

compose_config = 'ned'

nedapi = 'http://nedapi:8080'
nedcas = 'http://nedcas:8080'
wait_urls = [nedapi + '/v1/service/config', nedcas + '/cas/login']

class Test():

  def test_bad_auth_request(self, stack):
    assert_status(nedapi + '/v1/queries/alerts', 401)

  def test_auth_request(self, stack):
    assert_status(requests.get(nedapi + '/v1/typeclasses', auth=('dev', 'dev')))
