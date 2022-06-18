#!/bin/bash

# NueXini

echo '#############################
1.Xioami Router 3
2.Xioami Router 3G
3.p2w_r619ac-128m
~or 7621/7620/ipq40xx and so on
#############################'

read -p "Input your device number: " num
[ -z "${num}" ] && { echo "Please input your device number!"; exit 1; }

case "$num" in
	1)
	cp -f $GITHUB_WORKSPACE/Z.Backup/config/xiaomi_miwifi-r3.config .config
	;;
	2)
	cp -f $GITHUB_WORKSPACE/Z.Backup/config/xiaomi_mi-router-3g.config .config
	;;
	3)
	cp -f $GITHUB_WORKSPACE/Z.Backup/config/p2w_r619ac-128m.config .config
	;;
	*)
	cp `find ./feeds/x/rom/lede/ -maxdepth 1 -type f -name 'config.*' | grep ${num} | grep -Ev 'ext4fs|nosymbol'` .config
esac

