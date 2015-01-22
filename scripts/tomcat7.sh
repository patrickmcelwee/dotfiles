#!/bin/sh
export CATALINA_HOME=/usr/local/Cellar/tomcat/7.0.54/libexec

case "$1" in
  "start" )
    export CATALINA_OPTS="-Xms1024m -Xmx1024m -XX:MaxPermSize=512m -Dsolr.solr.home=/srv/solr"
    $CATALINA_HOME/bin/startup.sh
    ;;
  "stop" )
    $CATALINA_HOME/bin/shutdown.sh
    ;;
  "status" )
    ps aux | grep [j]ava
    ;;
  "tail" )
    tail -f $CATALINA_HOME/logs/catalina.out
    ;;
  "log" )
    vim $CATALINA_HOME/logs/catalina.out
    ;;
  "dir" )
    echo "$CATALINA_HOME"
    cd $CATALINA_HOME
esac
