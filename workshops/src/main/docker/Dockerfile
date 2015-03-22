FROM mblankestijn/wlp-beta

# Configure WebSphere Liberty
RUN /opt/ibm/wlp/bin/server create \
    && rm -rf /opt/ibm/wlp/usr/servers/.classCache
COPY server.xml /opt/ibm/wlp/usr/servers/defaultServer/
COPY datasource.xml /opt/ibm/wlp/usr/servers/defaultServer/
COPY features.xml /opt/ibm/wlp/usr/servers/defaultServer/
COPY logging.xml /opt/ibm/wlp/usr/servers/defaultServer/

RUN mkdir -p /opt/ibm/wlp/usr/shared/resources/h2
COPY h2-1.3.176.jar /opt/ibm/wlp/usr/shared/resources/h2/

EXPOSE 9080
EXPOSE 9443



ADD workshops.war /opt/ibm/wlp/usr/servers/defaultServer/dropins/

ENV LICENSE accept

#ENTRYPOINT ["liberty-run"]
CMD ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]
