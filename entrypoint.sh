#!/bin/sh

sysctl vm.nr_hugepages=128

if [ -z "$numthreads" ]; then
    echo "\$numthreads is empty"
    numthreads=$(expr $(nproc) / 2)
else
    echo "\$numthreads is NOT empty"
fi
echo "     Using --- $numthreads"

if [ -z "$startport" ] ;then
    echo "\$startport is empty"
    startport=3333
else
    echo "\$startport is NOT empty"
fi
echo "     Using --- $startport"

if [ -z "$xmrpool" ]; then
    echo "\$xmrpool is empty"
    xmrpool=pool.supportxmr.com
else
    echo "\$xmrpool is NOT empty"
fi
echo "     Using --- $xmrpool"

if [ -z "$password" ]; then
    echo "\$password is empty"
    password=docker
    echo "     Using --- $password"
else
    echo "\$password is NOT empty"
fi

if [ -z "$donate" ]; then
    echo "\$donate is empty"
    donate=5
else
    echo "\$donate is NOT empty"
fi
echo "     Using --- $donate"

if [ -z "$coin" ]; then
    echo "\$coin is empty"
    coin=monero
else
    echo "\$coin is NOT empty"
fi
echo "     Using --- $coin"

git clone https://github.com/xmrig/xmrig.git
cd xmrig
git checkout v$VERSION
sed -i -e 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' src/donate.h
mkdir build
cd build
cmake ..
make -j$(nproc)
#./xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $email -t $numthreads
echo -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads --donate-level=$donate $OPTIONS
./xmrig -o stratum+tcp://$xmrpool:$startport \
  -u $username \
  -p $password \
  -t $numthreads \
  --coin=$coin \
  --donate-level=$donate \
  $OPTIONS
