#!/bin/bash

# if /etc/template/ddclient.conf exists, use it as a template for /etc/ddclient.conf
if [ -f /etc/template/ddclient.conf ]; then
    cp /etc/template/ddclient.conf /etc/ddclient.conf
    if [ -n "$DNS_HOSTNAME" ]; then
        echo "Using DNS_HOSTNAME: $DNS_HOSTNAME"
        echo "$DNS_HOSTNAME" >> /etc/ddclient.conf
    fi
fi

trap 'exit 0' TERM SIGINT
ddclient --foreground $@
