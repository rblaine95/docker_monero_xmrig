FROM quay.io/rblaine95/alpine:v3.12

ENV VERSION 6.7.0

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk --no-cache --update upgrade && \
    apk --no-cache --update add git make g++ cmake coreutils build-base \
        libuv-dev libmicrohttpd-dev openssl-dev \
        hwloc-dev@testing numactl@edge && \
    rm -rf /var/cache/apk/

COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
