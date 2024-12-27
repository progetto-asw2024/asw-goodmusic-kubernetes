#!/bin/bash

echo Halting GOODMUSIC   

docker stop consul 
docker stop kafka
docker stop $(docker ps -a | grep recensioni | awk '{print $1}')
docker stop $(docker ps -a | grep recensioni-seguite | awk '{print $1}')
docker stop $(docker ps -a | grep connessioni | awk '{print $1}')
docker stop connessioni-db
docker stop recensioni-db
docker stop recensioni-seguite-db
docker stop apigateway

docker rm consul 
docker rm kafka
docker rm $(docker ps -a | grep recensioni | awk '{print $1}')
docker rm $(docker ps -a | grep recensioni-seguite | awk '{print $1}')
docker rm $(docker ps -a | grep connessioni | awk '{print $1}')
docker rm connessioni-db
docker rm recensioni-db
docker rm recensioni-seguite-db
docker rm apigateway

docker network rm goodmusic-net 