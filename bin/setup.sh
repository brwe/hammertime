#!/bin/bash
CURRENT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
if [ -d ${PARENT}/elasticsearch ]; then
 echo "elasticsearch already exists in "${PARENT}" - skipping"
else 
  echo "Downloading latest ElasticSearch Build"
  curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-master.zip
  unzip -d ${PARENT} elasticsearch-master.zip 
  ln -s ${PARENT}/elasticsearch-0.90.0.Beta2-SNAPSHOT ${PARENT}/elasticsearch
  rm elasticsearch-master.zip
fi

if [ -f ${CURRENT}/stream2es ]; then
  echo "stream2es already exists - skipping"
else
  echo "Downloading latest stream2es binary"
  curl -o ${CURRENT}/stream2es download.elasticsearch.org/stream2es/stream2es; chmod +x ${CURRENT}/stream2es
fi
