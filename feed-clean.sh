#!/bin/bash

# Description: OpenWrt DIY script run after Update feeds

# 移除feed里重复组件

rm -rf feeds/packages/kcptun
rm -rf feeds/kenzok8/redsocks2

