#!/bin/sh

set -e
set -x

IMAGE_NAME="ssh-server"
CONTAINER_NAME="c-ssh-server"

CONTAINER_PORT=22
HOST_PORT=18542

docker run -d -p $HOST_PORT:$CONTAINER_PORT --name="$CONTAINER_NAME" $IMAGE_NAME tail -f /dev/null

# Print container info
docker container port $CONTAINER_NAME
docker exec $CONTAINER_NAME /usr/sbin/sshd
docker exec $CONTAINER_NAME ps aux

