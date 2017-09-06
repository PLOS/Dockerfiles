from test_helper import stack, log, assert_status
import requests
import time
import os

compose_config = 'nedcas_lb'

nedapi = 'http://nedapi:8080'
nedcas = 'http://nedcas-lb'
wait_urls = [nedapi + '/v1/service/config', nedcas + '/cas/login']

class Test():

  def test_auth_request(self, stack):
    assert_status(nedapi + '/v1/service/config')
    assert_status(requests.get(nedapi + '/v1/typeclasses', auth=('dev', 'dev')))

  def test_cas_home(self, stack):
    assert_status(nedcas + '/cas/login')
