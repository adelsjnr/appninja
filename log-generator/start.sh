#!/bin/bash

curl -XGET 'http://elastic:9200/_cat/health'
curl -XPUT 'http://elastic:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json
/etc/init.d/filebeat start

for i in `seq 1 100`
do
	echo "This is a ninja message!" >> /var/log/ninja_message.log
	tail -n1 /var/log/ninja_message.log
done
