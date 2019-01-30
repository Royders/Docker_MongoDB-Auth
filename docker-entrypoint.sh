#!/bin/bash
set -m

mongodb_cmd="mongod"
cmd="$mongodb_cmd"

if [ "$AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi

#set ip binding
cmd="$cmd --bind_ip_all"

$cmd &

if [ ! -f /data/db/.mongodb_password_set ]; then
    /create_user.sh
fi
echo "MongoDB configured successfully. You may now connect to the DB."
fg
