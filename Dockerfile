FROM million12/centos-supervisor
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

ADD env.sh /config/init/env.sh
ADD certs.sh /config/init/certs.sh
ADD logstash.conf /etc/logstash.conf

ENV ELASTICSEARCH_IP 127.0.0.1

RUN yum update -y && \
yum install -y tar java-1.7.0-openjdk openssl && \
yum clean all && \

# - Logstash Installation 
mkdir -p /opt/logstash/ssl && \
cd /opt/logstash && \
curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
tar zxvf logstash-1.4.2.tar.gz -C /opt/logstash --strip-components=1 && \
rm logstash-1.4.2.tar.gz && \
/opt/logstash/bin/plugin install contrib && \
cd /opt/logstash/ssl && \
openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt

ADD supervisord.conf /etc/supervisor.d/logstash.conf
