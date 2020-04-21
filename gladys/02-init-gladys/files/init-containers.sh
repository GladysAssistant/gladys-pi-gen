#!/bin/sh

TIMEZONE=$(cat /etc/timezone)

result=$(docker images -q watchtower)

if [ -n "$result" ]; then
  logger -t "gladys-init" "Watchtower container exist, Cool...."
else
  logger -t "gladys-init" "Watchtower container missing, creating them...."
  docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    --cleanup
fi

result=$(docker images -q gladys)

if [ -n "$result" ]; then
  logger -t "gladys-init" "Gladys container exist, Cool...."
else
  logger -t "gladys-init" "Gladys container missing, creating them...."
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
fi
