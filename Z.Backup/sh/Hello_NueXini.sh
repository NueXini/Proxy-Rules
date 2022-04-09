#!/bin/bash

sed -i 's#mirror2.openwrt.org/sources#github.com/NueXini/Update_NueXini_Packages/raw/master/other#g' scripts/download.pl

#sed -i '$a src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default
echo 'src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' >> feeds.conf.default

sed -i 's/192.168.1.*.1/192.168.3.1/g' package/base-files/files/bin/config_generate

sed -i 's/%R/NueXini/g' package/base-files/files/etc/openwrt_release

sed -i 's,0.openwrt.pool.ntp.org,time1.cloud.tencent.com,g' package/base-files/files/bin/config_generate
sed -i 's,1.openwrt.pool.ntp.org,ntp1.aliyun.com,g' package/base-files/files/bin/config_generate
sed -i 's,2.openwrt.pool.ntp.org,ntp.ntsc.ac.cn,g' package/base-files/files/bin/config_generate
sed -i 's,3.openwrt.pool.ntp.org,cn.ntp.org.cn,g' package/base-files/files/bin/config_generate

