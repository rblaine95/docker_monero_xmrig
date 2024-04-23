FROM docker.io/alpine:3

ENV VERSION 6.21.3

RUN apk --no-cache --update upgrade && \
    apk --no-cache --update add git make g++ cmake coreutils build-base \
        libuv-dev libmicrohttpd-dev openssl-dev \
        hwloc-dev numactl && \
    rm -rf /var/cache/apk/

COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
