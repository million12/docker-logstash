###Logstash Docker Images
Image is based on Logstash 1.4.2

###Starting Logstash
`docker run -d --name logstash polinux/logstash:1.4.2`

If you want to send logs to elasticsearch (polinux/elasticsearch:1.1.1) run loke this:

`docker run -d --name logstash -e ES_IP=elasticsearch_ip polinux/elasticsearch:1.1.1`

Logstash 1.4.2 works only with elasticsearch 1.1.1 not newer. 