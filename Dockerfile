FROM ubuntu:14.04

MAINTAINER diboanches

ARG APT_FLAGS_COMMON="-y"
ENV http_proxy <ip>
ENV https_proxy <ip> 

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

RUN apt-get update

RUN apt-get install $APT_FLAGS_COMMON mongodb-org

RUN mkdir -p /data/db

RUN echo "bind_ip = 0.0.0.0" >> /etc/mongodb.conf

EXPOSE 27017

CMD "mongod" 
