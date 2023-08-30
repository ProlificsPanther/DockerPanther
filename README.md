# docker-panther-trial
Our Panther Docker file (Dockerfile) contains the required files to setup and  run a Panther Web application. The image can be pulled directly from [Docker Hub](https://hub.docker.com/repository/docker/prolificspanther/docker-panther-trial).

### Usage
* Panther Web 5.54
* Base OS: Ubuntu 22.04

# Prerequisites: (Required)
* Install Docker Engine from  https://docs.docker.com/get-docker/ 
  
 # Prerequisites:  
   Enable an available port like 8080 from your host machine to access the Panther Web application from other clients.   
   
 # Pull the Panther Docker Image:
   `docker pull prolificspanther/docker-panther-trial`
  
 # Contents of the container:
 * Ubuntu 22.04
 * OpenJDK 8
 * Tomcat  
 * Panther Web 5.54 distributed folder
 * Misc files

# How to use docker-panther-trial
  
  Before you create a Panther Container, you must have a valid Panther license on the host machine. Just contact support@prolifics.com for a temporary license. Your Docker 
  Container must be able to access that license file. Instructions are provided below in the license section.

### Panther Web Docker Image
 
**Prerequisites:** Docker engine installed on your Linux server.
 
Step-1: `docker pull prolificspanther/docker-panther-trial` to pull the Panther Web 5.54 Image.

Step-2: `docker run --name=pantherweb -p8080:8080 -d prolificspanther/docker-panther-trial`  The run command  will create a Panther Web container.

name=pantherweb (name of the container, you can leave it and docker will specify a name by itself but it’s recommended to give a name as it will be required in the next command itself).
-p8080:8080 (first 8080 is the external port which will correspond to your “EXPOSE” command and later 8080 will correspond to the port 8080 which is setup in your Tomcat configuration).
-d (detached) (as we’re not entering the container, we’re just creating it right now).
docker-panther-trial (the name of the image)

Step-3: `docker exec -ti <container-id> /bin/bash` to execute and enter into the container.
exec (Execute)
-ti (Terminal Interactive)
<container-id> (we can check the container-id using the command `docker ps` or `docker container ls -l` command)
/bin/bash (the kind of shell you want to create for entering into the container)

Step-4:  Access sample screen from the browser <Public IP of the machine>:8080/PantherDemo/PantherDemo/greeting     
Note:-  Replace 8080 with the port that you’re using with “-p” in first position.

### Rebuild Panther Web Docker Image

To rebuild the Panther Web Docker Image you may use the included DockerFile.
Required software : Panther Web 5.54 & Apache-Tomcat (included in repo for your convenience)
  
## License

If you have trouble  with the Panther license file, set the license file in the environment using  the command `export LM_LICENSE_FILE=/Apps/ProlificsContainer/prlwb554.07/licenses/license.dat`
NOTE: Do not alter the location of the license file.

For Panther Web 5.54 License, contact support@prolifics.com

[View](https://github.com/ProlificsPanther/DockerPanther/blob/master/SoftwareLicenseAgreement.pdf) license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

## Issues
If you face any issues with this image, report them [here](https://github.com/ProlificsPanther/Docker-Panther/issues)

## Contribution
You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you begin to code, we recommend discussing your plans through a [GitHub issue](https://github.com/ProlificsPanther/Docker-Panther/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

Read our Panther Documentation [here](https://docs.prolifics.com)
