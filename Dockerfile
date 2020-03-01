FROM openwrtorg/rootfs:x86-64-19.07.1

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


RUN opkg update && opkg install luci-mod-admin-full


# using exec format so that /sbin/init is proc 1 (see procd docs)
CMD ["/sbin/init"]
