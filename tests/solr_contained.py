from test_helper import stack, log
import requests
import time
import os

compose_config = 'solr'

solr = 'http://solr:8080'
wait_urls = [solr]

class Test():

  def test_solr_up(self, stack):
    r = requests.get(solr + '/solr/')
    assert r.status_code == 200
