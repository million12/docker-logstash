#!/bin/bash

set -e
set -u

mkdir -p /etc/logstash/ssl

if [ ! -f /etc/logstash/ssl/logstash-forwarder.key ] ; then
	cd /etc/logstash/ssl
	openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
fi

if [ ! -f /etc/logstash/ssl/logstash-forwarder.crt ] ; then
	cd /etc/logstash/ssl
    openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
fi
# Start logstash
/opt/logstash/bin/logstash agent -f /etc/logstash/logstash.conf