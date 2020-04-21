#!/bin/bash -e

on_chroot <<EOF
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sh /tmp/get-docker.sh
for GRP in docker; do
	groupadd -f -r "\$GRP"
done
for GRP in docker ; do
  adduser $FIRST_USER_NAME \$GRP
done
passwd -e $FIRST_USER_NAME
EOF
