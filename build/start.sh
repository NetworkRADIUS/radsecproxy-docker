#!/bin/sh
set -e


# Start Radsecproxy
/usr/local/sbin/radsecproxy -d 5 -f -i /var/run/radsecproxy.pid