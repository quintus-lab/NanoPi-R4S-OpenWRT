#!/bin/bash
clear

#Update feed
./scripts/feeds update -a && ./scripts/feeds install -a

#patch jsonc
patch -p1 < ../patches/0000-use_json_object_new_int64.patch

#dnsmasq aaaa filter
patch -p1 < ../patches/1001-dnsmasq_add_filter_aaaa_option.patch

#Fullcone-rollback fw3
#rm -rf ./package/network/config/firewall
#svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/network/config/firewall package/network/config/firewall

#Fullcone-Patch Kernel
pushd target/linux/generic/hack-5.4
wget https://github.com/coolsnowwolf/lede/raw/master/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch
popd
#Fullcone-Patch FireWall enable fullcone
mkdir package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/fullconenat.patch
#Fullcone-Patch LuCI add fullcone button
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | git apply
popd
#Fullcone-fullconenat module
cp -rf ../patches/fullconenat ./package/network/fullconenat
#Fullcone-end

#SFE-kernel patch
pushd target/linux/generic/hack-5.4
wget https://github.com/coolsnowwolf/lede/raw/master/target/linux/generic/hack-5.4/953-net-patch-linux-kernel-to-support-shortcut-fe.patch
popd
#SFE-Patch FireWall for enable SFE
patch -p1 < ../patches/1002-luci-app-firewall_add_sfe_switch.patch
patch -p1 < ../patches/1003-shortcut-fe.patch
#SFE-sfe module
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/shortcut-fe package/lean/shortcut-fe
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/fast-classifier package/lean/fast-classifier
#SFE-end

#Experimental
sed -i '/CRYPTO_DEV_ROCKCHIP/d' ./target/linux/rockchip/armv8/config-5.4
sed -i '/HW_RANDOM_ROCKCHIP/d' ./target/linux/rockchip/armv8/config-5.4
echo '
CONFIG_CRYPTO_DEV_ROCKCHIP=y
CONFIG_HW_RANDOM_ROCKCHIP=y
' >> ./target/linux/rockchip/armv8/config-5.4

#rtl8168 pcie ethernet driver
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/r8168 package/new/r8168
#rtl usb wifi driver
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/rtl8821cu package/ctcgfw/rtl8821cu
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/rtl8812au-ac package/ctcgfw/rtl8812au-ac
#Patch for NanoPi-R4S-support
patch -p1 ../patches/0001-uboot-rockchip-add-NanoPi-R4S-support.patch
patch -p1 ../patches/0002-rockchip-add-NanoPi-R4S-support.patch
patch -p1 ../patches/0003-rockchip-fixes-re-boot-with-UHS-cards.patch
patch -p1 ../patches/0004-rockchip-overclock-to-2.2-1.8-GHz-for-NanoPi4-device.patch
patch -p1 ../patches/0005-rockchip-use-vendor-driver-for-NanoPi-R4S.patch

#Change Cryptodev-linux
rm -rf ./package/kernel/cryptodev-linux
svn co https://github.com/project-openwrt/openwrt/trunk/package/kernel/cryptodev-linux package/kernel/cryptodev-linux


#update curl
rm -rf ./package/network/utils/curl
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/network/utils/curl package/network/utils/curl

exit 0