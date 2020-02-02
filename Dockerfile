FROM openwrt:19.07.0
#ADD http://downloads.openwrt.org/releases/18.06.2/targets/x86/64/openwrt-18.06.2-x86-64-generic-rootfs.tar.gz /
#ADD openwrt-18.06.1-x86-64-generic-rootfs.tar.gz /

EXPOSE 80
EXPOSE 22

# fix preinit errors
# remove led set_state as there are no leds
# remove remove ip preinit as there are network errors
# set wan as eth0
COPY preinit/* /lib/preinit/
COPY etc /etc/

# add password for root
RUN echo -e "administrator\nadministrator" | passwd root

# create missing folder
RUN mkdir /var/lock

# add luci-ng files
COPY luci2-rpc-base_20151214_x86_64.ipk /tmp/
COPY share /usr/share/
RUN cd /www && mkdir luci-ng

RUN opkg update && \
    opkg install luci rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-rpcsys && \
    opkg install uhttpd-mod-ubus && \
    opkg install /tmp/luci2-rpc-base_20151214_x86_64.ipk && \
    rm /tmp/luci2-rpc-base_20151214_x86_64.ipk 

# using exec format so that /sbin/init is proc 1 (see procd docs)
CMD ["/sbin/init"]
