#!/usr/bin/env bash
NAME=h2database
CONTAINER=`docker ps --all --filter "name=$NAME" -q`

# Stop and remove the old container
docker stop $CONTAINER && docker rm $CONTAINER

# -d     : keep the container running and return the prompt
# --name : for linking to this container
# zhil...: name of the image to use
docker run -d -P --name $NAME zhilvis/h2-db
