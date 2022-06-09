#!/bin/bash

# NueXini

if [ -z "${1}" ]; then
	read -p "configuration: " cfg
	[ -z "${cfg}" ] && { echo "Please input configuration!"; exit 1; }
	read -p "device: " device
	[ -z "${device}" ] && { echo "Please input device!"; exit 1; }
else
	cfg="${1}"
	device="${2}"
fi

mk_a=`cat ${cfg} | grep ${device}=\" | cut -d '"' -f 2`
[ -z ${mk_a} ] && { echo "Invaild!"; exit 1; }

bash feeds/x/rom/lede/fix-config.sh

for i in ${mk_a}; do
	echo $i | grep -q '^luci' && continue
	sed -i "/${i}/d" .config
	echo "CONFIG_PACKAGE_${i}=y" >> .config
done

echo '==[make menuconfig done]=='
