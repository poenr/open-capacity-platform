#!/bin/bash

mvn clean package -DskipTests
if [ $? -ne 0 ];then exit 1; fi

cd ./register-center/eureka-server/
mvn docker:build
docker push  registry.apps.k8s.software.dc/ljgk/eureka-server:latest
cd ../../

cd ./sql
docker build -f dockerfile_auth-center -t registry.apps.k8s.software.dc/ljgk/auth-center-mysql:latest .
docker push registry.apps.k8s.software.dc/ljgk/auth-center-mysql:latest

docker build -f dockerfile_user-center -t registry.apps.k8s.software.dc/ljgk/user-center-mysql:latest .
docker push registry.apps.k8s.software.dc/ljgk/user-center-mysql:latest

docker build -f dockerfile_log-center -t registry.apps.k8s.software.dc/ljgk/log-center-mysql:latest .
docker push registry.apps.k8s.software.dc/ljgk/log-center-mysql:latest
cd ../

cd ./oauth-center/auth-server
mvn docker:build
docker push registry.apps.k8s.software.dc/ljgk/auth-server:latest
cd ../../

cd ./business-center/user-center
mvn docker:build
docker push registry.apps.k8s.software.dc/ljgk/user-center:latest
cd ../../

cd ./api-gateway
mvn docker:build
docker push registry.apps.k8s.software.dc/ljgk/api-gateway:latest
cd ../

cd ./web-portal/back-center
mvn docker:build
docker push registry.apps.k8s.software.dc/ljgk/back-center:latest
cd ../../
