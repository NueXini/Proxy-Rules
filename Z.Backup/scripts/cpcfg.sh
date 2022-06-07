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

