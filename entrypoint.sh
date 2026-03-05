#!/bin/bash

# if /etc/template/ddclient.conf exists, use it as a template for /etc/ddclient.conf
if [ -f /etc/template/ddclient.conf ]; then
    cp /etc/template/ddclient.conf /etc/ddclient/ddclient.conf
    if [ -n "$DNS_HOSTNAME" ]; then
        echo "Using DNS_HOSTNAME: $DNS_HOSTNAME"
        echo "$DNS_HOSTNAME" >> /etc/ddclient/ddclient.conf
    fi
fi

trap 'exit 0' TERM SIGINT
while true; do
    ddclient --foreground $@
    sleep "${SLEEP_TIME:-300}"
done

