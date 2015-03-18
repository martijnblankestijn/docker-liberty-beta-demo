#!/usr/bin/env bash
docker build -t app .
docker run -d -p 80:9080 -p 443:9443 app
