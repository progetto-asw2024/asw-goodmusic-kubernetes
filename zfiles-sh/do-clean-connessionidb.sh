#!/bin/bash

# Script per eliminare connessioni specifiche dal database

# Elimina connessioni con artisti
echo "Eliminazione delle connessioni con artisti..."

curl -X DELETE "http://localhost:8080/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Alice\", \"seguito\": \"Pink Floyd\", \"ruolo\": \"ARTISTA\" }"
echo 

curl -X DELETE "http://localhost:8080/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Alice\", \"seguito\": \"The Beatles\", \"ruolo\": \"ARTISTA\" }"
echo 

curl -X DELETE "http://localhost:8080/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Bob\", \"seguito\": \"The Beatles\", \"ruolo\": \"ARTISTA\" }"
echo 

curl -X DELETE "http://localhost:8080/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Bob\", \"seguito\": \"Michael Jackson\", \"ruolo\": \"ARTISTA\" }"
echo 

# Elimina connessioni con recensori
echo "Eliminazione delle connessioni con recensori..."

curl -X DELETE "http://localhost:8080/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Bob\", \"seguito\": \"Woody\", \"ruolo\": \"RECENSORE\" }"
echo 

curl -X DELETE "http://localhost:8080/connessioni/connessioni" -H "accept: */*" -H "Content-Type: application/json" \
     -d "{ \"utente\": \"Carlo\", \"seguito\": \"OndaRock\", \"ruolo\": \"RECENSORE\" }"
echo 

echo "Eliminazione completata."
