FROM ubuntu:20.04

RUN apt update \
   && apt upgrade -y

RUN apt-get install -y nginx \
  && echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
  && chown -R www-data:www-data /var/lib/nginx

ARG SERVERNAME
ENV SERVERNAME ${SERVERNAME}
ARG FULLCHAIN_PEM
ENV FULLCHAIN_PEM ${FULLCHAIN_PEM}
ARG PRIVKEY_PEM
ENV PRIVKEY_PEM ${PRIVKEY_PEM}

COPY common.nginx /etc/nginx/sites-enabled/default

RUN echo "\
    server_name $SERVERNAME;\n\
" >> /etc/nginx/servername
COPY ./ssl_settings.nginx /etc/nginx/ssl_settings
COPY ./log_settings.nginx /etc/nginx/log_settings
COPY ./cvs_settings.nginx /etc/nginx/cvs_settings
RUN echo "" >> /etc/nginx/app_settings

RUN mkdir /etc/nginx/ssl
RUN echo "$FULLCHAIN_PEM" >> /etc/nginx/ssl/fullchain.pem
RUN echo "$PRIVKEY_PEM"  >> /etc/nginx/ssl/privkey.pem
WORKDIR /etc/nginx