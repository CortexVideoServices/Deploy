FROM ubuntu:20.04

RUN apt update \
   && apt upgrade -y

RUN apt install -y git

RUN apt install -y python3.8-minimal python3-pip python3-wheel

RUN pip3 install --upgrade pip \
   && cd /usr/local/bin \
   && ln -s /usr/bin/python3 python
