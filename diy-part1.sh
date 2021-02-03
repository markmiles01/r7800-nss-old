#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# 移除ACwifidude自带bin目录
rm -rf bin

# 并入 lean插件包feeds和firewall
git clone https://github.com/coolsnowwolf/lede
cp -r lede/package/lean package/
\cp lede/feeds.conf.default feeds.conf.default


# 添加 ssr plus 和passwall 支持源
# sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small  https://github.com/kenzok8/small' feeds.conf.default
# sed -i '$a src-git OpenAppFilter https://github.com/OpenWrt-Actions/OpenAppFilter' feeds.conf.default

 sed -i '$a src-git OpenWrt-packages https://github.com/liuran001/openwrt-packages' feeds.conf.default



# 添加UPX UCL工具包
cp -r lede/tools/upx tools
cp -r lede/tools/ucl tools

# 修改makefile
sed  -i '/^# builddir dependencies/i\tools-y += ucl upx' ./tools/Makefile
sed  -i '/^# builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' ./tools/Makefile


# 删除重复插件
# rm -rf package/lean/ipt2socks
# rm -rf package/lean/dns2socks
# rm -rf package/lean/pdnsd-alt
# rm -rf package/lean/shadowsocksr-libev
# rm -rf package/lean/simple-obfs
# rm -rf package/lean/v2ray-plugin
# rm -rf package/lean/v2ray
rm -rf package/lean/microsocks
rm -rf package/lean/luci-app-diskman
rm -rf package/lean/luci-app-jd-dailybonus
rm -rf package/lean/luci-app-ramfree
rm -rf package/lean/luci-app-ttyd
rm -rf package/lean/luci-app-unblockmusic
rm -rf package/lean/luci-app-usb-printer
rm -rf package/lean/luci-app-vlmcsd
rm -rf package/lean/luci-app-vsftpd
rm -rf package/lean/luci-app-xlnetacc
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-lib-docker
rm -rf package/lean/microsocks
rm -rf package/lean/parted
rm -rf package/lean/redsocks2
rm -rf package/lean/tcpping
rm -rf package/lean/vlmcsd
rm -rf package/lean/UnblockNeteaseMusic
rm -rf package/lean/UnblockNeteaseMusicGo
rm -rf package/lean/adbyby
rm -rf package/lean/baidupcs-web
rm -rf package/lean/luci-app-adbyby-plus
rm -rf package/lean/luci-app-advancedsetting
rm -rf package/lean/luci-app-airplay2
rm -rf package/lean/luci-app-cifs-mount
rm -rf package/lean/luci-app-frpc
rm -rf package/lean/luci-app-frps
rm -rf package/lean/frp
rm -rf package/lean/ddns-scripts_aliyun
rm -rf package/lean/ddns-scripts_dnspod
rm -rf package/lean/dnsforwarder


# 删除lede文件夹
rm -rf lede


