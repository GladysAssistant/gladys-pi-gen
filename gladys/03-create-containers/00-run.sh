#!/bin/bash -e

on_chroot <<EOF
TIMEZONE=$(cat /etc/timezone)

docker run -d   \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    --cleanup


docker run -d \
    --restart=always \
    --privileged \
    --network=host \
    --name gladys \
    -e NODE_ENV=production \
    -e SERVER_PORT=80 \
    -e TZ=${TIMEZONE} \
    -e SQLITE_FILE_PATH=/var/lib/gladysassistant/gladys-production.db \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/lib/gladysassistant:/var/lib/gladysassistant \
    -v /dev:/dev \
    gladysassistant/gladys:4.0.0-beta-arm

EOF
