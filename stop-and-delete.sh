#!/bin/sh

set -e
set -x

docker container stop c-ssh-server
docker container rm c-ssh-server

