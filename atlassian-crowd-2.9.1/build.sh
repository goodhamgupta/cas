#!/bin/sh

CROWD_ANT="$PWD/apache-tomcat/tools/ant"

# ----- SET $ANT_HOME TO POINT TO $CROWD_ANT

ANT_HOME="$CROWD_ANT"
export ANT_HOME

unset CLASSPATH

exec "$CROWD_ANT/bin/ant" --noconfig -emacs "$@"
