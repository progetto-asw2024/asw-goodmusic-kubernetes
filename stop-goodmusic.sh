#!/bin/bash

echo Halting GOODMUSIC

echo Stopping containers

docker stop consul
docker stop kafka
docker stop $(docker ps -a | grep recensioni-seguite | awk '{print $1}')
docker stop $(docker ps -a | grep recensioni | awk '{print $1}')
docker stop $(docker ps -a | grep connessioni | awk '{print $1}')
docker stop apigateway

echo Removing containers

docker rm consul
docker rm kafka
docker rm $(docker ps -a | grep recensioni-seguite | awk '{print $1}')
docker rm $(docker ps -a | grep recensioni | awk '{print $1}')
docker rm $(docker ps -a | grep connessioni | awk '{print $1}')
docker rm apigateway

docker network rm goodmusic-net
