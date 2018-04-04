from test_helper import stack, log, assert_status
import requests
import time
import os

compose_config = 'ambra_plos'

repo = 'http://contentrepo:8080'
rhino = 'http://rhino:8080'
wombat = 'http://wombat:8080'
solr = 'http://solr:8080'
wait_urls = [repo + '/config', rhino + '/journals', solr, wombat]

class Test():

  article = 'pone.0099781'
  solr_base = solr +'/solr/collection1'
  article_rhino = rhino + '/articles/10.1371++journal.' + article
  article_solr = solr + '/select?q=10.1371%2Fjournal.' + article +  '&wt=json&indent=true'

  def test_post_article(self, stack):
    assert_status(requests.post(rhino + '/articles?bucket=corpus', files={'archive': open('/dockerfiles/tests/test_data/'+ self.article +'.zip', 'rb')}), 201)

    req = assert_status(self.article_rhino)
    assert req.json()['ingestions']['1'] == [], req.json()

  def test_create_revision(self, stack):
    assert_status(requests.post(self.article_rhino + '/revisions?ingestion=1'), 201)

    req = assert_status(self.article_rhino)
    assert req.json()['revisions']['1'] == 1, req.json()

  def test_themes_load(self, stack):
    # known 500 error since plos news is missing from some DB
    req = assert_status(wombat + '/DesktopPlosOne/', 500)
    assert 'plos.org' in req.text

  def test_article_render(self, stack):
    assert_status(wombat + '/DesktopPlosOne/article?id=10.1371/journal.' + self.article, 200)

  def test_solr_empty(self, stack):
    assert_status(self.solr_base + '/admin/ping?wt=json')
    req = assert_status(self.article_solr, 404)


# NOTE: the following are tests that were commented out of the original ambra.sh test script since they were broken. They should be fixed.

# TODO: queue (and indexerminion?) dont work after salting and figshare updates? (post 3.0.0?). need to finish fixing
#
# # index it (queue)
#
# curl -X POST $ARTICLE_RHINO?solrIndex=anythinggoeshere
#
# sleep 3 # sloppy wait for queue to run job
#
# # force commit the solr index update
# curl $SOLR_BASE/update?commit=true
#
# sleep 2
#
# curl $ARTICLE_SOLR
#
# curl $ARTICLE_SOLR | grep $ARTICLE
# 	test_true "queue/indexer"
#
# # TODO: make some changes that will reflect in the index
#
# # update the index
# run_container_once indexerminion
# 	test_true "minion run"
#
# # force commit the solr index update
# curl $SOLR_BASE/update?commit=true
#
# curl $ARTICLE_SOLR | grep $ARTICLE
# 	test_true "reindex"
#
# # TODO: fetch categories, and repopulate ?
