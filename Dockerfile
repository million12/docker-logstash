FROM centos:latest
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

RUN yum update -y && \
yum install -y epel-release && \
yum install -y tar java-1.7.0-openjdk && \
yum clean all && \
mkdir -p /opt/local && \
cd /opt/local/ && \
curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz && \
tar zxvf logstash-1.4.2.tar.gz && \
tar zxvf elasticsearch-1.1.1.tar.gz && \
rm logstash-1.4.2.tar.gz && \
rm elasticsearch-1.1.1.tar.gz && \
mv logstash-1.4.2/ logstash/ && \
mv elasticsearch-1.1.1/ elasticsearch/ && \


 