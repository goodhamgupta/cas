#!/bin/sh

cd "`dirname "$0"`"
exec apache-tomcat/bin/startup.sh "$@"
