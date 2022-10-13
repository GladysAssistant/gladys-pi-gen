#!/bin/bash -e

on_chroot <<EOF
echo Patching certs...
c_rehash /etc/ssl/certs
EOF

mkdir -p "${ROOTFS_DIR}/etc/docker"
install -m 755 files/daemon.json "${ROOTFS_DIR}/etc/docker/"

on_chroot <<EOF
curl -kfsSL https://get.docker.com -o /tmp/get-docker.sh
sh /tmp/get-docker.sh
for GRP in docker; do
	groupadd -f -r "\$GRP"
done
for GRP in docker ; do
  adduser $FIRST_USER_NAME \$GRP
done
passwd -e $FIRST_USER_NAME
EOF
