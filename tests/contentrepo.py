from test_helper import stack, log, assert_status
import requests
import time
import os
import pymysql.cursors

compose_config = 'contentrepo'
repo = 'http://contentrepo:8080'
wait_urls = [repo + '/config']

class TestContentRepo():

  bucket = 'bucket_' + str(time.time())
  obj_name = 'object_' + str(time.time())
  local_input_file = os.path.realpath(__file__)

  def test_get_config(self, stack):
    assert_status(repo + '/config')

  def test_create_bucket(self, stack):
    assert_status(
      requests.post(repo + '/buckets',data={'name':self.bucket}), 201)

  def test_create_object(self, stack):
    assert_status(requests.post(repo + '/objects',
      data={'create':'new', 'key':self.obj_name ,'bucketName':self.bucket},
      files={'file': open(self.local_input_file)}), 201)

  def test_read_object_db(self, stack):

    db = pymysql.connect(host='repodb', user='repouser', password='', db='repo')

    try:
      with db.cursor() as cursor:
        cursor.execute("SELECT objkey FROM objects")
        assert cursor.rowcount == 1

        data = cursor.fetchone()
        assert data[0] == self.obj_name
    finally:
      db.close()

  def test_read_object(self, stack):
    r = assert_status(
      repo + '/objects/' + self.bucket + "?key=" + self.obj_name)
    assert open(self.local_input_file).read() == r.text


class TestAnotherContentRepo():

  def test_get_config(self, stack):
    assert_status(repo + '/config')
