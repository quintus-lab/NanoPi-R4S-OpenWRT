#!/bin/bash
#Additional package
#arpbind
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-arpbind package/lean/luci-app-arpbind
#AutoCore
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/autocore package/lean/autocore
#coremark
rm -rf feeds/packages/utils/coremark/
rm -rf package/feeds/packages/coremark
svn co https://github.com/project-openwrt/packages/trunk/utils/coremark feeds/packages/utils/coremark
ln -sf ../../../feeds/packages/utils/coremark ./package/feeds/packages/coremark

#DDNS
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/ddns-scripts_dnspod package/lean/ddns-scripts_aliyun
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/ddns-scripts_aliyun package/lean/ddns-scripts_dnspod

#定时重启
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
#Adbyby
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-adbyby-plus package/lean/luci-app-adbyby-plus
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/adbyby package/lean/adbyby
#gost
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/gost package/ctcgfw/gost
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/luci-app-gost package/ctcgfw/luci-app-gost

#beardropper
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/luci-app-beardropper package/ctcgfw/luci-app-beardropper

#SSRP
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
svn co https://github.com/fw876/helloworld/trunk/tcping package/lean/tcping
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/lean/naiveproxy
svn co https://github.com/fw876/helloworld/trunk/trojan-go package/lean/trojan-go
#patch ssrp for xray trojan
#wget -P package/lean https://patch-diff.githubusercontent.com/raw/fw876/helloworld/pull/295.patch
#wget -P package/lean https://patch-diff.githubusercontent.com/raw/fw876/helloworld/pull/316.patch
#pushd package/lean
#patch -p1 < 295.patch
#patch -p1 < 316.patch
#popd

#SSRP dependences
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/shadowsocksr-libev package/lean/shadowsocksr-libev
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt package/lean/pdnsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/srelay package/lean/srelay
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/lean/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/lean/dns2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/lean/redsocks2
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/proxychains-ng package/lean/proxychains-ng
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/lean/ipt2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs package/lean/simple-obfs
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan package/lean/trojan
svn co https://github.com/project-openwrt/openwrt/trunk/package/lean/tcpping package/lean/tcpping
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/xray package/lean/xray
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/dnsforwarder package/lean/dnsforwarder

#清理内存
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-ramfree package/lean/luci-app-ramfree

#流量监视
git clone -b master --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

#iputils
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/network/utils/iputils package/network/utils/iputils

#onliner
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/luci-app-onliner package/ctcgfw/luci-app-onliner
#filetransfer
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-filetransfer package/lean/luci-app-filetransfer
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-lib-fs package/lean/luci-lib-fs
#tmate
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/tmate package/ctcgfw/tmate
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/msgpack-c package/ctcgfw/msgpack-c
#cpufreq
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-cpufreq package/lean/luci-app-cpufreq
patch -p1 < ../patches/2002-luci-app-freq.patch
#turboacc
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/luci-app-turboacc package/ctcgfw/luci-app-turboacc
#zerotier
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-zerotier package/lean/luci-app-zerotier

#lean default-settings
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/default-settings package/lean/default-settings
patch -p1 < ../patches/2003-zzz-default.patch

# Time stamp with $Build_Date=$(date +%Y.%m.%d)
echo -e '\nQuintus Build@'$(date "+%Y.%m.%d")'\n'  >> package/base-files/files/etc/banner
sed -i '/DISTRIB_REVISION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_REVISION='$(date "+%Y.%m.%d")'" >> package/base-files/files/etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='Quintus Build@$(date "+%Y.%m.%d")'" >> package/base-files/files/etc/openwrt_release
sed -i '/luciversion/d' feeds/luci/modules/luci-base/luasrc/version.lua
#echo 'luciversion = "Quintus@🇨🇦🇹🇼🇺🇸🇭🇰"' >> feeds/luci/modules/luci-base/luasrc/version.lua

#生成默认配置及缓存
rm -rf .config
chmod -R 755 ./

exit 0
