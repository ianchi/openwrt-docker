#!/bin/bash

docker build -t ianchi74/openwrt:luci-19.07.1 .
docker build -t ianchi74/openwrt:luci2-rpc -f Dockerfile.rpc .

docker push ianchi74/openwrt:luci-19.07.1
docker push ianchi74/openwrt:luci2-rpc
