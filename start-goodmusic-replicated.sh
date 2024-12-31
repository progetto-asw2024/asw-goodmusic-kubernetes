#!/bin/bash

# Script per avviare l'applicazione GoodMusic

echo Running GOODMUSIC 

#creo network
docker network create goodmusic-net


#lancio i container
docker volume create --driver local kafka_data

docker run -d --network=goodmusic-net --name kafka  -v kafka_data:/bitnami -e KAFKA_CFG_NODE_ID=0 -e KAFKA_CFG_PROCESS_ROLES=controller,broker -e KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@kafka:9093 -e KAFKA_CFG_LISTENERS=PLAINTEXT://0.0.0.0:9092,CONTROLLER://:9093 -e KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092 -e KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT -e KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER -e KAFKA_CFG_INTER_BROKER_LISTENER_NAME=PLAINTEXT docker.io/bitnami/kafka:3.8
docker run -d --network=goodmusic-net --name connessioni-db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=connessionidb docker.io/postgres:latest
docker run -d --network=goodmusic-net --name recensioni-db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=recensionidb docker.io/postgres:latest
docker run -d --network=goodmusic-net --name recensioni-seguite-db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=recensioni-seguitedb docker.io/postgres:latest

docker run -d --network=goodmusic-net -p 8500:8500 --name=consul docker.io/hashicorp/consul 

docker run -d --network=goodmusic-net --name=connessioni-1 connessioni 
docker run -d --network=goodmusic-net --name=recensioni-1 recensioni 
docker run -d --network=goodmusic-net --name=recensioni-seguite-1 recensioni-seguite 

docker run -d --network=goodmusic-net --name=connessioni-2 connessioni
docker run -d --network=goodmusic-net --name=recensioni-2 recensioni 
docker run -d --network=goodmusic-net --name=recensioni-seguite-2 recensioni-seguite 

docker run -d --network=goodmusic-net -p 8080:8080 --name=apigateway apigateway 