#!/bin/bash

VERSION_API_ENDPOINT="https://factorio.com/api/latest-releases"

VERSION=$1
[ -z $VERSION ] || [ "$VERSION" == "latest" ] && \
    VERSION=$(curl -s $VERSION_API_ENDPOINT | jq -r .stable.headless)

echo $VERSION