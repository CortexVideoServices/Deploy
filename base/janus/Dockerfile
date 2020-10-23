FROM debian:sid-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get install -y \
    janus

WORKDIR /etc/janus