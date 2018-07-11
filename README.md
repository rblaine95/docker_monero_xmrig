### Monero XMRig Docker

[![Docker Repository on Quay](https://quay.io/repository/rblaine95/monero_xmrig/status "Docker Repository on Quay")](https://quay.io/repository/rblaine95/monero_xmrig)  [![Docker Build Status](https://img.shields.io/docker/build/rblaine/monero_xmrig.svg)](https://hub.docker.com/r/rblaine/monero_xmrig/)  

Because `servethehome/monero_xmrig` is using outdated Ubuntu and doesn't support Cryptonight V7

XMRig Version: `2.6.3`

If a new version for XMRig comes out and you want me to update this docker, feel free to open an issue or do a pull request.  
I will try to update this docker as quickly as possible.

### Extended XMRig Options
Added ability to use and OPTIONS to allow user to add additional options for XMRIG
### Options
Some available options.
```
  -a, --algo=ALGO          cryptonight (default) or cryptonight-lite
  -v, --av=N               algorithm variation, 0 auto select
      --cpu-affinity       set process affinity to CPU core(s), mask 0x3 for cores 0 and 1
      --cpu-priority       set process priority (0 idle, 2 normal to 5 highest)
      --no-huge-pages      disable huge pages support
      --variant            algorithm PoW variant
      --user-agent         set custom user-agent string for pool
  -B, --background         run the miner in the background
      --max-cpu-usage=N    maximum CPU usage for automatic threads mode (default 75)
      --safe               safe adjust threads and av settings for current CPU
      --nicehash           enable nicehash/xmrig-proxy support
```

### Usage
* `$username` - pool username
* `$pool` - pool address (without `stratum+tcp://`)
* `$threads` - optimal cryptonight v7 thread count is `L3 cache/2048`
* `$donate` - percentage of hash to donate to devs (not me)
* `$password` - optional for most pools

```
docker run -ti --rm \
  -e username=$username \
  -e xmrpool=$pool \
  -e numthreads=$threads \
  -e startport=$port \
  -e donate=$donate \
  rblaine/monero_xmrig
```

### Variable Defaults
* `$threads` - output of `L3 cache/2048`
* `$port` - `8100`
* `$xmrpool` - `xmr-usa.dwarfpool.com`
* `$password` - `x`
* `$donate` - `5`
