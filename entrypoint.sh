#!/bin/bash

sysctl vm.nr_hugepages=128

if [ -z "$numthreads" ]
then
      echo "\$numthreads is empty"
      cache=$(cat /proc/cpuinfo | grep "cache size" | awk 'NR==1{print $4}')
      numthreads=$(expr $cache / 4096)
else
      echo "\$numthreads is NOT empty"
fi

if [ -z "$startport" ]
then
      echo "\$startport is empty"
      startport=8100
else
      echo "\$startport is NOT empty"
fi


if [ -z "$xmrpool" ]
then
      echo "\$xmrpool is empty"
      xmrpool=xmr-usa.dwarfpool.com
      echo Using $xmrpool
else
      echo "\$xmrpool is NOT empty"
      echo Using --- $xmrpool
fi

if [ -z "$password" ]
then
      echo "\$password is empty"
      password=x
      echo Using --- $password
else
      echo "\$password is NOT empty"
fi
if [ -z "$donate" ]
then
      echo "\$donate is empty"
      donate=5
      echo Using --- $donate
else
      echo "\$donate is NOT empty"
fi

#wget http://files.linux-bench.com/mine/xmrig.tar.gz
#tar xzvf xmrig.tar.gz
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake ..
make -j$(nproc)
#./xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $email -t $numthreads
echo -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads --donate-level=$donate
./xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads --donate-level=$donate
