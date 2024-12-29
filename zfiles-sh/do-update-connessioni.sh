#!/bin/bash

# aggiunge alcune connessioni 

curl -X POST "http://${SERVICE_INGRESS_HOST}/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Alice\", \"seguito\": \"Bruce Springsteen\", \"ruolo\": \"ARTISTA\"}"
echo 

curl -X POST "http://${SERVICE_INGRESS_HOST}/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Bob\", \"seguito\": \"Jazz\", \"ruolo\": \"GENERE\"}"
echo 

curl -X POST "http://${SERVICE_INGRESS_HOST}/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Carlo\", \"seguito\": \"RollingStone\", \"ruolo\": \"RECENSORE\"}"
echo 

# elimina alcune connessioni 

curl -X DELETE "http://${SERVICE_INGRESS_HOST}/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Carlo\", \"seguito\": \"OndaRock\", \"ruolo\": \"RECENSORE\"}"
echo 