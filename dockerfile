
FROM ubuntu:latest
#maintainer
LABEL maintainer="by kien MM"

ENV NGINX_CONF_PATH=/etc/nginx/conf.d/

RUN apt-get update \
    && apt-get install -y nginx \
    nano \
    iputils-ping \
    net-tools \
    apt-get clean \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN touch $NGINX_CONF_PATH/default.conf \
    && chmod -R -f 755 $NGINX_CONF_PATH/default.conf

ADD https://github.com/keyadm/dockerfile_nginx/blob/main/default $NGINX_CONF_PATH/default.conf
EXPOSE 80
CMD ["/bin/bash", "-c", "service nginx start","service nginx status"]
