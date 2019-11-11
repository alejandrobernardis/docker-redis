#!/bin/sh
# Author: Alejandro M. BERNARDIS
# Email: alejandro.bernardis at gmail.com
# Created: 2019/11/11 10:49

set -e

REDIS_PASSWORD=${REDIS_PASSWORD:-'R3D1xP4%%w0rd.17'}

if [ ! -e /var/opt/mssql/.sysadmin ]; then

    sed -e 's/^bind 127.0.0.1/bind 0.0.0.0/i' \
        -e 's/^logfile /# logfile /i' \
        -e 's/^daemonize yes/daemonize no/i' \
        -e 's/^protected-mode yes/protected-mode no/i' \
        -i /etc/redis/redis.conf

    if [ ! -z $REDIS_PASSWORD ]; then
        sed -e 's/^# requirepass foobared/requirepass '"${REDIS_PASSWORD}"'/i' \
            -i /etc/redis/redis.conf
    fi

    echo "$(date)" >> /etc/redis/.sysadmin
fi

redis-server /etc/redis/redis.conf
