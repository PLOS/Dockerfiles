from test_helper import stack, log, assert_status
import requests
import time
import os

compose_config = 'akita_lb'

nedapi = 'http://nedapi:8080'
nedcas = 'http://nedcas:8080'
akita = 'http://akita-lb'
mailcatcher = 'http://mailcatcher'
wait_urls = [nedapi + '/v1/service/config',
    nedcas + '/cas/login',
    akita + '/registration/new',
    mailcatcher + '/']

class Test():

  def test_rails_to_ned(self, stack):
    assert_status(akita + '/flanders/v1/types/countries')
    assert_status(akita + '/flanders/status/more')

  def test_frontend(self, stack):
    req = assert_status(akita)
    assert 'akita' in req.text
