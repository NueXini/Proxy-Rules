#!/bin/bash
# NueXini

# dnsmasq: add filter-aaaa option
cp -f $GITHUB_WORKSPACE/Z.Backup/patches/900-dnsmasq-filter-aaaa.patch ./package/network/services/dnsmasq/patches/
patch -p0 ./package/network/services/dnsmasq/files/dnsmasq.init $GITHUB_WORKSPACE/Z.Backup/patches/dnsmasq.init.patch

echo '==============[dnsmasq.init]=============='
sed -n '933,943p' ./package/network/services/dnsmasq/files/dnsmasq.init
echo '--------------[dnsmasq.init]--------------'

patch -p0 ./target/linux/ramips/image/mt7620.mk $GITHUB_WORKSPACE/Z.Backup/patches/mt7620.mk.patch
echo '==============[mt7620.mk]=============='
sed -n '1270,1290p' ./target/linux/ramips/image/mt7620.mk
echo '--------------[mt7620.mk]--------------'

