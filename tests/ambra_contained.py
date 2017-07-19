from test_helper import stack, log
import requests
import time
import os

compose_config = 'ambra'
repo = 'http://contentrepo:8080'
rhino = 'http://rhino:8080'
wombat = 'http://wombat:8080'
solr = 'http://solr:8080'
wait_urls = [repo, rhino, solr, wombat]

class Test():

  article = 'pone.0099781'

  solr_base = solr +'/solr/collection1'

  article_rhino = rhino + '/articles/10.1371++journal.' + article

  article_solr = solr + '/select?q=10.1371%2Fjournal.' + article '&wt=json&indent=true'

  def test_post_article(self, stack):
    r = requests.post(rhino + '/dockerfiles/tests/test_data/accman/'+ article +'.zip')
    assert r.status_code == 200
    # ......
