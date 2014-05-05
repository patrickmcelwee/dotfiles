#!/bin/sh
if [ -d '/usr/local/Cellar/tomcat/6.0.26' ]; then
  export CATALINA_HOME=/usr/local/Cellar/tomcat/6.0.26/libexec
elif [ -d '/usr/local/Cellar/tomcat/7.0.53' ]; then
  export CATALINA_HOME=/usr/local/Cellar/tomcat/7.0.53/libexec
else
  echo "ERROR: Could not locate tomcat in /usr/local/Cellar/"
  echo "--> Script currently only supports 6.0.26 and 7.0.53"
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
esac
