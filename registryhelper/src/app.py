from flask import Flask
import subprocess

app = Flask(__name__)

@app.route("/")
def hello():
  return "Hello World!"

@app.route("/ping")
def ping():
	return "pong"

@app.route("/images")
def images():
#	return subprocess.Popen("find /var/docker-registry/data/docker/registry/v2/repositories -maxdepth 4 | grep _manifests/tags/ | sed 's/^\(\/var\/docker-registry\/data\/docker\/registry\/v2\/repositories\/\)//'| sed 's/\/_manifests\/tags\//:/'|sort", shell=True, stdout=subprocess.PIPE).stdout.read()
	return subprocess.Popen("find /repositories -maxdepth 4 | grep _manifests/tags/ | sed 's/^\(\/repositories\/\)//'| sed 's/\/_manifests\/tags\//:/'|sort", shell=True, stdout=subprocess.PIPE).stdout.read()

if __name__ == "__main__":
	app.run(host="0.0.0.0", debug=True)
