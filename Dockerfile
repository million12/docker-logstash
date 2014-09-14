FROM centos:latest
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

RUN yum update -y && \
yum install -y epel-release && \
yum install -y tar java-1.7.0-openjdk && \
yum clean all && \
cd /tmp && \
curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
tar zxvf logstash-1.4.2.tar.gz && \
rm logstash-1.4.2.tar.gz && \
mv logstash-1.4.2/ /logstash/ && \
logstash/bin/plugin install contrib 

ADD start.sh /bin/start.sh

CMD /bin/start.sh
