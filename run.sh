#!/bin/bash

docker run -t -d --rm -p 4080:80 -p 4022:22 --device=/dev/kmsg:/dev/kmsg --name=openwrt openwrt:luci2-rpc
