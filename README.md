# Docker containers for WebSphere Liberty


Prerequisites
* Docker installed
* Maven installed

Steps to get it working:

* Make Docker image with IBM JDK 8 and WebSphere Liberty Profile Beta of march/april
* Build the project and the docker container image
* Run the docker container for the h2 database and the WebSphere Liberty Profile server with the application
 
## Docker image JDK 8 / WLP
```
cd docker/websphere-liberty-latest
docker build .
```
This can take a while. When this step is ready you've got a docker container with WebSphere Liberty Profile

## Build the project
```
cd workshops \
  && mvn -q clean package docker:build
```
This will build the project and create the docker image. 

The definition of the container build is in src/main/docker/Dockerfile.
The base is the Docker image with IBM JDK 8 and WLP.
This process configures the container with the specified configuration files.
The server is configured with the server.xml which includes datasource.xml, features.xml and logging.xml.

# Run the container with the databas