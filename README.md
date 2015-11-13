## Logstash Docker Images

[![GitHub Open Issues](https://img.shields.io/github/issues/million12/docker-logstash.svg)](https://github.com/million12/docker-logstash/issues)
[![GitHub Stars](https://img.shields.io/github/stars/million12/docker-logstash.svg)](https://github.com/million12/docker-logstash)
[![GitHub Forks](https://img.shields.io/github/forks/million12/docker-logstash.svg)](https://github.com/million12/docker-logstash)  
[![Stars on Docker Hub](https://img.shields.io/docker/stars/million12/logstash.svg)](https://hub.docker.com/r/million12/logstash)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/million12/logstash.svg)](https://hub.docker.com/r/million12/logstash)  
[![Docker Layers](https://badge.imagelayers.io/million12/logstash:latest.svg)](https://hub.docker.com/r/million12/logstash)

This is [million12/logstash](https://registry.hub.docker.com/u/million12/logstash/) docker image with logstash server. It's based on [CentOS-7](https://registry.hub.docker.com/_/centos/) official docker image.

## ENV variables
### SERVER_CN
Default: `SERVER_CN=server.com`  
For your own server canonical name, simply edit it.

## Usage
### Basic

    docker run \
    -d \
    --name logstash \
    -p 5000:5000 \
    million12/logstash

### Mount custom config , override some options

User can provide config (`logstash.conf`) file by sharing it from host os.  

Run example (assuming your `logstash.conf` is located in `/etc/logstash/logstash.conf` on host os):  

    docker run \
    -d \
    --name logstash \
    -p 5000:5000 \
    -v /etc/logstash:/etc/logstash \
    million12/logstash

Certificates will be created on the first run and kept in `/etc/logstash/ssl` directory.  
If you run docker image with `-v /etc/logstash:/etc/logstash` certificates will accessible on host os in: `/etc/logstash/ssl/*`

## Logstash Forwarder  
For pushing your logs into Logstash make sure you have copied certificated to your logged machine and set up logstash-forwarder accourdigly to it's [manual](https://github.com/elasticsearch/logstash-forwarder).  

## Authors

Author: Marcin Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)  

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
