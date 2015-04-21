#!/bin/bash
set -e

if [ "$1" = "/opt/elasticsearch/bin/elasticsearch" ]; then

    CONFIG=/opt/elasticsearch/config/elasticsearch.yml

    FIRSTRUN=/firstrun
    if [ ! -f $FIRSTRUN ]; then

        if [ "$NODE_NAME" == "**None**" ]; then
            unset NODE_NAME
        fi

        if [ "$NODE_MASTER" == "True" ]; then
            NODE_MASTER=true
        else
            NODE_MASTER=false
        fi

        if [ "$NODE_DATA" == "True" ]; then
            NODE_DATA=true
        else
            NODE_DATA=false
        fi

        if [ -n "$NODE_NAME" ]; then
            sed -i -e "s/^#node.name:/node.name: $NODE_NAME/
                       s/^#node.master:/node.master: $NODE_MASTER/
                       s/^#node.data:/node.data: $NODE_DATA/" $CONFIG
        fi

        touch $FIRSTRUN
    fi
fi

exec "$@"
