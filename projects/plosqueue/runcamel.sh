#!/bin/sh

# this file was coppied over from camel-formula here: https://github.com/PLOS-Formulas/camel-formula/blob/dev/camel/conf/opt/plos/plos-queue/run/runcamel.sh

if [ -z "$JAVA_HOME" ] ; then
  echo "Error: JAVA_HOME is not defined"
  exit 1
fi

if [ -z "$PLOS_CAMEL_HOME" ] ; then
  PRG="$0"
  progname=`basename "$0"`
  saveddir=`pwd`

  # need this for relative symlinks
  dirname_prg=`dirname "$PRG"`
  cd "$dirname_prg"

  while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '.*/.*' > /dev/null; then
    PRG="$link"
    else
    PRG=`dirname "$PRG"`"/$link"
    fi
  done

  PLOS_CAMEL_HOME=`dirname "$PRG"`/..
  cd "$saveddir"
  # make it fully qualified
  ACTIVEMQ_HOME=`cd "$ACTIVEMQ_HOME" && pwd`
fi

if [ -z "$JAVACMD" ] ; then
  if [ -n "$JAVA_HOME"  ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
      # IBM's JDK on AIX uses strange locations for the executables
      JAVACMD="$JAVA_HOME/jre/sh/java"
    else
      JAVACMD="$JAVA_HOME/bin/java"
    fi
  else
    JAVACMD=`which java 2> /dev/null `
    if [ -z "$JAVACMD" ] ; then
        JAVACMD=java
    fi
  fi
fi

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly."
  echo "  We cannot execute $JAVACMD"
  exit 1
fi

PLOS_CAMEL_OPTS="-Dhawtio.port=61617 -Dlog4j.configuration=file:/opt/plos/plos-queue/conf/camel-log4j.properties -Dplos.camel.activemq.persistentStoreDir=/opt/plos/plos-queue/run/activemq-data -Dcamel.configuration=file:/opt/plos/plos-queue/conf/camel.properties -Xmx512M -server -showversion -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.local.only=false"

PLOS_CAMEL_CLASSPATH="${PLOS_CAMEL_HOME}/*:${PLOS_CAMEL_HOME}/lib/*"

exec "$JAVACMD" $PLOS_CAMEL_OPTS -cp $PLOS_CAMEL_CLASSPATH org.apache.camel.spring.Main
