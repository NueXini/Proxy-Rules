#!/bin/bash

# NueXini

echo "============================Kenel Patch============================"

sed -i "s/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=$1/g" ./target/linux/*/Makefile

NX_MT7621_File="./target/linux/ramips/mt7621/config-$1"

if [ -f ${NX_MT7621_File} ]; then
	echo "CONFIG_MT753X_GSW=y
CONFIG_MIPS_CBPF_JIT=y
CONFIG_OF_NET=y
CONFIG_PCI_MT7621=y
CONFIG_PCI_MT7621_PHY=y
CONFIG_SWCONFIG=y
CONFIG_SWCONFIG_LEDS=y
CONFIG_WEAK_REORDERING_BEYOND_LLSC=y
CONFIG_NET_RALINK_GSW_MT7621=y
CONFIG_NET_RALINK_MDIO=y
CONFIG_NET_RALINK_MDIO_MT7620=y
CONFIG_NET_RALINK_MT7621=y
CONFIG_NET_RALINK_OFFLOAD=y
CONFIG_NET_RALINK_SOC=y
CONFIG_NET_VENDOR_RALINK=y" >> ${NX_MT7621_File}
	
	cat ${NX_MT7621_File}
	
fi

echo "----------------------------Kenel Patch----------------------------"

