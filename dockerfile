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

EXPOSE 8080

#CMD ["/bin/bash" ,"-c" ,"/usr/sbin/service nginx start -g 'daemon off;'"]
#COPY ["start.sh", "/root/start.sh"]
#RUN chmod +x /root/start.sh
#WORKDIR /root
#ENTRYPOINT /root/start.sh
CMD /usr/sbin/nginx -g "daemon off;"
