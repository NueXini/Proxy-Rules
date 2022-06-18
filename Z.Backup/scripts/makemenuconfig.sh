#!/bin/bash
# Create By NueXini
echo '#############################
0.List configuration file
1.Xioami Router 3G
2.Xioami Router 3
3.Other
#############################'

read -p "Input your device number: " num
[ -z "${num}" ] && { echo "Please input your device number!"; exit 1; }

R3G="luci-app-aliyundrive-webdav
luci-app-passwall
luci-app-passwall_INCLUDE_ChinaDNS_NG
luci-app-ssr-plus
luci-app-ssr-plus_INCLUDE_ShadowsocksR_Libev_Server
luci-app-ssr-plus_INCLUDE_SagerNet_Core
kmod-usb3"

R3="luci-app-ssr-plus
luci-app-ssr-plus_INCLUDE_SagerNet_Core"

app="
luci-app-argon-config
luci-app-disableipv6
luci-app-easymesh
luci-app-filetransfer
luci-app-openvpn
openvpn-openssl
luci-app-ramfree
luci-app-socat
luci-app-tencentddns
luci-app-upnp
luci-app-vlmcsd
luci-app-zerotier
luci-theme-argon-2102
ddns-scripts-cloudflare
ddns-scripts-dnspod
ddns-scripts_aliyun
dnsmasq_full_dhcpv6
dnsmasq_full_dnssec
dnsmasq_full_ipset
dnsmasq_full_tftp
ethtool"

usb="
luci-app-aria2
webui-aria2
luci-app-ksmbd
luci-app-hd-idle
luci-app-p910nd
p910nd-helper
luci-app-usb-printer
kmod-usb-net-cdc-eem
kmod-usb-net-cdc-ether
kmod-usb-net-cdc-mbim
kmod-usb-net-cdc-ncm
kmod-usb-net-cdc-subset
kmod-usb-net-huawei-cdc-ncm
kmod-usb-net-ipheth
kmod-usb-net-qmi-wwan
kmod-usb-net-rndis
kmod-usb-net-sierrawireless
kmod-usb-serial-option
kmod-usb-serial-qualcomm
kmod-usb-serial-sierrawireless
kmod-usb-serial-wwan
kmod-usb-ohci
kmod-usb-uhci
kmod-usb-ehci
kmod-usb-storage
kmod-usb-storage-extras
kmod-usb-storage-uas
kmod-scsi-core
kmod-usb2
luci-proto-mbim
luci-proto-ncm
luci-proto-qmi
kmod-exfat-linux
kmod-fs-autofs4
kmod-fs-ext4
kmod-fs-msdos
kmod-fs-nfs
kmod-fs-nfs-common
kmod-fs-nfs-common-rpcsec
kmod-fs-nfs-v4
kmod-fs-ntfs3
kmod-fs-ntfs3-oot
kmod-fs-vfat
kmod-fuse
blockd
block-mount
usbutils
nfs-utils
kmod-nls-cp437
kmod-nls-iso8859-1
kmod-nls-utf8"

noneed="luci-app-sqm
luci-app-wizard
luci-theme-bootstrap
luci-theme-openwrt-2020
nft-qos
luci-app-autoreboot
kmod-wireguard"

case "$num" in
	0)
	find ./feeds/x/rom/lede/ -maxdepth 1 -type f -name 'config.*' && exit 0
	;;
	1)
	apps=${R3G}${app}${usb}
	;;
	2)
	apps=${R3}${app}${usb}
	;;
	*)
	apps=${app}
esac

bash feeds/x/rom/lede/fix-config.sh

sed -i 's/=m/=n/g' .config
sed -i 's/CONFIG_SDK=y/CONFIG_SDK=n/g' .config
sed -i 's/CONFIG_LUCI_LANG_en=y/CONFIG_LUCI_LANG_en=n/g' .config
sed -i 's/BLOCK_SIZE=256/BLOCK_SIZE=512/g' .config

for i in $apps; do
	sed -i "/CONFIG_PACKAGE_${i}/d" .config
	echo "CONFIG_PACKAGE_${i}=y" >> .config
done

for n in $noneed; do
	sed -i "/CONFIG_PACKAGE_${n}/d" .config
	echo "CONFIG_PACKAGE_${n}=n" >> .config
done

echo '==[make menuconfig done]=='

