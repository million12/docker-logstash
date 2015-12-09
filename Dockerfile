FROM centos:centos7
MAINTAINER Marcin Ryzycki marcin@m12.io, Przemyslaw Ozgo linux@ozgo.info

ENV LOGSTASH_VERSION 2.1.1

RUN \
  rpm --rebuilddb && yum clean all && \
  yum install -y tar java-1.8.0-openjdk openssl && \
  mkdir -p /opt/logstash && \
  cd /opt/logstash && \
  curl -O https://download.elasticsearch.org/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \
  tar zxvf logstash-${LOGSTASH_VERSION}.tar.gz -C /opt/logstash --strip-components=1 && \
  rm -f logstash-${LOGSTASH_VERSION}.tar.gz && \
  yum remove -y tar && \
  yum clean all

ENV SERVER_CN server.com

COPY container-files /

CMD /start.sh

EXPOSE 5000
