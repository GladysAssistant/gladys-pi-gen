#!/bin/bash -e

install -m 755 files/rc.local		"${ROOTFS_DIR}/etc/"

on_chroot <<EOF
echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.eth0.disable_ipv6=1" >> /etc/sysctl.conf
EOF