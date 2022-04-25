#!/bin/bash

#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/+luci-theme-bootstrap //g' feeds/luci/collections/luci/Makefile

sed -i 's/192.168.1.*.1/192.168.3.1/g' feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system/flash.js

# /usr/lib/lua/luci/version.lua
sed -i 's/${3:-LuCI}/NueXini/g' feeds/luci/modules/luci-base/src/mkversion.sh
sed -i 's/${2:-Git}/$(TZ=UTC-18 date "+%Y-%m-%d")/g' feeds/luci/modules/luci-base/src/mkversion.sh

ln -s /usr/bin/upx ./staging_dir/host/bin/upx
ln -s /usr/bin/upx-ucl ./staging_dir/host/bin/upx-ucl

if [ -d "feeds/x" ]; then
	bash $GITHUB_WORKSPACE/Z.Backup/sh/x.sh
fi

