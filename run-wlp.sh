#!/usr/bin/env bash
NAME=liberty-web
IMAGE=liberty-docker-poc
CONTAINER=`docker ps --all --filter "name=$NAME" -q`
DB_CONTAINER=h2database

# Stop and remove the old container (if a container was found)
if [ "CONTAINER" ]; then docker stop $CONTAINER && docker rm $CONTAINER; fi

# Linking, see https://docs.docker.com/userguide/dockerlinks/
# Name of the images comes from the pom.xml
#docker run -d -p 9080:9080 -p 9443:9443 --name liberty-web --link h2database:db liberty-docker-poc
docker run -d -P --name ${NAME} --link ${DB_CONTAINER}:db $IMAGE
