
uci set luci.main.mediaurlbase='/luci-static/argon'
uci set luci.main.lang='zh_cn'
uci commit luci

uci del dhcp.@dnsmasq[0].cachesize
uci set dhcp.@dnsmasq[0].cachesize='1024'
uci set dhcp.@dnsmasq[0].mini_ttl='3600'
# uci set dhcp.@dnsmasq[0].filter_aaaa='1'
uci commit dhcp

uci set dropbear.@dropbear[0].PasswordAuth='on'
uci set dropbear.@dropbear[0].RootPasswordAuth='on'
uci set dropbear.@dropbear[0].Port='22'
uci del dropbear.@dropbear[0].Interface
uci commit dropbear

uci set network.usbwan.mtu='1492'
uci commit network

uci set natcapd.default.peer_sni_ban='1'
uci commit natcapd

sed -i 's/\"services\"/\"network\"/g' /usr/lib/lua/luci/controller/nft-qos.lua
sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-aria2.json
sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-hd-idle.json
sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-minidlna.json
sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-p910nd.json
sed -i 's#admin/services#admin/nas#g' /usr/share/luci/menu.d/luci-app-ksmbd.json
sed -i 's#admin/services#admin/network#g' /usr/share/luci/menu.d/luci-app-fakemesh.json
sed -i 's#admin/system#admin/status#g' /usr/share/luci/menu.d/luci-app-natflow-users.json
sed -i 's#admin/services#admin/system#g' /usr/share/luci/menu.d/luci-app-ttyd.json
sed -i 's/-hidden//g' /usr/share/luci/menu.d/*.json

rm -f /www/luci-static/resources/view/status/include/35_natflow-users.js
rm -f /www/luci-static/resources/view/status/include/40_dhcp.js
rm -f /www/luci-static/resources/view/status/include/50_dsl.js
rm -f /www/luci-static/resources/view/status/include/70_ddns.js
rm -f /www/luci-static/resources/view/status/include/80_minidlna.js
rm -f /www/luci-static/resources/view/status/include/80_upnp.js
rm -f /www/luci-static/resources/view/status/include/90_mwan3.js

ln -sf /sbin/ip /usr/bin/ip

sed -i '/log-facility/d' /etc/dnsmasq.conf
echo "log-facility=/dev/null" >> /etc/dnsmasq.conf

sed -i 's#downloads.openwrt.org#mirrors.cloud.tencent.com/openwrt#g' /etc/opkg/distfeeds.conf
sed -i '/NueXini_Packages/d' /etc/opkg/distfeeds.conf
sed -i "s/# //g" /etc/opkg/distfeeds.conf

sed -i '/option disabled/d' /etc/config/wireless
sed -i '/set wireless.radio${devidx}.disabled/d' /lib/wifi/mac80211.sh
wifi up

# change web luci user to root
sed -i '/^admin/d' /etc/shadow
sed -i '/^admin/d' /etc/passwd
uci set rpcd.@login[0].username='root'
uci set rpcd.@login[0].password='$p$root'
uci commit rpcd

chmod 0755 /etc/init.d/*

rm -rf /tmp/luci-*cache

exit 0

