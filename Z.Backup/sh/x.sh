#!/bin/bash
# Create By NueXini

CONFIG_VERSION_NUMBER_NX=$(cat feeds/x/rom/lede/config.ramips-mt7621 | grep  'CONFIG_VERSION_NUMBER' | cut -d '"' -f 2)
sed -i "s/CONFIG_VERSION_NUMBER=\".*\"/CONFIG_VERSION_NUMBER=\"$CONFIG_VERSION_NUMBER_NX\"/" .config

CONFIG_VERSION_CODE_NX=$(cat feeds/x/rom/lede/config.ramips-mt7621 | grep  'CONFIG_VERSION_CODE=' | cut -d '"' -f 2)
sed -i "s/CONFIG_VERSION_CODE=\".*\"/CONFIG_VERSION_CODE=\"$CONFIG_VERSION_CODE_NX\"/" .config

sed -i "s/CONFIG_KERNEL_BUILD_USER=\".*\"/CONFIG_KERNEL_BUILD_USER=\"NueXini\"/" .config

cp -f $GITHUB_WORKSPACE/Z.Backup/other/A/x.banner package/base-files/files/etc/banner

sed -i 's,192.168.15,192.168.3,g' feeds/x/natflow/files/natflow.config

sed -i 's#/bootstrap#/argon#g' feeds/x/base-config-setting/files/uci.defaults

# sed -i '/admin\/initsetup/d' feeds/luci/modules/luci-base/luasrc/dispatcher.lua
sed -i 's?fs.access(\"/etc/config/wizard\") and ??g' feeds/luci/modules/luci-base/luasrc/dispatcher.lua
sed -i 's,admin/initsetup,admin/status/overview,g' feeds/luci/modules/luci-base/luasrc/dispatcher.lua

# sed -i 's/-hidden//g' feeds/luci/applications/luci-app-opkg/root/usr/share/luci/menu.d/luci-app-opkg.json
# sed -i 's/-hidden//g' feeds/luci/modules/luci-mod-system/root/usr/share/luci/menu.d/luci-mod-system.json
# sed -i 's/-hidden//g' feeds/luci/modules/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json

sed -i "s#luci.main.lang='auto'#luci.main.lang='zh_cn'#g" feeds/x/base-config-setting/files/uci.defaults

# sed -i "s#anon_mount='0'#anon_mount='1'#g" feeds/x/base-config-setting/files/uci.defaults

sed -i "s#PasswordAuth='off'#PasswordAuth='on'#g" feeds/x/base-config-setting/files/uci.defaults
sed -i "s#RootPasswordAuth='off'#RootPasswordAuth='on'#g" feeds/x/base-config-setting/files/uci.defaults


sed -i '/exit 0/d' feeds/x/base-config-setting/files/uci.defaults
cat $GITHUB_WORKSPACE/Z.Backup/sh/x.defaults.sh | while read line
do
    echo $line >> feeds/x/base-config-setting/files/uci.defaults
done

cd feeds/NueXini_Packages
#curl -s https://raw.githubusercontent.com/NueXini/BuildOpenWrt/master/sh/language_fix.sh | /bin/bash
/bin/bash $GITHUB_WORKSPACE/Z.Backup/sh/language_fix.sh

