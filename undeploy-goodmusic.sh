#!/bin/bash


kubectl delete namespace kafka
#kubectl delete all --all -n asw
kubectl delete -f asw-goodmusic-application-multi.yaml
#kubectl delete namespace asw
