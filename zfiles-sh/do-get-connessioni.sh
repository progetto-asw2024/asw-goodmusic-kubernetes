#!/bin/bash

# trova tutte le connessioni
SERVICE_HOST=kube-node
INGRESS_PORT=80
SERVICE_INGRESS_HOST=goodmusic.asw.io

echo "# tutte le connessioni"
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT})
echo
