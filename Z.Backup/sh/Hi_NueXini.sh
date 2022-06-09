#!/bin/bash

# sed -i '$a src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default
# echo 'src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' >> feeds.conf.default

# wget -O ./target/linux/ramips/dts/mt7621_xiaomi_mi-router-3g.dts -q --no-check-certificate https://raw.githubusercontent.com/x-wrt/x-wrt/22.02_b202203130310/target/linux/ramips/dts/mt7621_xiaomi_mi-router-3g.dts

sed -i "s#CONFIG_KERNEL_BUILD_USER=\".*\"#CONFIG_KERNEL_BUILD_USER=\"NueXini\"#" .config
sed -i "s#CONFIG_KERNEL_BUILD_DOMAIN=\".*\"#CONFIG_KERNEL_BUILD_DOMAIN=\"hotmail\.com\"#" .config

sed -i 's/192\.168\.1.*\./192\.168\.3\./g' .config
sed -i 's/192\.168\.1.*\./192\.168\.3\./g' package/base-files/files/bin/config_generate
sed -i 's/192\.168\.1.*\./192\.168\.3\./g' feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system/flash.js

sed -i 's/%R/NueXini/g' package/base-files/files/etc/openwrt_release

sed -i 's,0.openwrt.pool.ntp.org,time1.cloud.tencent.com,g' package/base-files/files/bin/config_generate
sed -i 's,1.openwrt.pool.ntp.org,ntp1.aliyun.com,g' package/base-files/files/bin/config_generate
sed -i 's,2.openwrt.pool.ntp.org,ntp.ntsc.ac.cn,g' package/base-files/files/bin/config_generate
sed -i 's,3.openwrt.pool.ntp.org,cn.ntp.org.cn,g' package/base-files/files/bin/config_generate

sed -i 's/+luci-theme-bootstrap //g' feeds/luci/collections/luci/Makefile
sed -i 's/+luci-theme-bootstrap //g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/+luci-theme-bootstrap //g' feeds/luci/collections/luci-ssl-nginx/Makefile

# /usr/lib/lua/luci/version.lua
sed -i 's/${3:-LuCI}/NueXini/g' feeds/luci/modules/luci-base/src/mkversion.sh
sed -i 's/${2:-Git}/$(TZ=UTC-18 date "+%Y-%m-%d")/g' feeds/luci/modules/luci-base/src/mkversion.sh

ln -sf /usr/bin/upx ./staging_dir/host/bin/upx
ln -sf /usr/bin/upx-ucl ./staging_dir/host/bin/upx-ucl

if [ -d "feeds/x" ]; then
	bash $GITHUB_WORKSPACE/Z.Backup/sh/x.sh
fi

