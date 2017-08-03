# hack to prevent port conflicts when using host networking mode

[[ -n $TOMCAT_HTTP_PORT ]] && sed -i -e "s/8080/$TOMCAT_HTTP_PORT/g" $CATALINA_HOME/conf/server.xml

[[ -n $TOMCAT_CONTROL_PORT ]] && sed -i -e "s/8005/$TOMCAT_CONTROL_PORT/g" $CATALINA_HOME/conf/server.xml

# end hack. note this might break the HEALTHCHECK

${CATALINA_HOME}/bin/catalina.sh run
