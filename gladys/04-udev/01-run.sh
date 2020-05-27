#!/bin/bash -e

install -v -d "${ROOTFS_DIR}/etc/udev/rules.d"
install -v -m 644 files/99-gladys-tty.rules "${ROOTFS_DIR}/etc/udev/rules.d/99-gladys-tty.rules"
