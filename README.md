# Dockerize PantherClient
A sample dockerfile to dockerize Panther client application. It will help you as a refereance to dockerize your Panther client application. We are also providing built sample docker panther image and can be pull directly using docker pull command from [Docker Hub](https://hub.docker.com/repository/docker/prolificspanther/pantherclient).  

### Usage
* Panther Web 5.5*

# Prerequisites: (Required)
  * Install Docker Engine from  https://docs.docker.com/get-docker/ 
  
  Provided in Container
  * Panther 5.5*
  * docker-entrypoint.sh (Panther App running)
    
 # Downloading the Panther Docker image::
   Use the command  below
   
  docker pull prolificspanther/pantherclient  
   
 # Contents of the container:
 * JDK
 * Ubuntu
 * Panther Web 553.07 (License Inclusive)
 
 # How to use this Image
   This image is designed to run Panther client in Ubuntu based container. 
 
* Creating the container:
  docker run --name=pantherclient -d prolificspanther/pantherclient

* Enter the container:
  docker exec -ti pantherclient bash

* Test our Samples(already packed in image):
  
# To access the image from Openshift:
1) Create a Project
2) Click on Deploy an image
3) Search for "prolificspanther/pantherweb", specify the name.
4) Click "Deploy".
5) Go to the Pods section, as soon as it changes from "Creating container" to "Running", enter into the Pod and switch to "Terminal" tab.
6) Run the command( to test prodev):
Run the command "prodev"
 
## Issues
If you face any kind of issues with this image, report them [here](https://github.com/ProlificsPanther/Docker-Panther/issues)

## Contribution
You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you begin to code, we recommend discussing your plans through a [GitHub issue](https://github.com/ProlificsPanther/Docker-Panther/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

How to set up a Panther Servlet Web Application? [Click Here](https://github.com/ProlificsPanther/PantherWeb/releases "Named link title")

Read our Documentation [here](https://docs.prolifics.com)
