#!/usr/bin/env bash
#docker build -t liberty-app .
# Linking, see https://docs.docker.com/userguide/dockerlinks/
# Name of the images comes from the pom.xml
#docker run -d -p 9080:9080 -p 9443:9443 --name liberty-web --link h2database:db liberty-docker-poc
docker run -d -P --name liberty-web --link h2database:db liberty-docker-poc
