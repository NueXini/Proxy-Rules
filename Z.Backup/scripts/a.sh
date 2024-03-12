#!/bin/bash

# NueXini

####################################################################################################

# luci-app-partexp
git clone --depth=1 -b main https://github.com/sirpdboy/luci-app-partexp
####################################################################################################

# luci-app-unblockneteasemusic-2102
git clone --depth=1 -b js https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic luci-app-unblockneteasemusic-2102
sed -i 's/luci-app-unblockneteasemusic/&-2102/g' ./luci-app-unblockneteasemusic-2102/Makefile
####################################################################################################

# alist
git clone --depth=1 -b master https://github.com/sbwml/openwrt-alist ../openwrt-alist
mv ../openwrt-alist/alist ./
mv ../openwrt-alist/luci-app-alist ./
####################################################################################################

# openwrt-subconverter
git clone https://github.com/tindy2013/openwrt-subconverter --depth=1 ./openwrt-subconverter
####################################################################################################

# luci-app-cloudflarespeedtest
git clone --depth=1 -b main https://github.com/mingxiaoyu/luci-app-cloudflarespeedtest ../luci-app-cloudflarespeedtest
mv ../luci-app-cloudflarespeedtest/applications/luci-app-cloudflarespeedtest ./
####################################################################################################

# luci-app-amlogic
git clone --depth=1 -b main https://github.com/ophub/luci-app-amlogic ../luci-app-amlogic
mv ../luci-app-amlogic/luci-app-amlogic ./
####################################################################################################

# homebridge
git clone https://github.com/shanglanxin/luci-app-homebridge --depth=1 ./luci-app-homebridge
####################################################################################################

# HomeLede
git clone --depth=1 -b master https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng ../feeds-xiaoqingfeng
mv ../feeds-xiaoqingfeng/luci-app-homeredirect ./
mv ../feeds-xiaoqingfeng/luci-app-homeconnect ./
####################################################################################################

# https://github.com/4IceG
git clone --depth=1 -b master https://github.com/4IceG/luci-app-sms-tool ../luci-app-sms-tool
mv ../luci-app-sms-tool/luci-app-sms-tool ./
mv ../luci-app-sms-tool/sms-tool ./

git clone --depth=1 -b main https://github.com/4IceG/luci-app-modemband ../luci-app-modemband
mv ../luci-app-modemband/luci-app-modemband ./
mv ../luci-app-modemband/modemband ./

git clone --depth=1 -b main https://github.com/4IceG/luci-app-3ginfo-lite ../luci-app-3ginfo-lite
mv ../luci-app-3ginfo-lite/luci-app-3ginfo-lite ./
####################################################################################################

# luci-app-v2raya
git clone --depth=1 -b master https://github.com/zxlhhyccc/luci-app-v2raya ./luci-app-v2raya
####################################################################################################

# luci-app-nezha 哪吒监控
git clone --depth=1 -b main https://github.com/Erope/openwrt_nezha ../openwrt_nezha
mv ../openwrt_nezha/luci-app-nezha ./
mv ../openwrt_nezha/openwrt-nezha ./
####################################################################################################

# mosdns
git clone --depth=1 -b master https://github.com/QiuSimons/openwrt-mos ../luci-app-mosdns
mv ../luci-app-mosdns/luci-app-mosdns ./
mv ../luci-app-mosdns/mosdns ./
mv ../luci-app-mosdns/v2ray-geodata ./
mv ../luci-app-mosdns/dat ./

git clone --depth=1 -b v5 https://github.com/sbwml/luci-app-mosdns ../luci-app-mosdns2
mv ../luci-app-mosdns2/luci-app-mosdns ./luci-app-mosdns2
mv ../luci-app-mosdns2/v2dat ./
sed -i 's/luci-app-mosdns/&2/g' ./luci-app-mosdns2/Makefile
####################################################################################################

# luci-app-wrtbwmon
git clone --depth=1 -b master https://github.com/brvphoenix/wrtbwmon ../wrtbwmon
mv ../wrtbwmon/wrtbwmon ./

git clone --depth=1 -b master https://github.com/brvphoenix/luci-app-wrtbwmon ../luci-app-wrtbwmon
mv ../luci-app-wrtbwmon/luci-app-wrtbwmon ./
####################################################################################################

# linkease(易有云)
git clone --depth=1 -b main https://github.com/linkease/openwrt-themedog ../openwrt-themedog
mv ../openwrt-themedog/luci/luci-theme-dog ./luci-theme-dog-1806

git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci ../nas-packages-luci
mv ../nas-packages-luci/luci/* ./

git clone --depth=1 -b master https://github.com/linkease/nas-packages ../nas-packages
mv ../nas-packages/multimedia/ffmpeg-remux ./
mv ../nas-packages/network/services ./
####################################################################################################

# luci-app-cpolar（内网穿透）
git clone --depth=1 -b main https://github.com/probezy/luci-app-cpolar ./luci-app-cpolar
git clone --depth=1 -b main https://github.com/probezy/cpolar-openwrt ../cpolar
mv ../cpolar/cpolar ./
####################################################################################################

# luci-app-store
git clone --depth=1 -b main https://github.com/linkease/istore ../istore
mv ../istore/luci/* ./

git clone --depth=1 -b main https://github.com/linkease/istore-ui ../istore-ui
mv ../istore-ui/app-store-ui ./
####################################################################################################

# aliyundrive-webdav
git clone --depth=1 -b main https://github.com/messense/aliyundrive-webdav ../aliyundrive-webdav
mv ../aliyundrive-webdav/openwrt/* ./
####################################################################################################

# BanAD
git clone --depth=1 -b master https://github.com/rufengsuixing/luci-app-adguardhome
git clone --depth=1 -b main https://github.com/ilxp/luci-app-ikoolproxy
####################################################################################################

# SSR-Plus
git clone --depth=1 -b master https://github.com/fw876/helloworld ../helloworld
mv ../helloworld/* ./
sed -i 's/default y/default n/g' ./luci-app-ssr-plus/Makefile
####################################################################################################

# OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash ../OpenClash
mv ../OpenClash/luci-app-openclash ./
echo 'NueXini 规则,NueXini_basic.ini,https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/Clash/config/NueXini_basic.ini' >./luci-app-openclash/root/usr/share/openclash/res/sub_ini.list
####################################################################################################

# PassWall
git clone --depth=1 -b main https://github.com/xiaorouji/openwrt-passwall ../openwrt-passwall
mv ../openwrt-passwall/luci-app-passwall ./
sed -i 's/default y/default n/g' ./luci-app-passwall/Makefile

git clone --depth=1 -b main https://github.com/xiaorouji/openwrt-passwall2 ../openwrt-passwall2
mv ../openwrt-passwall2/luci-app-passwall2 ./

sed -i 's/default y/default n/g' ./luci-app-passwall2/Makefile
####################################################################################################

# Smartdns
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns
####################################################################################################

# dockerman
git clone --depth=1 -b master https://github.com/lisaac/luci-app-dockerman ../luci-app-dockerman
mv ../luci-app-dockerman/applications/luci-app-dockerman ./

git clone --depth=1 -b master https://github.com/lisaac/luci-app-diskman ../luci-app-diskman
mv ../luci-app-diskman/applications/luci-app-diskman ./
sed -i 's/default y/default n/g' ./luci-app-diskman/Makefile
####################################################################################################

# ttnode(甜糖星愿自动采集插件)
git clone --depth=1 -b master https://github.com/jerrykuku/luci-app-ttnode
####################################################################################################

# Theme-Argon
# svn co https://github.com/jerrykuku/luci-app-argon-config/trunk ./luci-app-argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config -b master --single-branch --depth=1 ./luci-app-argon-config
# rm -rf .svn
# svn co https://github.com/jerrykuku/luci-theme-argon/trunk ./luci-theme-argon-2102
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 --single-branch --depth=1 ./luci-theme-argon-1806
git clone https://github.com/jerrykuku/luci-theme-argon -b master --single-branch --depth=1 ./luci-theme-argon-2102
sed -i 's/luci-theme-argon/luci-theme-argon-2102/g' ./luci-theme-argon-2102/Makefile
ln -s \.\./img/bg1.jpg ./luci-theme-argon-2102/htdocs/luci-static/argon/background/bg1.jpg
####################################################################################################

# luci-theme-neobird
git clone --depth=1 -b main https://github.com/thinktip/luci-theme-neobird ./luci-theme-neobird-1806
####################################################################################################

# luci-theme-purple
git clone --depth=1 -b master https://github.com/rosywrt/luci-theme-purple ../luci-theme-purple
mv ../luci-theme-purple/luci-theme-purple ./luci-theme-purple-1806
####################################################################################################

# theme infinityfreedom
git clone --depth=1 -b master https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom ../luci-theme-infinityfreedom
mv ../luci-theme-infinityfreedom/luci-theme-infinityfreedom ./luci-theme-infinityfreedom-1806
####################################################################################################

# theme edge
git clone --depth=1 -b master https://github.com/kiddin9/luci-theme-edge ./luci-theme-edge-1907
git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge ./luci-theme-edge-1806
####################################################################################################

# IPTV
git clone --depth=1 -b master https://github.com/riverscn/openwrt-iptvhelper ../openwrt-iptvhelper
mv ../openwrt-iptvhelper/iptvhelper ./
mv ../openwrt-iptvhelper/luci-app-iptvhelper ./
####################################################################################################

# EQOS
git clone --depth=1 -b master https://github.com/skyformat99/eqos ./luci-app-eqos
####################################################################################################

# Serverchan
git clone --depth=1 -b master https://github.com/tty228/luci-app-wechatpush
# pushbot
git clone --depth=1 -b master https://github.com/zzsj0928/luci-app-pushbot
####################################################################################################

# OpenAppFilter(luci-app-oaf)
git clone --depth=1 -b master https://github.com/destan19/OpenAppFilter ../OpenAppFilter
mv ../OpenAppFilter/luci-app-oaf ./
mv ../OpenAppFilter/oaf ./
mv ../OpenAppFilter/open-app-filter ./
####################################################################################################

# Speedtest
git clone --depth=1 -b master https://github.com/sirpdboy/netspeedtest ../netspeedtest
mv ../netspeedtest/luci-app-netspeedtest ./
mv ../netspeedtest/homebox ./
####################################################################################################

# luci-app-netdata-cn
git clone --depth=1 -b master https://github.com/sirpdboy/luci-app-netdata ./luci-app-netdata
####################################################################################################

# Tcpdump(抓包)
git clone --depth=1 -b master https://github.com/KFERMercer/luci-app-tcpdump
####################################################################################################

# Modeminfo
git clone --depth=1 -b master https://github.com/koshev-msk/modemfeed ../modemfeed
mv ../modemfeed/luci/applications/* ./
mv ../modemfeed/luci/protocols/* ./
mv ../modemfeed/luci/themes/* ./
####################################################################################################

# airwhu 锐捷
git clone --depth=1 -b master https://github.com/KyleRicardo/luci-app-airwhu ./luci-app-airwhu
####################################################################################################

# Control-weburl
git clone --depth=1 -b master https://github.com/gdck/luci-app-control-weburl
# autotimeset(定时设置)
git clone --depth=1 -b master https://github.com/sirpdboy/luci-app-autotimeset
####################################################################################################

# Tencentddns
git clone --depth=1 -b master https://github.com/msylgj/luci-app-tencentddns
####################################################################################################

git clone --depth=1 -b openwrt-18.06 https://github.com/immortalwrt/packages ../immortalwrt-1806-packages

ls ../immortalwrt-1806-packages

mv ../immortalwrt-1806-packages/net/udp2raw ./
mv ../immortalwrt-1806-packages/net/gost ./
mv ../immortalwrt-1806-packages/net/gowebdav ./
mv ../immortalwrt-1806-packages/utils/cpulimit ./
mv ../immortalwrt-1806-packages/utils/cpulimit-ng ./
mv ../immortalwrt-1806-packages/applications/luci-app-udp2raw ./
mv ../immortalwrt-1806-packages/applications/luci-app-xunlei ./
mv ../immortalwrt-1806-packages/applications/luci-app-gost ./
mv ../immortalwrt-1806-packages/applications/luci-app-gowebdav ./
mv ../immortalwrt-1806-packages/applications/luci-app-cpulimit ./
mv ../immortalwrt-1806-packages/applications/luci-app-unblockneteasemusic-go ./
mv ../immortalwrt-1806-packages/applications/luci-app-unblockneteasemusic ./

####################################################################################################

# Lede/Lean
git clone --depth=1 -b master https://github.com/coolsnowwolf/luci ../lede-luci

ls ../lede-luci

mv -n ../lede-luci/applications/* ./
mv -n ../lede-luci/collections/luci-lib-docker ./
mv -n ../lede-luci/libs/luci-lib-fs ./

cat $GITHUB_WORKSPACE/Z.Backup/list/lede-packages-net.list | while read name; do
    if [ nx"$name" != nx ]; then
        echo 'NueXini-APP-'$name
        mv -n ../lede-luci/net/$name ./
    fi
done

cat $GITHUB_WORKSPACE/Z.Backup/list/lede-packages-libs.list | while read name; do
    if [ nx"$name" != nx ]; then
        echo 'NueXini-APP-'$name
        mv -n ../lede-luci/libs/$name ./
    fi
done

cat $GITHUB_WORKSPACE/Z.Backup/list/lede-packages-multimedia.list | while read name; do
    if [ nx"$name" != nx ]; then
        echo 'NueXini-APP-'$name
        mv -n ../lede-luci/multimedia/$name ./
    fi
done

mv -n ../lede-luci/package/lean ./
mv -n ../lede-luci/devel/go-rice ./

cat $GITHUB_WORKSPACE/Z.Backup/list/trash.list | while read trash; do
    if [ nx"$trash" != nx ]; then
        rm -rf $trash
    fi
done

####################################################################################################

sed -i 's/default y/default n/g' ./luci-app-rclone/Makefile
sed -i 's#wpad-openssl#wpad-basic-wolfssl#g' ./luci-app-easymesh/Makefile
sed -i 's#+strongswan #&+strongswan-mod-openssl #g' ./luci-app-ipsec-vpnd/Makefile

####################################################################################################

# Lienol
git clone --depth=1 -b main https://github.com/Lienol/openwrt-package ../Lienol-openwrt-package

ls ../Lienol-openwrt-package

mv -n ../Lienol-openwrt-package/luci-app-fileassistant ./
mv -n ../Lienol-openwrt-package/luci-app-filebrowser ./
mv -n ../Lienol-openwrt-package/luci-app-control-timewol ./
mv -n ../Lienol-openwrt-package/luci-app-control-webrestriction ./
mv -n ../Lienol-openwrt-package/luci-app-timecontrol ./
mv -n ../Lienol-openwrt-package/luci-app-socat ./

####################################################################################################

####################################################################################################

find -type f | grep -i "Makefile" | while read file; do
    sed -i 's#\.\./\.\./luci.mk#$(TOPDIR)/feeds/luci/luci.mk#g' "$file"
    sed -i 's#\.\./\.\./lang#$(TOPDIR)/feeds/packages/lang#g' "$file"
done

rm -rf LICENSE .gitattributes .gitignore ./.github ./*/.svn ./*/.git

cp -f $GITHUB_WORKSPACE/Z.Backup/patches/packages.README.md ./README.md
