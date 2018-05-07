### Monero XMRig Docker
Because `servethehome/monero_xmrig` is using outdated Ubuntu and doesn't support Cryptonight V7

XMRig Version: `2.6.2`

If a new version for XMRig comes out and you want me to update this docker, feel free to open an issue or do a pull request.  
I will try to update this docker as quickly as possible.

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
