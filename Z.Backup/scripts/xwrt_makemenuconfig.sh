#!/bin/bash

# NueXini

if [ -z "${1}" ]; then
	read -p "configuration: " cfg
	[ -z "${cfg}" ] && { echo "Please input configuration!"; exit 1; }
else
	cfg=`find ./feeds/x/rom/lede/ -maxdepth 1 -type f -name 'config.*' | grep ${1} | grep -Ev 'ext4fs|nosymbol'`
fi

device=`grep '^CONFIG_TARGET.*DEVICE.*=y' .config | sed -r 's/.*DEVICE_(.*)=y/\1/'`
[ -z ${device} ] && { echo "Invaild!"; exit 1; }
mk_a=`cat ${cfg} | grep ${device}=\" | cut -d '"' -f 2`
[ -z ${mk_a} ] && { echo "Invaild!"; exit 1; }

bash feeds/x/rom/lede/fix-config.sh

for i in ${mk_a}; do
	echo $i | grep -q '^luci' && continue
	sed -i "/CONFIG_PACKAGE_${i}/d" .config
	echo "CONFIG_PACKAGE_${i}=y" >> .config
done

echo '==[make menuconfig done]=='

