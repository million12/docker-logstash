#!/bin/bash
#
# Purpose of this script is to populate environmental variables into logstash configuration file 
#

sed -i 's|ELASTICSEARCH_IP|'$ELASTICSEARCH_IP'|g' /etc/logstash.conf
sed -i 's|REDIS_IP|'$REDIS_IP'|g' /etc/logstash.conf