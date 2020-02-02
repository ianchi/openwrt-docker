#!/bin/bash

docker build -t openwrt:luci2-rpc .
docker tag openwrt:luci2-rpc ianchi74/openwrt:luci2-rpc
docker push ianchi74/openwrt:luci2-rpc