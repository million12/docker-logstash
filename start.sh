#!/bin/bash

/logstash/bin/logstash -e 'input { stdin { } } output { elasticsearch { host => 10.211.55.80 } }'