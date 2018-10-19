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
    xmrpool=stratum+tcp://pool.supportxmr.com
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

if [ -z "$algo" ]; then
  echo "\$algo is empty"
  if [ -z "$coin" ]; then
      echo "\$coin is empty"
      coin=monero
  else
      echo "\$coin is NOT empty"
  fi
else
  echo "\$algo is NOT empty"
fi

if [ -z "$algo" ]; then echo "     Using --- $coin"; else echo "     Using --- $algo"; fi

if [ -z "$algo" ]; then
  echo -o $xmrpool:$startport -u $username -p $password -t $numthreads --coin=$coin --donate-level=$donate $OPTIONS
  xmrig -o $xmrpool:$startport \
    -u $username \
    -p $password \
    -t $numthreads \
    --coin=$coin \
    --donate-level=$donate \
    $OPTIONS
else
  echo -o $xmrpool:$startport -u $username -p $password -t $numthreads --algo=$algo --donate-level=$donate $OPTIONS
  xmrig -o $xmrpool:$startport \
    -u $username \
    -p $password \
    -t $numthreads \
    --algo=$algo \
    --donate-level=$donate \
    $OPTIONS
fi
