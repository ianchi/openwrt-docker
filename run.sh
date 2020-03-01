#!/bin/bash


docker start openwrt || docker run -d --privileged -p 9443:443 -p 9080:80 -p 9022:22 --name openwrt -v /mnt/host/usr/share/rpcd/luci2:/usr/share/rpcd/luci2  ianchi74/openwrt:luci2-rpc
