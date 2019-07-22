# What is Panther?
Panther is a RAD platform that enables the development of mobile, web and desktop applications.
For more information on Panther components, please visit https://www.prolifics.com/jampanther-tools

### Usage

* Panther Web 5.5*

# Prerequisites (Required):

  * Docker Environment
  * Panther 5.5*
  * Download jdk(select version which is suitable, this dockerfile has 8u192) from here: https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
  * Redhat system
  * Tomcat is zipped(please unzip it)
  * TestMigration is zipped(please unzip it)
  * lynx.rpm (character mode browser, suited for linux systems)

  * docker-entrypoint.sh ( keeps catalina and Panther App running)
  
 # Prerequisite (Optional)
   Enable port 8080 from your host machine so that you can check your URL outside the host machine also.
    
 # Download the Panther image using the following command:
   docker pull prolificspanther/pantherweb  
   
 # Contents of the container:

 * JDK 1.8
 * Red Hat
 * Panther Web 552.06 (License Inclusive)
 * Tomcat (Completely configured)
 * Panther Servlet
 * ini file for Panther Web (Completely configured)
 
 # How to use this Image
   This image is designed to be used in your Panther Web Enviroment in your Redhat server. Installing a Panther Web Docker image should take less than 10 minutes to setup. Once complete you will be able run our sample testcases.
 
* Creating the container:

  docker run --name=pantherweb -p8080:8080 -d prolificspanther/pantherweb

* Enter the container(To be used in non-UI base OS & for migrating the screens):

  docker exec -ti pantherweb bash

* Test our Samples(already packed in image):
  
  ### For Non-UI base:
  
  * Run prodev: "prodev" (Without Quotes)

  * Run proweb:
  
  lynx localhost:8080/PantherDemo/login
  OR
  lynx localhost:8080/PantherDemo/orders
  OR
  lynx localhost:8080/PantherDemo/customer
  
 * Run the migration utility(Do this from a separate maximized Terminal) : java -jar migration.jar

* Please access the following URL from an OS with UI enabled:

(IP):8080/PantherDemo/PantherDemo/(screen_name_you_ran_the_migration_utility_on)

Note: This will only work if you've enabled port 8080 on your host system to communicate externally.

### For base OS with UI:

* For prodev: Just run "prodev" (without double quotes)

* For accessing the Panther screens using proweb:

  Call the URL from the browser:

  localhost:8080/PantherDemo/PantherDemo/login

  OR

  localhost:8080/PantherDemo/PantherDemo/orders

  OR

  localhost:8080/PantherDemo/PantherDemo/customer

 * Run the migration utility(Do this from a Terminal):
   java -jar migration.jar

 Recall the URL with the screen name that you ran the migration utility on the browser to see the changes


# To access the image from Openshift:
1) Create a Project
2) Click on Deploy an image
3) Search for "prolificspanther/pantherweb", specify the name.
4) Click "Deploy".
5) Go to the Pods section, as soon as it changes from "Creating container to Running", enter into the Pod and switch to "Terminal" tab.
6) Run the command( to test prodev):
Run the command "prodev"
 
7) Run the command( to test proweb):

lynx localhost:8080/PantherDemo/PantherDemo/login

OR

lynx localhost:8080/PantherDemo/PantherDemo/orders

OR

lynx localhost:8080/PantherDemo/PantherDemo/customer

## Issues
If you face any kind of issues with this image, report them [here](https://github.com/ProlificsPanther/Docker-Panther/issues)

## Contribution

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/ProlificsPanther/Docker-Panther/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.


Need a Panther Web 552 Redhat Image? [Click Here](https://hub.docker.com/r/prolificspanther/pantherweb)

[Click Here](https://www.prolifics.com/panther-trial-license-request) for a 45 day license.

How to setup a Panther Servlet Web Application? [Click Here](https://github.com/ProlificsPanther/PantherWeb/releases)
