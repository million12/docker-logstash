#!/bin/bash
#
# Purpose of this script is to populate environmental variables into logstash configuration file 
#

sed -i 's|127.0.0.1|'$ELASTICSEARCH_IP'|g' /etc/logstash.conf

