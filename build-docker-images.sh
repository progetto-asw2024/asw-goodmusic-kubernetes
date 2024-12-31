#!/bin/bash

docker build --rm -t connessioni ./connessioni
docker build --rm -t recensioni ./recensioni
docker build --rm -t recensioni-seguite ./recensioni-seguite
docker build --rm -t apigateway ./api-gateway