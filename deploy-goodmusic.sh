#!/bin/bash

./kafka/deploy-kafka.sh
cd "$(dirname "$0")"
kubectl apply -f asw-goodmusic-application-multi.yaml
