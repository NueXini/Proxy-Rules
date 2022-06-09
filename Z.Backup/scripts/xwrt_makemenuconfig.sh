#!/bin/bash

# NueXini

if [ -z "${1}" ]; then
	read -r -e -p "configuration: " cfg
	read -r -e -p "device: " device
	[ -z "${cfg}" ] && { echo "Please input configuration!"; exit 1; }
	[ -z "${device}" ] && { echo "Please input device!"; exit 1; }
else
	cfg="${1}"
	device="${2}"
fi

mk_a=`cat feeds/x/rom/lede/${cfg} | grep ${device}=\" | cut -d '"' -f 2`

for i in ${mk_a}; do
	echo $i | grep -q '^luci' && continue
	sed -i "/${i}/d" .config
	echo "CONFIG_PACKAGE_${i}=y" >> .config
done

bash feeds/x/rom/lede/fix-config.sh
echo '==[make menuconfig done]=='