#!/bin/bash

# NueXini

if [ -z "${1}" ]; then
	echo "Please input configuration!"
	exit 1
else
	cfg=`find ./feeds/x/rom/lede/ -maxdepth 1 -type f -name 'config.*' | grep ${1} | grep -Ev 'ext4fs|nosymbol'`
fi

device=`grep '^CONFIG_TARGET.*DEVICE.*=y' .config | sed -r 's/.*DEVICE_(.*)=y/\1/'`
[ -z ${device} ] && { echo "Invaild!"; exit 1; }
mk_a=`cat ${cfg} | grep ${device}=\" | cut -d '"' -f 2`
[ -z ${mk_a} ] && { echo "Invaild!"; exit 1; }

for i in ${mk_a}; do
	echo $i | grep -qE '^luci-app|^luci-i18n|^luci-theme' && continue
	sed -i "/CONFIG_PACKAGE_${i}/d" .config
	echo "CONFIG_PACKAGE_${i}=y" >> .config
done

noneed="luci-theme-bootstrap luci-theme-openwrt-2020 \
	luci-app-wizard luci-app-autoreboot"
for a in ${noneed}; do
	sed -i "/CONFIG_PACKAGE_${a}/d" .config
	echo "CONFIG_PACKAGE_${a}=n" >> .config
done

need="luci-app-argon-config luci-app-disableipv6 luci-app-easymesh luci-app-filetransfer \
	luci-app-openvpn luci-app-ramfree luci-app-socat luci-app-sqm \
	luci-app-tencentddns luci-app-upnp luci-app-vlmcsd luci-app-zerotier \
	ddns-scripts-cloudflare ddns-scripts-dnspod ddns-scripts_aliyun"
for b in ${need}; do
	sed -i "/CONFIG_PACKAGE_${b}/d" .config
	echo "CONFIG_PACKAGE_${b}=y" >> .config
done

bash feeds/x/rom/lede/fix-config.sh

sed -i 's/=m/=n/g' .config
sed -i 's/CONFIG_SDK=y/CONFIG_SDK=n/g' .config
sed -i 's/CONFIG_LUCI_LANG_en=y/CONFIG_LUCI_LANG_en=n/g' .config
sed -i 's/BLOCK_SIZE=256/BLOCK_SIZE=512/g' .config

echo '==[make menuconfig done]=='
