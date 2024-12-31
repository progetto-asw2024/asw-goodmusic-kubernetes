#!/bin/bash

echo "Creating some Kafka topics..."

# Trova l'ID del container Kafka
KAFKA_DOCKER=$(docker ps | grep kafka:3 | grep -v zookeeper | awk '{print $1}')
echo "Kafka Docker container ID: $KAFKA_DOCKER"

# Verifica se KAFKA_DOCKER è vuoto e attendi finché il container non è pronto
while [ -z "$KAFKA_DOCKER" ]; do
    echo "Attendere che il container Kafka sia avviato..."
    sleep 2  # Pausa di 2 secondi tra i tentativi
    KAFKA_DOCKER=$(docker ps | grep kafka:3 | grep -v zookeeper | awk '{print $1}')
done

echo "Il container Kafka è in esecuzione!"

# Ora esegui i comandi per creare i topic Kafka
docker exec -it $KAFKA_DOCKER kafka-topics.sh --bootstrap-server localhost:9092 --create --if-not-exists --topic connessioni --replication-factor 1 --partitions 4
docker exec -it $KAFKA_DOCKER kafka-topics.sh --bootstrap-server localhost:9092 --create --if-not-exists --topic recensioni --replication-factor 1 --partitions 4

echo "I topic sono stati creati o esistono già."
