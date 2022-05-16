#!/bin/bash

# NueXini

echo '==========Star to use Patch=========='

wget -O ./target/linux/ramips/dts/mt7621_xiaomi_mi-router-3g.dts -q --no-check-certificate https://raw.githubusercontent.com/x-wrt/x-wrt/22.02_b202203130310/target/linux/ramips/dts/mt7621_xiaomi_mi-router-3g.dts

cat ./target/linux/ramips/dts/mt7621_xiaomi_mi-router-3g.dts

echo '----------End to use Patch-----------'
