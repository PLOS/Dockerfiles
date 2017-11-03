from test_helper import stack, log, assert_status
import requests
import time
import os
import docker

compose_config = 'ploscrawl'

solr = 'http://solr:8983'
wait_urls = [solr + '/solr/site_search/select']

class Test():

  d = docker.from_env()

  def test_scraper_list(self, stack):

    scrapernames = str(self.d.containers.run('plos/ploscrawl:dev', 'scrapy list', detach=False, stderr=True))  #, auto_remove=True

    assert 'blogs' in scrapernames
    assert 'journalarticles' in scrapernames
    assert 'plosorg' in scrapernames

  def test_scrape_articles(self, stack):

    assert requests.get(solr + "/solr/site_search/select?fl=*&indent=on&q=*:*&wt=json").json()['response']['numFound'] == 0, 'solr should be empty'

    self.d.containers.run('plos/ploscrawl:dev', 'scrapy crawl journalarticles -a urls="http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0028001,http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0027963" -a solr_url='+ solr +'/solr/site_search', network='configurations_default', detach=False, stderr=True)

    # TODO: figure out how to clean up containers after they runs
    # , name='runcrawl'
    # auto_remove=True fails for some reason
    # self.d.containers.prune({name:'runcrawl'})

    assert requests.get(solr + "/solr/site_search/select?fl=*&indent=on&q=*:*&wt=json").json()['response']['numFound'] == 2, 'solr should now have 2 articles in it'
