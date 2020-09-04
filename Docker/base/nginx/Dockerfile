FROM ubuntu:20.04

RUN apt update \
   && apt upgrade -y

RUN apt-get install -y nginx \
  && echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
  && chown -R www-data:www-data /var/lib/nginx

# WORKDIR /etc/nginx
# CMD ["nginx"]