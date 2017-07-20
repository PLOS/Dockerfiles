from test_helper import stack, log
import requests
import time
import os

compose_config = 'ambra_minimal'
repo = 'http://contentrepo:8080'
rhino = 'http://rhino:8080'
wombat = 'http://wombat:8080'
solr = 'http://solr_dummy:8983'
wait_urls = [repo, rhino + '/journals', solr, wombat]

class Test():

  article = 'pone.0099781'

  solr_base = solr +'/solr/collection1'

  article_rhino = rhino + '/articles/10.1371++journal.' + article

  article_solr = solr + '/select?q=10.1371%2Fjournal.' + article +  '&wt=json&indent=true'

  def test_post_article(self, stack):

    files = {'file': open('/dockerfiles/tests/test_data/accman/'+ self.article +'.zip', 'rb')}

    r = requests.post(rhino + '/articles?bucket=corpus', files=files)
    assert r.status_code == 200
    # ......
