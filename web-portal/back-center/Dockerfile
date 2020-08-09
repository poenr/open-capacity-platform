FROM nginx:1.17.1
LABEL maintainer="kuboard.cn"

ADD ./entry-point.sh /entry-point.sh
RUN chmod +x /entry-point.sh && rm -rf /usr/share/nginx/html

# 创建环境变量的默认内容，防止 sed 脚本出错
ENV GATEWAY_API_URL http://gateway_api_url_not_set/
ENV CLOUD_EUREKA_URL http://cloud_eureka_url_not_set/
ADD ./src/main/view/static /usr/share/nginx/html

EXPOSE 80
CMD ["/entry-point.sh"]
