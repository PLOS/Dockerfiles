from test_helper import stack, log
import requests
import time
import os

compose_config = 'ned'
nedapi = 'http://nedapi:8080'
nedcas = 'http://nedcas:8080'
wait_urls = [nedapi + '/v1/service/config', nedcas + '/cas/login']

class Test():

  def test_auth_request(self, stack):
    r = requests.get(nedapi + '/v1/typeclasses', auth=('dev', 'dev'))
    log.debug( "config = %r", r )
    assert r.status_code == 200
