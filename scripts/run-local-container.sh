#! /bin/bash

VERSION="${1:-latest}"

docker run -itd --name noip --restart=unless-stopped \
    -e USERNAME="$(pass show noip/username)" \
    -e PASSWORD="$(pass show noip/password)" \
    -e HOSTNAME="$(pass show noip/hostname)" \
    -e INTERVAL=30 \
    -e DEBUG=true \
    noip:"$VERSION"
