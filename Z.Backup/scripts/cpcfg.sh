#!/bin/bash

# NueXini

echo '#############################
1.Xioami Router 3
2.Xioami Router 3G
#############################'

read -p "Input your device number: " num

case "$num" in
	1)
	cp -f $GITHUB_WORKSPACE/Z.Backup/config/xiaomi_miwifi-r3.config .config
	;;
	2)
	cp -f $GITHUB_WORKSPACE/Z.Backup/config/xiaomi_mi-router-3g.config .config	
esac

CONFIG_VERSION_NUMBER_NX=$(cat feeds/x/rom/lede/config.ramips-mt7621 | grep  'CONFIG_VERSION_NUMBER' | cut -d '"' -f 2)
CONFIG_VERSION_NUMBER_NX=`echo ${CONFIG_VERSION_NUMBER_NX:0:15}`
sed -i "s/CONFIG_VERSION_NUMBER=\".*\"/CONFIG_VERSION_NUMBER=\"$CONFIG_VERSION_NUMBER_NX\"/" .config

CONFIG_VERSION_CODE_NX=$(cat feeds/x/rom/lede/config.ramips-mt7621 | grep  'CONFIG_VERSION_CODE=' | cut -d '"' -f 2)
sed -i "s/CONFIG_VERSION_CODE=\".*\"/CONFIG_VERSION_CODE=\"$CONFIG_VERSION_CODE_NX\"/" .config

