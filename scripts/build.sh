#! /bin/bash

VERSION="${1:-latest}"

docker build . -t noip:"$VERSION" --build-arg USER_PASSWORD="$(pass show noip/user_password)"
