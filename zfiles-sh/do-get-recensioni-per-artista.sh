#!/bin/bash

# trova tutte le recensioni relative a un certo artista  

if [ $# -eq 0 ]
  then
    echo "Manca il parametro: artista"
	exit 1 
fi

# se un artista contiene spazi deve essere racchiuso tra virgolette 
ARTISTA=$(echo $1 | sed -e "s/ /%20/g") 

echo "# tutte le recensioni per l'artista $1" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/artista/$ARTISTA --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT})
echo 
