FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

RUN \
    yum update -y && \
    yum install -y tar java-1.7.0-openjdk openssl && \
    mkdir -p /opt/logstash && \
    cd /opt/logstash && \
    curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar zxvf logstash-1.4.2.tar.gz -C /opt/logstash --strip-components=1 && \
    rm -f logstash-1.4.2.tar.gz && \
    /opt/logstash/bin/plugin install contrib && \
    yum remove -y tar && \
    yum clean all

ENV SERVER_CN server.com

COPY container-files /

CMD /start.sh

EXPOSE 5000