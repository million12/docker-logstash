#!/bin/bash

/logstash/bin/logstash -e 'input { stdin { } } output { elasticsearch { host => "$ES_IP" } }'