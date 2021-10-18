#!/bin/bash

docker run --name dockerjenkins \
-p 6089:8080 \
-p 50000:50000 \
#--net dockermysqlnet \
-v `pwd`/jenkins_home:/var/jenkins_home \
-v `pwd`/script:/var/script \
-v `pwd`/..:/var/workspaces \
-e LOCAL_WORKSPACE_DIR=/var/workspaces \
-e LOCAL_SCRIPT_DIR=/var/script \
--restart="always" \
-d \
--privileged \
dockerjenkins
