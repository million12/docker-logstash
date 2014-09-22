FROM million12/centos-supervisor
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

ADD env.sh /config/init/env.sh
ADD logstash.conf /etc/logstash.conf

ENV ELASTICSEARCH_IP 127.0.0.1

RUN yum update -y && \
yum install -y tar java-1.7.0-openjdk && \
yum clean all && \

# - Logstash Installation 
mkdir -p /opt/logstash && \
cd /opt/logstash && \
curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
tar zxvf logstash-1.4.2.tar.gz -C /opt/logstash --strip-components=1 && \
rm logstash-1.4.2.tar.gz && \
/opt/logstash/bin/plugin install contrib 

ADD supervisord.conf /etc/supervisor.d/logstash.conf


CMD /bin/start.sh
