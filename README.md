### Monero XMRig Docker

[![GitHub Workflow Status (branch)][github-actions-badge]][github-actions-link] 
[![GitHub release](https://img.shields.io/github/release/xmrig/xmrig/all.svg)](https://github.com/xmrig/xmrig/releases) 
[![GitHub Release Date](https://img.shields.io/github/release-date-pre/xmrig/xmrig.svg)](https://github.com/xmrig/xmrig/releases)

Because `servethehome/monero_xmrig` is very outdated.

XMRig Version: `6.16.4`

If a new version for XMRig comes out and you want me to update this docker, feel free to open an issue or do a pull request.  
I will try to update this docker as quickly as possible.

### Usage
* `$username` - pool username
* `$pool` - pool address (with protocol, like `stratum+tcp://`)
* `$threads` - Number of threads to mine with (recommended is `vCPU / 2`)
* `$donate` - percentage of hash to donate to devs (not me)
* `$password` - optional for most pools
* `$coin` - which coin to mine
* `$algo` - which algorithm to mine
* `$VERSION` - XMRig version to use

#### Mine specific coin
```
docker run -ti --rm \
  -e username=$username \
  -e xmrpool=$pool \
  -e numthreads=$threads \
  -e startport=$port \
  -e donate=$donate \
  -e coin=$coin \
  -e VERSION=$VERSION \
  ghcr.io/rblaine95/monero_xmrig
```
#### Mine specific algorithm
```
docker run -ti --rm \
  -e username=$username \
  -e xmrpool=$pool \
  -e numthreads=$threads \
  -e startport=$port \
  -e donate=$donate \
  -e algo=$algo \
  -e VERSION=$VERSION \
  ghcr.io/rblaine95/monero_xmrig
```

### Variable Defaults
* `$threads` - output of `nproc / 2`
* `$port` - `3333`
* `$xmrpool` - `stratum+tcp://pool.supportxmr.com`
* `$password` - `docker`
* `$donate` - `5`
* `$coin` - `monero`
* `$algo` - `null`
* `$VERSION` - Current XMRig version listed above

[github-actions-badge]: https://img.shields.io/github/workflow/status/rblaine95/docker_monero_xmrig/dockerbuild/master "Github Workflow Status (master)"
[github-actions-link]: https://github.com/rblaine95/docker_monero_xmrig/actions?query=workflow%3Adockerbuild
