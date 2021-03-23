#Setting the base OS
FROM ubuntu

#Name of Creator
LABEL Author="Panther Support"
LABEL Corporation="Prolifics Inc."


#Setup lib
WORKDIR /usr/lib64
RUN apt-get update  &&\   
    apt-get install libjpeg62 
RUN apt-get install -y libxm4

#Setting up JDK
RUN mkdir -p /Apps/ProlificsContainer
WORKDIR /Apps/ProlificsContainer
# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;
ENV SMJAVALIBRARY=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/libjvm.so


# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
ENV SMJAVALIBRARY=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/libjvm.so

#Configuring Panther Servlet
RUN useradd -ms /bin/bash prolifics
ENV HOME=/home/prolifics
RUN mkdir -p ${HOME}/ini
RUN chmod -R 0777 /home

#Unpacking Panther
RUN mkdir -p /Apps/ProlificsContainer/prlstdwb553.07
COPY prlstdwb553.07 /Apps/ProlificsContainer/prlstdwb553.07

#Unpacking Panther and creating space for logs
RUN mkdir -p /Apps/ProlificsContainer/TestMigration
# COPY migration /Apps/ProlificsContainer/TestMigration
# RUN mkdir -p /Apps/ProlificsContainer/TestMigration/UI
# COPY UI /Apps/ProlificsContainer/TestMigration/UI
RUN mkdir -p /Apps/ProlificsContainer/TestMigration/error
# RUN mkdir -p /Apps/ProlificsContainer/TestMigration/web


#Setting up environment for Panther Web
ENV SMBASE=/Apps/ProlificsContainer/prlstdwb553.07
ENV PATH=$SMBASE/util:$SMBASE/config:${CATALINA_HOME}/bin
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
USER prolifics
ENV SMUSER=prolifics

ENTRYPOINT ["/docker-entrypoint.sh"]

#Copyright © 2021 Prolifics Inc. All Rights Reserved.
