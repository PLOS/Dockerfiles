#!/bin/bash

function build_java_service_images() {
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

	docker build -t $OUTPUTIMAGE:current .

	# copy over built assets

	echo Copying java assets into image

	VERSION=$(docker run --volumes-from $BUILD_CACHE --name $TMP_BUILD_CONTAINER $OUTPUTIMAGE:current bash -c 'cp /build/* /root; cat /root/version.txt')

	docker commit $TMP_BUILD_CONTAINER $OUTPUTIMAGE:current

	# tag docker image with asset version number

	echo tagging container with version : $VERSION

	docker tag -f $OUTPUTIMAGE:current $OUTPUTIMAGE:$VERSION

	docker rm $TMP_BUILD_CONTAINER

}
