from test_helper import stack, log, assert_status
import requests
import time
import os

compose_config = 'ambra_minimal'

repo = 'http://contentrepo:8080'
rhino = 'http://rhino:8080'
wombat = 'http://wombat:8080'
wait_urls = [repo + '/config', rhino + '/journals', wombat]

class Test():

  article = 'pone.0153419'
  article_rhino = rhino + '/articles/10.1371++journal.' + article

  def test_post_article(self, stack):
    assert_status(requests.post(rhino + '/articles',
      files={'archive': open('/dockerfiles/tests/test_data/demo/'+ self.article +'.zip', 'rb')}), 201)

    req = assert_status(self.article_rhino)
    assert req.json()['ingestions']['1'] == [], req.json()

  def test_create_revision(self, stack):
    assert_status(
      requests.post(self.article_rhino + '/revisions?ingestion=1'), 201)

    assert requests.get(self.article_rhino).json()['revisions']['1'] == 1

  def test_article_render(self, stack):
    assert_status(wombat + '/article?id=10.1371/journal.' + self.article)
