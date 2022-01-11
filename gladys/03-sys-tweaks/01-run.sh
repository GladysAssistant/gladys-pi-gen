#!/bin/bash -e

install -m 755 files/rc.local		"${ROOTFS_DIR}/etc/"
install -m 755 files/disableipv6.conf		"${ROOTFS_DIR}/etc/sysctl.d/"