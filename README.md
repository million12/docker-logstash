## Logstash Docker Images
Logstash docker image [million12/elasticsearch](https://registry.hub.docker.com/u/million12/logstash/).

This docker image is configured to send data to Elasticsearch. Please see `logstash.conf`.  
By Default logstash is sending data to localhost set to `127.0.0.1`.

## Starting Logstash 

`docker run -d --name logstash -p 5000:5000 millionion12/logstash`
## Custom config and certificates
User can provide config (`logstash.conf`) file by sharing it from host os.  

Run example (assuming your `logstash.conf` is located in `/etc/logstash/logstash.conf` on host os):  
   
`docker run -d --name logstash -p 5000:5000 -v /etc/logstash:/etc/logstash millionion12/logstash`  

Certificates will be created on the first run and kept in `/etc/logstash/ssl` directory.  
If you run docker image with `-v /etc/logstash:/etc/logstash` certificates will accessible on host os in: `/etc/logstash/ssl/*`

## Logstash Forwarder  
For pushing your logs into Logstash make sure you have copied certificated to your logged machine and set up logstash-forwarder accourdigly to it's manual. <a href="https://github.com/elasticsearch/logstash-forwarder">LINK</a>

In case of having issues with SSL make sure you are using Go version 1.3+ and build your logstash-forwarder ising branch ISSUE-221 


## Authors

Author: Marcin Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)  

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
