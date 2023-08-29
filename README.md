# docker-panther-trial
This Panther Docker file contains required files to run and setup a Panther Web application. It can  be directly pulled from [Docker Hub](https://hub.docker.com/repository/docker/prolificspanther/docker-panther-trial).

### Usage
* Panther Web 5.54
* Base OS: Ubuntu 20.04

# Prerequisites: (Required)
  * Install Docker Engine from  https://docs.docker.com/get-docker/ 
  
  Included in  our container
  * Panther 5.54
  * OpenJDK 8
  * Linux Server(Ubuntu 20.04)
  * Tomcat.zip 
  * docker-entrypoint.sh (keeps Catalina and Panther Application running)
  
 # Prerequisites:  
   Enable an available port like 8080 from your host machine to access the Panther Web application from other clients. Installation of 
    
 # Download the Panther Docker image:
    
   docker push prolificspanther/docker-panther-trial
  
 # Contents of the container:
 * OpenJDK 8
 * Ubuntu 20.04
 * Panther Web 5.54
 * Tomcat (Configured)
 * Panther Servlet
 * PantherDemo.ini file for Panther Web (Configured)
 
 # How to use docker-panther-trial

Before you create a Panther Container, you must have a valid Panther license on the host machine. Just contact support@prolifics.com for a temporary license. Your Docker Container must be able to access that license file. Instructions provided below

### Panther Web
 
**Prerequisites:** Docker engine installed on your Linux server, Panther Web 5.54  installation, Apache-Tomcat
 
Step-1: `docker pull prolificspanther/docker-panther-trial` to pull the Panther image.

Step-2: `docker run --name=panther -v <path of license folder on host  machine>:/Apps/ProlificsContainer/prlstdwb553.07/licenses -p8080:8080 -d prolificspanther/docker-panther-trial` . The run command  will create a Panther container.

Step-3: `docker exec -ti panther bash`

Step-4:  Open the Panther Editor using the command `> prodev`

Step-5:  To Run a sample Panther client application use command `> prorun mgmt (screen name) `           

 

## License

If you have trouble  with the Panther license file, set the license file  in the environment using  the command `export LM_LICENSE_FILE=/Apps/ProlificsContainer/prlstdwb553.07/licenses/license.dat`
NOTE: Do not alter the location of the license file. Once prodev opens you may open the login screen located in screens.lib

For Panther Cloud License, contact support@prolifics.com

[View](https://github.com/ProlificsPanther/DockerPanther/blob/master/SoftwareLicenseAgreement.pdf) license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

## Issues
If you face any issues with this image, report them [here](https://github.com/ProlificsPanther/Docker-Panther/issues)

## Contribution
You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you begin to code, we recommend discussing your plans through a [GitHub issue](https://github.com/ProlificsPanther/Docker-Panther/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

Read our Documentation [here](https://docs.prolifics.com)
