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

#添加 ssr plus 和passwall 支持源
sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small  https://github.com/kenzok8/small' feeds.conf.default

# 添加第三方软件包
git clone https://github.com/OpenWrt-Actions/OpenAppFilter package/OpenAppFilter


# 并入 lean插件包和firewall
git clone https://github.com/mapdio/lede
cp ../lede/package/lean/ /openwrt/package/
\cp ../lede/package/network/config/firewall/ /openwrt/package/network/config/firewall/

