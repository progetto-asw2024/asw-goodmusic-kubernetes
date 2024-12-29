#!/bin/bash

# inizializza il db delle connessioni 
SERVICE_HOST=kube-node
INGRESS_PORT=80
SERVICE_INGRESS_HOST=goodmusic.asw.io
# connessioni con artisti 

curl -X POST http://${SERVICE_INGRESS_HOST}/connessioni/connessioni -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Alice\", \"seguito\": \"Pink Floyd\", \"ruolo\": \"ARTISTA\"}" --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}
echo 

curl -X POST http://${SERVICE_INGRESS_HOST}/connessioni/connessioni -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Alice\", \"seguito\": \"The Beatles\", \"ruolo\": \"ARTISTA\"}" --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}
echo 

curl -X POST http://${SERVICE_INGRESS_HOST}/connessioni/connessioni -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Bob\", \"seguito\": \"The Beatles\", \"ruolo\": \"ARTISTA\"}" --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}
echo 

curl -X POST http://${SERVICE_INGRESS_HOST}/connessioni/connessioni -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Bob\", \"seguito\": \"Michael Jackson\", \"ruolo\": \"ARTISTA\"}" --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}
echo 

# connessioni con recensori 

curl -X POST http://${SERVICE_INGRESS_HOST}/connessioni/connessioni -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Bob\", \"seguito\": \"Woody\", \"ruolo\": \"RECENSORE\"}" --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}
echo 

curl -X POST http://${SERVICE_INGRESS_HOST}/connessioni/connessioni -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Carlo\", \"seguito\": \"OndaRock\", \"ruolo\": \"RECENSORE\"}" --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}
echo 