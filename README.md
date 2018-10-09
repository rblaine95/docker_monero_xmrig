### Monero XMRig Docker

[![Docker Repository on Quay](https://quay.io/repository/rblaine95/monero_xmrig/status "Docker Repository on Quay")](https://quay.io/repository/rblaine95/monero_xmrig)  [![Docker Build Status](https://img.shields.io/docker/build/rblaine/monero_xmrig.svg)](https://hub.docker.com/r/rblaine/monero_xmrig/)  

Because `servethehome/monero_xmrig` is using outdated Ubuntu and doesn't support Cryptonight V7

XMRig Version: `2.8.1`

If a new version for XMRig comes out and you want me to update this docker, feel free to open an issue or do a pull request.  
I will try to update this docker as quickly as possible.

### Usage
* `$username` - pool username
* `$pool` - pool address (without `stratum+tcp://`)
* `$threads` - optimal cryptonight v7 thread count is `L3 cache/2048`
* `$donate` - percentage of hash to donate to devs (not me)
* `$password` - optional for most pools
* `$VERSION` - XMRig version to use

```
docker run -ti --rm \
  -e username=$username \
  -e xmrpool=$pool \
  -e numthreads=$threads \
  -e startport=$port \
  -e donate=$donate \
  -e VERSION=$VERSION \
  rblaine/monero_xmrig
```
#### Deploy onto an OpenShift Cluster
```
oc adm policy add-scc-to-user anyuid -z miner-sa
oc new-app -f template.yaml \
  -p USER=$username \
  -p PASS=$password \
  -p XMR_POOL=$pool \
  -p THREADS=$threads \
  -p DONATE=$donate \
  -p PORT=$port \
  -p VERSION=$version \
  -p REPLICAS=$replicas
```

### Variable Defaults
* `$threads` - output of `L3 cache/2048`
* `$port` - `8100`
* `$xmrpool` - `xmr-usa.dwarfpool.com`
* `$password` - `x`
* `$donate` - `5`
* `$VERSION` - Current XMRig version listed above
