# docker-panther-trial
The Docker file can be used to dockerize  your limited files Panther trial edition. Also included are samples of a Panther Docker image  that can  be pulled directly using the docker pull command from [Docker Hub](https://hub.docker.com/repository/docker/prolificspanther/docker-panther-trial).

### Usage
* Panther Web 5.53
* Base OS: Ubuntu 20.04

# Prerequisites: (Required)
  * Install Docker Engine from  https://docs.docker.com/get-docker/ 
  
  Provided in Container
  * Panther 5.53
  * OpenJDK 8
  * Linux Server(Ubuntu 20.04)
  * Tomcat.zip(included)
  * docker-entrypoint.sh (keeps Catalina and Panther App running)
  
 # Prerequisites: (Optional)
   Enable port 8080 from your host machine to access the Panther Web application from other clients.
    
 # Download the Panther Docker image:
    
   docker push prolificspanther/docker-panther-trial
  
 # Contents of the container:
 * OpenJDK 8
 * Ubuntu 20.04
 * Panther Web 5.53.07 
 * Tomcat (Configured)
 * Panther Servlet
 * PantherDemo.ini file for Panther Web (Configured)
 
 # How to use this docker-panther-trial

You should have a valid Panther license on the host machine. Please contact support@prolifics.com for a temporary license. Your Docker Container must be able to access that license file. Instructions provided below

### Panther in character mode

Step-1: `docker pull prolificspanther/docker-panther-trial`

Step-2: `docker run --name=panther -v <path of license folder on host  machine>:/Apps/ProlificsContainer/prlstdwb553.07/licenses -p8080:8080 -d prolificspanther/docker-panther-trial`

Step-3: `docker exec -ti panther bash`

Step-4: Set the license file using command `export LM_LICENSE_FILE=/Apps/ProlificsContainer/prlstdwb553.07/licenses/license.dat`

Step-5: `Open the Panther Editor using the command > prodev`

Step-6: `To Run a sample Panther client application use command > prorun mgmt (Name of Panther screen) `           

### Panther in motif mode

**Perquisites:** To run panther in motif mode. We have to make sure to install (https://x.cygwin.com/) and start the X Server on your windows machine. Also, connect the Linux machine by enabling SSH>X11(Enable X11 forward and enter host machine IP:0.0) using putty. 

Step-1: This step will same as  character mode
 
Step-2: `docker run --name=panther -ti --net=host -e DISPLAY -v /tmp/.X11-unix -v <path of license folder on host  machine>://Apps/ProlificsContainer/prlstdwb553.07/licenses -d prolificspanther/docker-panther-trial`

Step-3: `Enter command>xauth list
            It will display MIT-MAGIC-COOKIE list as shown in example below. Just copy any one of them.
            Example: ip-your ip/unix:10  MIT-MAGIC-COOKIE-1  83cce042f30c980a97e6799713e9e3f2`

Step-4: `docker exec -ti panther bash`

Step-5: Set the license file using command `export LM_LICENSE_FILE=/Apps/ProlificsContainer/prlstdwb553.07/licenses/license.dat`

Step-6: `Enter command> xauth add < paste MIT- MAGIC-COOKIE  that we copied before> We can verify using xauth list. It will show the same cookie that we just added.`

Step-7: `Open the Panther Editor in motif using the command>prodev_motif` 

Step 8: `To Run a sample Panther client application in motif use command > prorun_motif mgmt (Name of Panther screen)`  

### Panther on Docker Desktop for Windows

**Perquisites:** To run Panther on Windows using Docker Desktop. It will require to install Docker Desktop with WSL(it will install with Docker Desktop) on Windows 10.
Please follow the link to setup [Docker Desktop](https://docs.docker.com/desktop/windows/install/)

Step-1: Open command prompt or Windows PowerShell terminal to pull a docker-panther-trial image using command:
 `docker pull prolificspanther/docker-panther-trial`

Step-2: Open Docker Desktop application using shortcut icon on Windows Desktop and it should show the docker-panther-trial image in image section.

Step-3: To create and run a container click on "Run" button on selecting docker-panther-trial image in image section. It will open a configuration dialogue box.

Step-4:  Name a Container in name section, Local host port to run pantherweb on host machine, 

Step-5: In volume section of dialogue box, we can share a host directory with a container by sharing path of local directory in host path field. Share location of license file on host machine and share location(/Apps/ProlificsContainer/PantherTest/License) to get the directory inside a container in Container path field.

Step-6: Click  on Run button configuration dialogue box. It will create and start your container. It should show your container with status running in container section.

Step-7: Select running  container and click on CLI option. It will open a CLI terminal terminal to run Panther in character mode.

Step-8: Set the license file using command `export LM_LICENSE_FILE=/Apps/ProlificsContainer/prlstdwb553.07/licenses/license.dat`

Step-9: To run prodev enter command> prodev on CLI terminal and to run prorun with sample app by enter the command>prorun mgmt(Name of panther screen).

Step-:10- To run sample pantherweb application on host browser. Click on "Open in browser". it will redirect to windows default browser. Add URL /PantherDemo/PantherDemo/login.

# To access the image from OpenShift

Step-1: Create a Project

Step-2: Click on Deploy an image

Step-3: Enter image name "prolificspanther/docker-panther-trial", specify the name of component.

Step-4: Click "Create".

Step-5: In Pods section, select your Pod it will open a new Pod window.

Step-6: Enter into the Pod by click on its name and switch to "Terminal" tab.

Step-7: Run the command( to test prodev): > "prodev"

Step-8: Run the command (to test sample Panther client app):>prorun mgmt (Name of Panther screen).    

## License

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
