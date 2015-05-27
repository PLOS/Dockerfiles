FROM tomcat:6-jre7

RUN apt-get update && apt-get install -y mysql-client

RUN wget -P /usr/local/tomcat/lib/ http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar

# note: this is appended to in the build script
