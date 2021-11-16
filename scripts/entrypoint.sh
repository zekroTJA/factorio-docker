#!/bin/bash

SAVE_DIR="/var/save"
DEF_NAME="save.zip"

SAVE=$(ls $SAVE_DIR -1 | head -n1)

[ -z $SAVE ] && {
    echo "-- No save file found. Creating new world."
    /var/server/factorio/bin/x64/factorio --create factorio/saves/${DEF_NAME} $CREATE_ARGS
}

echo "-- Starting server."
/var/server/factorio/bin/x64/factorio \
    --start-server-load-latest \
    --mod-directory /var/mods \
    $@