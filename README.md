### Monero XMRig Docker

[![Docker Repository on Quay](https://quay.io/repository/rblaine95/monero_xmrig/status "Docker Repository on Quay")](https://quay.io/repository/rblaine95/monero_xmrig) 
[![GitHub release](https://img.shields.io/github/release/xmrig/xmrig/all.svg)](https://github.com/xmrig/xmrig/releases) 
[![GitHub Release Date](https://img.shields.io/github/release-date-pre/xmrig/xmrig.svg)](https://github.com/xmrig/xmrig/releases)

Because `servethehome/monero_xmrig` is using outdated Ubuntu and doesn't support Cryptonight V9

XMRig Version: `5.1.0`

If a new version for XMRig comes out and you want me to update this docker, feel free to open an issue or do a pull request.  
I will try to update this docker as quickly as possible.

### Usage
* `$username` - pool username
* `$pool` - pool address (without `stratum+tcp://`)
* `$threads` - optimal cryptonight v9 thread count is `L3 cache/2048`
* `$donate` - percentage of hash to donate to devs (not me)
* `$password` - optional for most pools
* `$coin` - which coin to mine
* `$VERSION` - XMRig version to use

```
docker run -ti --rm \
  -e username=$username \
  -e xmrpool=$pool \
  -e numthreads=$threads \
  -e startport=$port \
  -e donate=$donate \
  -e coin=$coin \
  -e VERSION=$VERSION \
  quay.io/rblaine95/monero_xmrig
```

### Variable Defaults
* `$threads` - output of `L3 cache/2048`
* `$port` - `8100`
* `$xmrpool` - `xmr-usa.dwarfpool.com`
* `$password` - `x`
* `$donate` - `5`
* `$coin` - `monero`
* `$VERSION` - Current XMRig version listed above
