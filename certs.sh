#!/bin/bash


if [ ! -f /opt/logstash/ssl/logstash-forwarder.key ] ; then
	cd /opt/logstash/ssl 
	openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
fi

if [ ! -f /opt/logstash/ssl/logstash-forwarder.crt ] ; then
	cd /opt/logstash/ssl 
    openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
fi

# -  populate certificated through etcd

curl -L -X PUT http://10.0.42.1:4001/v2/keys/fwdkey --data-urlencode value@/opt/logstash/ssl/logstash-forwarder.key
curl -L -X PUT http://10.0.42.1:4001/v2/keys/fwdcrt --data-urlencode value@/opt/logstash/ssl/logstash-forwarder.crt