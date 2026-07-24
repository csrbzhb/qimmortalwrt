#!/bin/bash
export WRT_THEME=aurora
export WRT_NAME=Jwrt
export WRT_SSID=Jwrt
      #默认WIFI密码
export WRT_WORD=12345678
      #默认地址
export WRT_IP=192.168.10.1
      #默认密码，仅作提示，修改无用

export WRT_MARK="GITHUB_REPOSITORY"
export WRT_DATE=$(TZ=UTC-8 date +"%y.%m.%d-%H.%M.%S")
echo $WRT_DATE $WRT_MARK
# add siyuan
grep -q "siyuan" feeds.conf.default || echo "src-git siyuan https://github.com/csrbzhb/luci-app-siyuan.git" >> ./feeds.conf.default

./scripts/feeds update -a
./scripts/feeds install -a
cd package/
bash ../Packages.sh
bash ../Handles.sh
cd ..
bash Settings.sh
sed -i 's/+python3-pkg-resources //g; s/+python3-email /+python3 /g' package/netspeedtest/luci-app-netspeedtest/Makefile
