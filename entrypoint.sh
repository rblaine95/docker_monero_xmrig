#!/bin/sh

sysctl vm.nr_hugepages=128

if [ -z "$numthreads" ]; then
    echo "\$numthreads is empty"
    cache=$(cat /proc/cpuinfo | grep "cache size" | awk 'NR==1{print $4}')
    numthreads=$(expr $cache / 2048)
else
    echo "\$numthreads is NOT empty"
fi
echo "     Using --- $numthreads"

if [ -z "$startport" ] ;then
    echo "\$startport is empty"
    startport=8100
else
    echo "\$startport is NOT empty"
fi
echo "     Using --- $startport"

if [ -z "$xmrpool" ]; then
    echo "\$xmrpool is empty"
    xmrpool=xmr-usa.dwarfpool.com
else
    echo "\$xmrpool is NOT empty"
fi
echo "     Using --- $xmrpool"

if [ -z "$password" ]; then
    echo "\$password is empty"
    password=x
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
./xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads --donate-level=$donate $OPTIONS
