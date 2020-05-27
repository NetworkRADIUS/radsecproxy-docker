#!/bin/sh
set -e

#update-ca-certificates
# Start Radsecproxy
#/usr/local/sbin/radsecproxy -d 5 -f -i /var/run/radsecproxy.pid
/sbin/radsecproxy -f -c /etc/radsecproxy.conf -i /var/run/radsecproxy.pid

