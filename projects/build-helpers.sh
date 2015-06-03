#!/bin/bash

MAVEN_LOCAL_REPO=maven_local_repo

BUILD_RESULT_DIR=${PROJECTNAME}_build_result
TMP_BUILD_CONTAINER=${PROJECTNAME}_temp_container

function die () {
  echo "$@" 1>&2
  exit 1
}

function build_java_service_images() {
    # checkout the project from git if it doesn't exist on the local machine

	if [ ! -d $SRC ]
	  then

	  echo "Source directory not found $SRC; Cloning from github..."
	  git --version > /dev/null || die "git is not installed"

	  git clone git@github.com:PLOS/${PROJECTDIR}.git $SRC

	  if [ ! -d $SRC ]; then die "git clone failed"; fi
	fi

	# create build and maven repo volumes if they do not exist
	docker inspect $BUILD_RESULT_DIR > /dev/null
	[ $? -eq 1 ] && docker create -v /build --name $BUILD_RESULT_DIR $BASEIMAGE /bin/true

	docker inspect $MAVEN_LOCAL_REPO > /dev/null
	[ $? -eq 1 ] && docker create -v /root/.m2 --name $MAVEN_LOCAL_REPO $BASEIMAGE /bin/true

	# build API war
	echo "Building and Loading Java Assets on Base Image (maven)..."

	docker run -it \
	   --volumes-from $MAVEN_LOCAL_REPO \
	   --volumes-from $BUILD_RESULT_DIR \
	   --volume $SRC:/src \
	   --volume $DIR:/scripts \
	   $BASEIMAGE bash /scripts/compile.sh

	echo "Building base image ..."

	docker build -t $PROJECTNAME:current .

	# copy assets and scripts into image

	echo "Copying Java Assets into Tomcat Image..."

	VERSION=$(docker run \
	    --volume $DIR:/scripts \
		--volume $DIR/..:/shared \
		--volumes-from $BUILD_RESULT_DIR \
		--name $TMP_BUILD_CONTAINER $PROJECTNAME:current \
		sh -c 'cp -r /build/* /root; \
		cp /shared/run-helpers.sh /root/;
		cp /scripts/run.sh /root/;
		chmod 755 /root/run.sh;
		cat /root/version.txt')

	docker commit $TMP_BUILD_CONTAINER $PROJECTNAME:current

	# tag docker image with asset version number
	echo "tagging container with version : $VERSION"

	docker tag -f $PROJECTNAME:current $PROJECTNAME:$VERSION

	docker rm $TMP_BUILD_CONTAINER
}
