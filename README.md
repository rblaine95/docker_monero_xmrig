### Monero XMRig Docker
Because `servethehome/monero_xmrig` is using outdated Ubuntu and doesn't support Cryptonight V7

### Usage
* `$username` - pool username
* `$pool` - pool address (without `stratum+tcp://`)
* `$threads` - optimal cryptonight v7 thread count is `L3 cache/4096`
* `$donate` - percentage of hash to donate to devs (not me)
* `$password` - optional for most pools

```
docker run -ti --rm \
  -e username=$username \
  -e xmrpool=$pool \
  -e numthreads=$threads \
  -e startport=$port \
  rblaine/monero-xmrig
```

### Variable Defaults
* `$threads` - output of `L3 cache/4096`
* `$port` - `8100`
* `$xmrpool` - `xmr-usa.dwarfpool.com`
* `$password` - `x`
* `$donate` - `5`
