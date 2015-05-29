#!/bin/bash

MAVEN_CACHE=maven_cache

BUILD_CACHE=${PROJECTNAME}_build
TMP_BUILD_CONTAINER=${PROJECTNAME}_temp_container

function die () {
  echo "$@" 1>&2
  exit 1
}

function build_java_service_images() {

	if [ ! -d $SRC ]; then
	  echo "Source directory not found $SRC"
	  git --version > /dev/null || die "git is not installed"

	  git clone git@github.com:PLOS/${PROJECTDIR}.git $SRC

	  if [ ! -d $SRC ]; then die "git clone failed"; fi
	fi

	# create build caches if they do not exist

	docker inspect $BUILD_CACHE > /dev/null
	[ $? -eq 1 ] && docker create -v /build --name $BUILD_CACHE $BASEIMAGE /bin/true

	docker inspect $MAVEN_CACHE > /dev/null
	[ $? -eq 1 ] && docker create -v /root/.m2 --name $MAVEN_CACHE $BASEIMAGE /bin/true

	# build API war

	echo Building java assets

	docker run -it \
	   --volumes-from $MAVEN_CACHE \
	   --volumes-from $BUILD_CACHE \
	   --volume $SRC:/src \
	   --volume $DIR:/scripts \
	   $BASEIMAGE bash /scripts/compile.sh

	echo Building base image

	docker build -t $PROJECTNAME:current .

	# copy assets and scripts into image

	echo Copying java assets into image

	VERSION=$(docker run --volume $DIR:/scripts \
											 --volume $DIR/..:/shared \
											 --volumes-from $BUILD_CACHE \
											 --name $TMP_BUILD_CONTAINER $PROJECTNAME:current \
											 sh -c 'cp /build/* /root; \
											 				cp /shared/run-helpers.sh /root/; 
											 				cp /scripts/run.sh /root/;
											 				chmod 755 /root/run.sh;
											 				cat /root/version.txt')

	docker commit $TMP_BUILD_CONTAINER $PROJECTNAME:current

	# tag docker image with asset version number

	echo tagging container with version : $VERSION

	docker tag -f $PROJECTNAME:current $PROJECTNAME:$VERSION

	docker rm $TMP_BUILD_CONTAINER

}
