#!/bin/bash -e

on_chroot <<EOF
mkdir -p /var/lib/gladysassistant/
EOF

install -m 755 files/gladys-init.service "${ROOTFS_DIR}/etc/systemd/system/"
install -m 755 files/init-containers.sh "${ROOTFS_DIR}/var/lib/gladysassistant/"

on_chroot <<EOF
systemctl daemon-reload
systemctl enable gladys-init.service
EOF
