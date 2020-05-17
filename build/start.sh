#!/bin/sh
#set -e

#Update the /etc/hosts
echo "Radius Host $RADIUS_HOST"
echo "Radius HostNAME $RADIUS_HOSTNAME"
echo "$RADIUS_IP  $RADIUS_HOSTNAME" >> /etc/hosts

#v alidate the DNS Resolve
ping $RADIUS_HOSTNAME -c 1

# Start Radsecproxy
/usr/local/sbin/radsecproxy -d 5 -f -i /var/run/radsecproxy.pid
