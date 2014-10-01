###Logstash Docker Images
Logstash docker image to work with elasticsearch docker image (million12/elasticsearch). 

This docker image is configured to send data to Elasticsearch. (By Default logstash is sending data to localhost.)

###Starting Logstash 

`docker run -d --name logstash -e ELASTICSEARCH_IP=elasticsearch_ip -p 5000:5000 -v /opt/ssl:/opt/logstash/ssl million12/logstash`
### Certificates 
Certificates will be created on first run and will be kept in /opt/logstash/ssl directory. To get them out copy them using those commands:

`docker cp logstash:/opt/logstash/ssl/logstash-forwarder.key /directory_to_store_certs/`

`docker cp logstash:/opt/logstash/ssl/logstash-forwarder.crt /directory_to_store_certs/`

Or if you are running logstash-forwarder on the same host use --volumes-from command ehen starting it.

Example:

`docker run -d --name logstash-forwarder --volumes-from=logstash -v /var/log:/data/log -v /your-dir:/etc/forwarder/ million12/logstash-forwarder`


### Logstash Forwarder
For pushing your logs into Logstash make sure you have copied certificated to your logged machine and set up logstash-forwarder accourdigly to it's manual. <a href="https://github.com/elasticsearch/logstash-forwarder">LINK</a>

In case of having issues with SSL make sure you are using Go version 1.3+ and build your logstash-forwarder ising branch ISSUE-221 
