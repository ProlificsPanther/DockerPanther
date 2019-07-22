#Setting the base OS
FROM rhel

#Name of Creator
LABEL Author="Panther Support"
LABEL Corporation="Prolifics Inc."

#Libraries required for Panther but doesn't come pre-packed with RedHat 7
RUN yum -y install openmotif

#Install LibXpm.so.4 which isn't coming packed with openmotif latest
COPY libXpm.so.4 /usr/lib64

#Setting up JDK
RUN mkdir -p /Apps/ProlificsContainer
WORKDIR /Apps/ProlificsContainer
COPY jdk-8u192-linux-x64.rpm .
RUN rpm -ivh jdk-8u192-linux-x64.rpm
RUN rm jdk-8u192-linux-x64.rpm
ENV SMJAVALIBRARY=/usr/java/jdk1.8.0_192-amd64/jre/lib/amd64/server/libjvm.so

#Copy and install Lynx
COPY lynx.rpm .
RUN yum -y localinstall lynx.rpm
RUN rm lynx.rpm

#Unpacking Panther
RUN mkdir -p /Apps/ProlificsContainer/prlstdwb552.06
COPY prlstdwb552.06 /Apps/ProlificsContainer/prlstdwb552.06

#Unpacking Panther and creating space for logs
RUN mkdir -p /Apps/ProlificsContainer/TestMigration
COPY migration /Apps/ProlificsContainer/TestMigration
RUN mkdir -p /Apps/ProlificsContainer/TestMigration/UI
COPY UI /Apps/ProlificsContainer/TestMigration/UI
RUN mkdir -p /Apps/ProlificsContainer/TestMigration/error
RUN mkdir -p /Apps/ProlificsContainer/TestMigration/web

#Setting and installing Apache Tomcat
RUN mkdir -p /Apps/ProlificsContainer/Tomcat
ENV CATALINA_HOME=/Apps/ProlificsContainer/Tomcat
COPY apache-tomcat-8.5.33 /Apps/ProlificsContainer/Tomcat

#Configuring Panther Servlet
RUN useradd -ms /bin/bash proweb
ENV HOME=/home/proweb
RUN mkdir -p ${HOME}/ini
COPY PantherDemo.war ${CATALINA_HOME}/webapps
COPY PantherDemo.ini ${HOME}/ini
RUN chmod -R 0777 /home

#Setting up environment for Panther Web
ENV SMBASE=/Apps/ProlificsContainer/prlstdwb552.06
ENV PATH=$SMBASE/util:$SMBASE/config:${CATALINA_HOME}/bin:$SMBASE/servlet:$PATH
ENV SMPATH=$SMBASE/util:$SMBASE/config
ENV LM_LICENSE_FILE=$SMBASE/licenses/license.dat
ENV LD_LIBRARY_PATH=$SMBASE/lib:/usr/lib64:/lib64

#Starting the app and keeping the container running
COPY ./docker-entrypoint.sh /

#Resolving Possible permission issues
RUN chmod -R 0777 /Apps/ProlificsContainer

#Setting the landing point in the container
WORKDIR /Apps/ProlificsContainer/TestMigration

#Expose the ports
EXPOSE 8080

#Setting the user
USER proweb
ENV SMUSER=proweb

ENTRYPOINT ["/docker-entrypoint.sh"]

#Copyright © 2019 Prolifics Inc. All Rights Reserved.