FROM ghcr.io/rblaine95/alpine:edge AS builder

ENV VERSION 6.15.1

RUN apk --no-cache --update upgrade && \
    apk --no-cache --update add git make g++ cmake coreutils build-base \
        libuv-dev libmicrohttpd-dev openssl-dev \
        hwloc-dev numactl && \
    rm -rf /var/cache/apk/

RUN git clone https://github.com/xmrig/xmrig.git && \
    cd xmrig && \
    git checkout v$VERSION && \
    sed -i -e 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' src/donate.h && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc)

FROM ghcr.io/rblaine95/alpine:edge

RUN apk --no-cache --update upgrade && \
    apk --no-cache --update add \
        libuv-dev libmicrohttpd-dev \
        openssl-dev hwloc-dev numactl && \
    rm -rf /var/cache/apk/

COPY --from=builder /xmrig/build/xmrig /usr/local/bin/xmrig
COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
