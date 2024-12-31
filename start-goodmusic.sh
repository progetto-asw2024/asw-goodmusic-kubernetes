#!/bin/bash

# Script per avviare l'applicazione GoodMusic

echo Running GOODMUSIC

# Creo il network
docker network create goodmusic-net

# Creo i volumi per la persistenza dei dati
docker volume create --driver local kafka_data
docker volume create --driver local connessioni_db_data
docker volume create --driver local recensioni_db_data

# Lancio i container
docker run -d --network=goodmusic-net --name kafka -v kafka_data:/bitnami \
  -e KAFKA_CFG_NODE_ID=0 \
  -e KAFKA_CFG_PROCESS_ROLES=controller,broker \
  -e KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@kafka:9093 \
  -e KAFKA_CFG_LISTENERS=PLAINTEXT://0.0.0.0:9092,CONTROLLER://:9093 \
  -e KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 \
  -e KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT \
  -e KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER \
  -e KAFKA_CFG_INTER_BROKER_LISTENER_NAME=PLAINTEXT \
  docker.io/bitnami/kafka:3.8
  ./create-some-kafka-topics.sh


docker run -d --network=goodmusic-net --name connessioni-db \
  -v connessioni_db_data:/var/lib/postgresql/data \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=connessionidb \
  docker.io/postgres:latest

docker run -d --network=goodmusic-net --name recensioni-db \
  -v recensioni_db_data:/var/lib/postgresql/data \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=recensionidb \
  docker.io/postgres:latest

docker run -d --network=goodmusic-net -p 5432:5432 --name recensioni-seguite-db \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=recensioni-seguitedb \
  docker.io/postgres:latest

docker run -d --network=goodmusic-net -p 8500:8500 --name=consul \
  docker.io/hashicorp/consul

docker run -d --network=goodmusic-net --name=connessioni connessioni
docker run -d --network=goodmusic-net --name=recensioni recensioni
docker run -d --network=goodmusic-net --name=recensioni-seguite recensioni-seguite

docker run -d --network=goodmusic-net -p 8080:8080 --name=apigateway apigateway
