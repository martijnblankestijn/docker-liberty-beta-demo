#!/usr/bin/env bash
# -d     : keep the container running and return the prompt
# --name : for linking to this container
# zhil...: name of the image to use
docker run -d -P --name h2database zhilvis/h2-db
