#!/bin/bash
# NueXini

# dnsmasq: add filter-aaaa option
cp -f $GITHUB_WORKSPACE/Z.Backup/patches/910-dnsmasq-mini-ttl.patch ./package/network/services/dnsmasq/patches/
patch -p0 ./package/network/services/dnsmasq/files/dnsmasq.init $GITHUB_WORKSPACE/Z.Backup/patches/dnsmasq.init.patch

echo '==============[dnsmasq.init]=============='
sed -n '933,939p' ./package/network/services/dnsmasq/files/dnsmasq.init
echo '--------------[dnsmasq.init]--------------'

