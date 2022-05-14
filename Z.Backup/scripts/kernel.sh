#!/bin/bash

# NueXini

echo "============================Kenel Patch============================"

sed -i "s/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=$1/g" ./target/linux/*/Makefile

NX_MT7621_File = "./target/linux/ramips/mt7621/config-$1"

if [ -f ${NX_MT7621_File} ]; then	
	echo "CONFIG_MT753X_GSW=y" >> ${NX_MT7621_File}
	echo "CONFIG_NET_RALINK_GSW_MT7621=y" >> ${NX_MT7621_File}
	
	cat ${NX_MT7621_File}
	
fi

echo "----------------------------Kenel Patch----------------------------"

