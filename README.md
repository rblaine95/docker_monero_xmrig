### Monero XMRig Docker
Because servethehome/monero_xmrig is using outdated Ubuntu and doesn't support Cryptonight V7

### Usage
* `$username` - pool username
* `$pool` - pool address (without `stratum+tcp://`)
* `$threads` - to calculate best thread count use this: `cache=$(cat /proc/cpuinfo | grep "cache size" | awk 'NR==1{print $4}') && threads=$(expr $cache / 4096)`
* `$donate` - percentage of hash to donate to devs (not me)
* `$password` - optional for most pools

```
docker run -ti --rm \
  -e username=$username \
  -e xmrpool=$pool \
  -e numthreads=$threads \
  -e startport=$port \
  rblaine/monero_xmrig
```

### Variable Defaults
* `$threads` - output of `$(nproc)`
* `$port` - `8100`
* `$xmrpool` - `xmr-usa.dwarfpool.com`
* `$password` - `x`
* `$donate` - `5`
