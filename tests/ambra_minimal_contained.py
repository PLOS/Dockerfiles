from test_helper import stack, log, assert_status
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

  article = 'pone.0153419'

  solr_base = solr +'/solr/collection1'

  article_rhino = rhino + '/articles/10.1371++journal.' + article

  article_solr = solr + '/select?q=10.1371%2Fjournal.' + article +  '&wt=json&indent=true'

  def test_post_article(self, stack):
    assert_status(requests.post(rhino + '/articles',
      files={'archive': open('/dockerfiles/tests/test_data/demo/'+ self.article +'.zip', 'rb')}), 201)

    r = assert_status(self.article_rhino, 200)
    assert r.json()['ingestions']['1'] == [], r.json()

  def test_create_revision(self, stack):
    assert_status(
      requests.post(self.article_rhino + '/revisions?ingestion=1'), 201)

    assert requests.get(self.article_rhino).json()['revisions']['1'] == 1

  def test_article_render(self, stack):
    assert_status(wombat + '/article?id=10.1371/journal.' + self.article, 200)
