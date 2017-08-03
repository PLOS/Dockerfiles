from test_helper import stack, log, assert_status
import requests
import time
import os

compose_config = 'solr'

solr = 'http://solr:8080'
wait_urls = [solr]

class Test():

  def test_solr_up(self, stack):
    assert_status(solr + '/solr/', 200)
