#!/bin/bash

echo Creating some Kafka topics...

KAFKA_DOCKER=$(docker ps | grep kafka:3 | grep -v zookeeper | awk '{print $1}')
echo $KAFKA_DOCKER
docker exec -it $KAFKA_DOCKER kafka-topics.sh --bootstrap-server localhost:9092 --create --topic connessioni --replication-factor 1 --partitions 4  

