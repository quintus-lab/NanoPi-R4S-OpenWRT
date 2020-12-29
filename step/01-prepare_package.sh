#!/bin/bash
clear
#Additional package
#arpbind
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-arpbind package/lean/luci-app-arpbind
#AutoCore
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/autocore package/lean/autocore
svn co https://github.com/project-openwrt/packages/branches/master/utils/coremarkfeeds/packages/utils/coremark
ln -sf ../../../feeds/packages/utils/coremark ./package/feeds/packages/coremark

#DDNS
#rm -rf ./feeds/packages/net/ddns-scripts
#rm -rf ./feeds/luci/applications/luci-app-ddns
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_dnspod package/lean/ddns-scripts_dnspod
#svn co https://github.com/openwrt/packages/branches/openwrt-18.06/net/ddns-scripts feeds/packages/net/ddns-scripts
#svn co https://github.com/openwrt/luci/branches/openwrt-18.06/applications/luci-app-ddns feeds/luci/applications/luci-app-ddns
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/ddns-scripts_dnspod package/lean/ddns-scripts_aliyun
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/ddns-scripts_aliyun package/lean/ddns-scripts_dnspod

#定时重启
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
#AdGuard
#git clone -b master --single-branch https://github.com/rufengsuixing/luci-app-adguardhome package/new/luci-app-adguardhome
#Adbyby
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-adbyby-plus package/lean/luci-app-adbyby-plus
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/adbyby package/lean/coremark/adbyby
#gost
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/gost package/ctcgfw/gost
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/luci-app-gost package/ctcgfw/luci-app-gost

#beardropper
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/luci-app-beardropper package/ctcgfw/luci-app-beardropper

#SSRP
#svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
#svn co https://github.com/fw876/helloworld/trunk/tcping package/lean/tcping
#svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/lean/naiveproxy
svn co https://github.com/Mattraks/helloworld/branches/Preview/luci-app-ssr-plus package/lean/luci-app-ssr-plus
svn co https://github.com/Mattraks/helloworld/branches/Preview/naiveproxy package/lean/naiveproxy
svn co https://github.com/Mattraks/helloworld/branches/Preview/tcping package/lean/tcping

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
patch -p1 < ../patches/2001-ssr-plus-tls.patch

#OpenClash
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/new/luci-app-openclash
#luci-app-clash
#git clone https://github.com/frainzy1477/luci-app-clash.git package/luci-app-clash
#edge主题
#git clone -b master --single-branch https://github.com/garypang13/luci-theme-edge package/new/luci-theme-edge

#清理内存
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-ramfree package/lean/luci-app-ramfree

#流量监视
git clone -b master --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon
#流量监管
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-netdata package/lean/luci-app-netdata

#SeverChan
#git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan

#iputils
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/network/utils/iputils package/network/utils/iputils

#jd-dailybonus
#git clone --depth 1 https://github.com/jerrykuku/node-request.git package/new/node-request
#git clone --depth 1 https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/new/luci-app-jd-dailybonus

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
#speedtest cli
svn co https://github.com/project-openwrt/packages/trunk/net/speedtest-cli package/ctcgfw/speedtest-cli
#turboacc
svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/luci-app-turboacc package/ctcgfw/luci-app-turboacc
#Zerotier
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-zerotier package/lean/luci-app-zerotier

#最大连接
sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
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
echo 'luciversion = "Quintus@🇨🇦🇹🇼🇺🇸🇭🇰"' >> feeds/luci/modules/luci-base/luasrc/version.lua

#生成默认配置及缓存
rm -rf .config
chmod -R 755 ./

exit 0
