###Logstash Docker Images
Logstash docker image to work with elasticsearch docker image (million12/elasticsearch). 

This docker image is configured to send data to Elasticsearch and Redis. (By Default both are sending data to localhost.)

###Starting Logstash 

`docker run -d --name logstash -e ELASTICSEARCH_IP=elasticsearch_ip -e REDIS_IP=redis_ip million12/logstash

###Configuration File
Configuration file is set to send stdout. If you need to send more data please read logstash documentation and edit config file accordigly. <a href="http://logstash.net/docs/1.4.2/">Logstash Documentation</a>