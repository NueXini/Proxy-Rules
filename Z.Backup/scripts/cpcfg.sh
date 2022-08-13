#!/bin/bash

# NueXini


if [ -z "${1}" ]; then

echo '#############################
1.Xioami Router 3G
~or 7621/7620/ipq40xx and so on
#############################'

	read -p "Input your device number: " num
	[ -z "${num}" ] && { echo "Please input your device number!"; exit 1; }
else
	num=${1}
fi

case "$num" in
	1)
	cp -f $GITHUB_WORKSPACE/Z.Backup/config/xiaomi_mi-router-3g.config .config
	;;
	*)
	cp `find ./feeds/x/rom/lede/ -maxdepth 1 -type f -name 'config.*' | grep ${num} | grep -Ev 'ext4fs|nosymbol'` .config
esac

