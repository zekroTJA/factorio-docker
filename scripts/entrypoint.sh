#!/bin/bash

SAVE_DIR="/var/save"
DEF_NAME="save.zip"

SAVE=$(ls $SAVE_DIR -1 | head -n1)

echo "SAVE: $SAVE"

[ -z $SAVE ] && {
    /var/server/factorio/bin/x64/factorio --create ${SAVE_DIR}/${DEF_NAME} $CREATE_ARGS
    SAVE=${DEF_NAME}
}

ls -lisah /var/server/factorio/bin/x64/factorio

/var/server/factorio/bin/x64/factorio \
    --start-server ${SAVE_DIR}/${SAVE} \
    --mod-directory /var/mods \
    $@