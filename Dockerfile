FROM million12/centos-supervisor
MAINTAINER Przemyslaw Ozgo <linux@ozgo.info>

RUN \
    yum update -y && \
    yum install -y tar java-1.7.0-openjdk openssl && \
    yum clean all && \
    # - Logstash Installation
    mkdir -p /opt/logstash/ssl && \
    cd /opt/logstash && \
    curl -O https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar zxvf logstash-1.4.2.tar.gz -C /opt/logstash --strip-components=1 && \
    rm logstash-1.4.2.tar.gz && \
    /opt/logstash/bin/plugin install contrib

COPY container-files /

EXPOSE 5000