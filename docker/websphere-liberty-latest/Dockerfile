FROM ubuntu:14.04
# Used https://github.com/WASdev/ci.docker scripts
MAINTAINER Martijn Blankestijn <martijnblankestijn@gmail.com>

RUN apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

# Install JRE
#RUN wget -q https://iwm.dhe.ibm.com/sdfdl/1v2/regs2/linuxjavasdks/java/java8/8.0.0.0/linuxamd64/Xa.2/Xb.N2_vvPzUu9pD8Wg3CrrtCJ7jA6BOeai37cP4wSvPJg/Xc.8.0.0.0/linuxamd64/ibm-java-x86_64-sdk-8.0-0.0.bin/Xd./Xf.LPr.D1vk/Xg.8001303/Xi.swg-sdk8/XY.regsrvs/XZ.CIOCUQEtgePOgs6vaxVthIDWAwk/ibm-java-x86_64-sdk-8.0-0.0.bin -U UA-IBM-WebSphere-Liberty-Docker -O /tmp/ibm-java.bin \
#    && chmod +x /tmp/ibm-java.bin \
#    && echo "INSTALLER_UI=silent" > /tmp/response.properties \
#    && echo "USER_INSTALL_DIR=/opt/ibm/java" >> /tmp/response.properties \
#    && mkdir /opt/ibm \
#    && /tmp/ibm-java.bin -i silent -f /tmp/response.properties \
#    && mv /tmp/ibm-java-x86_64-* /opt/ibm/java \
#    && rm /tmp/response.properties \
#    && rm /tmp/ibm-java.bin

RUN wget -q https://iwm.dhe.ibm.com/sdfdl/1v2/regs2/linuxjavasdks/java/java8/8.0.0.0/linuxamd64/Xa.2/Xb.N2_vvPzUu9pD8Wg3CrrtCJ7jA6BOeai37cP4wSvPJg/Xc.8.0.0.0/linuxamd64/ibm-java-x86_64-sdk-8.0-0.0.bin/Xd./Xf.LPr.D1vk/Xg.8001303/Xi.swg-sdk8/XY.regsrvs/XZ.CIOCUQEtgePOgs6vaxVthIDWAwk/ibm-java-x86_64-sdk-8.0-0.0.bin -U UA-IBM-WebSphere-Liberty-Docker -O /tmp/ibm-java.bin
RUN chmod +x /tmp/ibm-java.bin \
    && echo "INSTALLER_UI=silent" > /tmp/response.properties \
    && echo "USER_INSTALL_DIR=/opt/ibm/java" >> /tmp/response.properties \
    && mkdir /opt/ibm
RUN /tmp/ibm-java.bin -i silent -f /tmp/response.properties
#RUN mv /tmp/ibm-java-x86_64-* /opt/ibm/java \
RUN  rm /tmp/response.properties \
    && rm /tmp/ibm-java.bin

ENV JAVA_HOME /opt/ibm/java
ENV PATH $JAVA_HOME/jre/bin:$PATH

# Install WebSphere Liberty
ENV LIBERTY_VERSION 2015.3.0_0
RUN LIBERTY_URL=$(wget -q -O - https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/downloads/wlp/index.yml | sed -n '/'$LIBERTY_VERSION'/{n;p}' | sed -n 's/\s*uri:\s//p') \
    && wget -q $LIBERTY_URL -U UA-IBM-WebSphere-Liberty-Docker -O /tmp/wlp-developers-runtime.jar \
    && java -jar /tmp/wlp-developers-runtime.jar --acceptLicense /opt/ibm \
    && rm /tmp/wlp-developers-runtime.jar
# COPY liberty-run /opt/ibm/wlp/bin/
ENV PATH /opt/ibm/wlp/bin:$PATH

