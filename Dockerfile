FROM alpine:3.7
WORKDIR /
RUN  apk update \
  && apk add --no-cache apache2 php7-apache2 php7-mysqli php7-pdo php7-pdo_mysql php7-intl php7-mcrypt php7-mbstring php7-session php7-curl php7-json php7-xml php7-zip php7-tokenizer php7-ctype php7-gd php7-xmlwriter php7-xmlreader php7-dom php7-zlib php7-iconv php7-simplexml openssl openrc unzip \
  && rm -rf /var/cache/apk/* \
  && wget https://download.nextcloud.com/server/releases/nextcloud-12.0.4.zip \
  && unzip nextcloud-12.0.4.zip \
  && rm -f nextcloud-12.0.4.zip \
  && mkdir -p /opt \
  && mv nextcloud /opt/nextcloud \
  && mkdir -p /opt/nextcloud/data \
  && chown -R apache:apache /opt/nextcloud \
  && ln -s  /opt/nextcloud /var/www/localhost/htdocs \
  && mkdir -p /run/apache2
EXPOSE 80
VOLUME /opt/nextcloud
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
