#!/bin/bash


if [ ! -f /opt/logstash/ssl/logstash-forwarder.key ] ; then
	cd /opt/logstash/ssl 
	openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
fi

if [ ! -f /opt/logstash/ssl/logstash-forwarder.crt ] ; then
	cd /opt/logstash/ssl 
    openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
fi
