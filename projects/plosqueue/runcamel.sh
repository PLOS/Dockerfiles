#!/bin/sh

# this file was coppied over from old plos-queue (https://github.com/PLOS/plos-queue/blob/ffbffdb34e3138be75822f411962c85a4884f5fa/src/main/bin/runcamel.sh) since it appears this is no longer in the repo since it was moved to an init script (https://github.com/PLOS-Formulas/camel-formula/blob/dev/camel/conf/etc/init.d/plos-queue) in a salt formula. I'm not quite sure.

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

if [ -z "$PLOS_CAMEL_OPTS" ] ; then
  PLOS_CAMEL_OPTS="-Dhawtio.port=61617 -Xmx512M -server -showversion -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.local.only=false"
fi

PLOS_CAMEL_CLASSPATH="${PLOS_CAMEL_HOME}/*:${PLOS_CAMEL_HOME}/lib/*"

exec "$JAVACMD" $PLOS_CAMEL_OPTS -cp $PLOS_CAMEL_CLASSPATH org.plos.camel.Main
