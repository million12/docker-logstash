#!/bin/bash


/logstash/bin/logstash -e 'input { stdin { } } output { elasticsearch { host => "127.0.0.1" } }'