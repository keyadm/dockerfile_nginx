FROM ubuntu:latest
#maintainer
LABEL maintainer="by kien MM"

ENV NGINX_CONF_PATH=/etc/nginx/conf.d

RUN apt-get update \
    && apt-get install -y nginx

RUN apt-get install -y net-tools \
    nano

RUN touch $NGINX_CONF_PATH/default.conf \
    && chmod -R -f 755 $NGINX_CONF_PATH/default.conf

COPY default.conf $NGINX_CONF_PATH/default.conf

EXPOSE 80

CMD ["/bin/bash" ,"-c" ,"/sbin/ifconfig -a && /sbin/service nginx start && /sbin/service nginx status"]
