#!/usr/bin/env bash
mvn clean package -q                || { echo "Maven clean package failed, exiting ..."; exit; }
cd workshops && mvn -q docker:build || { echo "Docker build failed, exiting ..."; exit; }
cd -                                || { echo "Changing back to parent directory failed, exiting ..."; exit; }
./run-db.sh                         || { echo "Run the database container failed, exiting ..."; exit; }
./run-wlp.sh                        || { echo "Run the WLP container with application failed, exiting ..."; exit; }
# Give WebSphere Liberty Profile some time to start
WAITTIME=10s
echo "Wait time of ${WAITTIME}"
sleep ${WAITTIME}
IP=`boot2docker ip`                 || { echo "No boot2docker present, have no script yet for anything else then mac os, exiting ..."; exit; }
PORT=`docker port liberty-web 9080/tcp | awk 'BEGIN { FS = ":" } ; { print $2 }'`
mvn -Dcontainer=${IP}:${PORT} -q verify
