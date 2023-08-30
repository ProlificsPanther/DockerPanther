#Copyright © 2021, 2023 Prolifics Inc. All Rights Reserved.

#Setting the base OS
FROM ubuntu

#Name of Creator
LABEL Author="Panther Support 2023"
LABEL Corporation="Prolifics Inc."

#Set up Working Dir
RUN mkdir -p /Apps/ProlificsContainer
WORKDIR /Apps/ProlificsContainer

# Install OpenJDK-8 (required for Apache-Tomcat)
RUN apt-get update && \
  apt-get install -y openjdk-8-jdk && \
  apt-get install -y ant && \
  apt-get clean;

#Fix JDK certificate issues
RUN apt-get update && \
   apt-get install ca-certificates-java && \
   apt-get clean && \
   update-ca-certificates -f;
ENV SMJAVALIBRARY=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/libjvm.so

#Setup JAVA_HOME 
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

#Setup Apache Tomcat and Copy files from local Apache-Tomcat installation
RUN mkdir -p /Apps/ProlificsContainer/Tomcat
ENV CATALINA_HOME=/Apps/ProlificsContainer/Tomcat
COPY apache-tomcat-8.5.33 /Apps/ProlificsContainer/Tomcat

#Create required Panther distribution folders
RUN mkdir -p /Apps/ProlificsContainer/prlwb554.07
RUN mkdir -p /Apps/ProlificsContainer/prlwb554.07/util
RUN mkdir -p /Apps/ProlificsContainer/prlwb554.07/config
RUN mkdir -p /Apps/ProlificsContainer/prlwb554.07/servlet
RUN mkdir -p /Apps/ProlificsContainer/prlwb554.07/licenses
RUN mkdir -p /Apps/ProlificsContainer/prlwb554.07/lib
#Copy required distribution files from local Panther 5.54 Web installation
COPY prlstdwb554.07/util /Apps/ProlificsContainer/prlwb554.07/util
COPY prlstdwb554.07/config /Apps/ProlificsContainer/prlwb554.07/config
COPY prlstdwb554.07/servlet /Apps/ProlificsContainer/prlwb554.07/servlet
COPY prlstdwb554.07/lib /Apps/ProlificsContainer/prlwb554.07/lib

#Please obtain a current Panther license file from support@prolifics.com
COPY license.dat /Apps/ProlificsContainer/prlwb554.07/licenses

#Create log files etc
RUN mkdir -p /Apps/ProlificsContainer/PantherDemo
RUN mkdir -p /Apps/ProlificsContainer/PantherDemo/logs

#Set up Panther Web 5.54 environment 
ENV SMBASE=/Apps/ProlificsContainer/prlwb554.07
ENV PATH=$SMBASE/util:$SMBASE/config:${CATALINA_HOME}/bin:$PATH
ENV SMPATH=$SMBASE/util:$SMBASE/config
ENV SMVARS=$SMBASE/config/smvars.bin
#project.lib is located in /PantherDemo - contains Panther screens
COPY project.lib /Apps/ProlificsContainer/PantherDemo
ENV SMFLIBS=/Apps/ProlificsContainer/PantherDemo/project.lib
ENV LM_LICENSE_FILE=$SMBASE/licenses/license.dat
ENV LD_LIBRARY_PATH=$SMBASE/lib:/usr/lib64:/lib64:/usr/lib/x86_64-linux-gnu

#Create proweb user and configure Panther Web 5.54
RUN useradd -ms /bin/bash proweb
ENV HOME=/home/proweb
RUN chmod -R 0777 /home
RUN chmod -R 0777 /home/proweb
RUN mkdir -p ${HOME}/ini
COPY PantherDemo.war ${CATALINA_HOME}/webapps
COPY PantherDemo.ini ${HOME}/ini

#Install libjpegso.62 required for Panther Web
RUN apt-get -y update && \
   apt-get install libjpeg62

#Copy Docker-EntryPoint file to working dir 
COPY ./docker-entrypoint.sh /

#Resolve possible permission issues
RUN chmod -R 0777 /Apps/ProlificsContainer

#Set working dir for the ProlificsContainer
WORKDIR /Apps/ProlificsContainer/PantherDemo

#Expose the required ports
EXPOSE 8080

#Set proweb user 
USER proweb
ENV SMUSER=proweb

#Run docker-entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]
