#!/bin/bash
# NueXini

# dnsmasq: add filter-aaaa option
cp -f $GITHUB_WORKSPACE/Z.Backup/patches/911-dnsmasq-filter-aaaa.patch ./package/network/services/dnsmasq/patches/
patch -p0 ./package/network/services/dnsmasq/files/dnsmasq.init $GITHUB_WORKSPACE/Z.Backup/patches/20220605-add-filter-aaaa.patch

