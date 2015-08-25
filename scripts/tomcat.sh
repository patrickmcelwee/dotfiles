#!/bin/sh
if [ -d '/usr/local/Cellar/tomcat/8.0.21' ]; then
  export CATALINA_HOME=/usr/local/Cellar/tomcat/8.0.21/libexec
else
  echo "ERROR: Could not locate tomcat in /usr/local/Cellar/"
  echo "--> Script currently only supports 8.0.21"
fi

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
    tail -f $CATALINA_HOME/logs/*
    ;;
  "log" )
    vim $CATALINA_HOME/logs/catalina.out
    ;;
  "dir" )
    echo "$CATALINA_HOME"
    cd $CATALINA_HOME
esac
