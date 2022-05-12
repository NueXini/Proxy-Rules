#!/bin/bash

# NueXini

sed -i "s/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=$1/g" ./target/linux/*/Makefile

