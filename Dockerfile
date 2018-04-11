FROM ubuntu:xenial

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install git cmake make libuv1-dev libmicrohttpd-dev build-essential -y

RUN apt-get autoclean && \
    apt-get autoremove

ENV VERSION=2.6.0-beta2

COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
