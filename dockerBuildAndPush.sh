#!/bin/bash

mvn clean package -DskipTests
if [ $? -ne 0 ];then exit 1; fi

docker login --username=poenr@qq.com registry.cn-hangzhou.aliyuncs.com -p wEksbkhs@2019
if [ $? -ne 0 ];then exit 1; fi

cd ./register-center/eureka-server/
mvn docker:build
docker push  registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/eureka-server:latest
cd ../../

cd ./sql
docker build -f dockerfile_auth-center -t registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/auth-center-mysql:latest .
docker push registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/auth-center-mysql:latest

docker build -f dockerfile_user-center -t registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/user-center-mysql:latest .
docker push registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/user-center-mysql:latest

docker build -f dockerfile_log-center -t registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/log-center-mysql:latest .
docker push registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/log-center-mysql:latest
cd ../

cd ./oauth-center/auth-server
mvn docker:build
docker push registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/auth-server:latest
cd ../../

cd ./business-center/user-center
mvn docker:build
docker push registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/user-center:latest
cd ../../

cd ./api-gateway
mvn docker:build
docker push registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/api-gateway:latest
cd ../

cd ./web-portal/back-center
mvn docker:build
docker push registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/back-center:latest
cd ../../

docker pull redis:4.0.14
docker tag redis:4.0.14 registry.cn-hangzhou.aliyuncs.com/pihui/aliyun/ljgk/redis:4.0.14