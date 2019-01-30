FROM alpine

ENV VERSION 2.10.0

RUN apk update && \
    apk add git make g++ cmake \
        libuv-dev libmicrohttpd-dev openssl-dev --no-cache && \
    rm -rf /var/cache/apk/

COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
