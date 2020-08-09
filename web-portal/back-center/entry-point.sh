#!/bin/sh
echo "GATEWAY_API_URL  为 ${GATEWAY_API_URL}"
echo "CLOUD_EUREKA_URL 为 ${CLOUD_EUREKA_URL}"
sed -i "s#base_server.*#base_server: '${GATEWAY_API_URL}',#g" /usr/share/nginx/html/module/config.js
sed -i "s#eureka_server.*#eureka_server: '${CLOUD_EUREKA_URL}',#g" /usr/share/nginx/html/module/config.js
echo "参数修改完毕，如下所示："
cat /usr/share/nginx/html/module/config.js
echo ""
echo "启动 nginx"
nginx -g "daemon off;"
