#!/bin/bash -e

install -d "${ROOTFS_DIR}/var/lib/gladysassistant"
install -m 755 files/gladys-init.service "${ROOTFS_DIR}/etc/systemd/system/"
install -m 755 files/init-containers.sh "${ROOTFS_DIR}/var/lib/gladysassistant/"

on_chroot <<EOF
systemctl daemon-reload
systemctl enable gladys-init.service
EOF
