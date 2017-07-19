from test_helper import stack, log
import requests
import time
import os

compose_config = 'akita'
nedapi = 'http://nedapi:8080'
nedcas = 'http://nedcas:8080'
akita = 'http://akita'
mailcatcher = 'http://mailcatcher'
wait_urls = [nedapi + '/v1/service/config',
    nedcas + '/cas/login',
    akita + '/registration/new',
    mailcatcher + '/']

class Test():

  def test_rails_to_ned(self, stack):
    r = requests.get(akita + '/flanders/v1/types/countries')
    assert r.status_code == 200

    r = requests.get(akita + '/flanders/status/more')
    log.debug( "config = %r", r )
    assert r.status_code == 200

  def test_frontend(self, stack):
    r = requests.get(akita)
    assert r.status_code == 200
    assert 'akita' in r.text
