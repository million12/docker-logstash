#!/bin/bash
export TERM=xterm
set -e
set -u
# Bash Colors
green=`tput setaf 2`
bold=`tput bold`
reset=`tput sgr0`
# Logging Functions
log() {
  if [[ "$@" ]]; then echo "${bold}${green}[LOG `date +'%T'`]${reset} $@";
  else echo; fi
}
### Functions
check_ssl() {
    mkdir -p /etc/logstash/ssl
    if [ ! -f /etc/logstash/ssl/logstash.key ] ; then
        log "No key present. Genrating new one"
    	cd /etc/logstash/ssl
    	openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash.key -out logstash.crt -subj /CN=$SERVER_CN
        log "New key generated for CN: ${SERVER_CN}"
    fi
    if [ ! -f /etc/logstash/ssl/logstash.crt ] ; then
        log "No key present. Genrating new one"
    	cd /etc/logstash/ssl
        openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout logstash.key -out logstash.crt -subj /CN=$SERVER_CN
        log "New key generated for CN: ${SERVER_CN}"
    fi
    echo ========================logstash.key============================
    cat /etc/logstash/ssl/logstash.key
    echo ========================logstash.crt============================
    cat /etc/logstash/ssl/logstash.crt

}
install_plugins() {
    if [ "${INSTALL_PLUGINS}" != "none" ]; then
        log "Installing plugins: ${INSTALL_PLUGINS}"
        /opt/logstash/bin/logstash-plugin install ${INSTALL_PLUGINS}
        log "Plugins installed"
    fi
}

start_logstash() {
    /opt/logstash/bin/logstash agent --verbose -f /etc/logstash/logstash.conf
}

### Magic starts here
check_ssl
install_plugins
start_logstash

