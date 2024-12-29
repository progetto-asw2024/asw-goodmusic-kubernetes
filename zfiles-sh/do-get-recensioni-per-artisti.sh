#!/bin/bash

# trova tutte le recensioni relative a un certo insieme di artisti  

if [ $# -eq 0 ]
  then
    echo "Manca il parametro: artisti-separati-da-virgola"
	exit 1 
fi

# gli artisti devono essere separati da virgola 
# se un artista contiene spazi deve essere racchiuso tra virgolette 
ARTISTI=$(echo $1 | sed -e "s/ /%20/g" | sed -e "s/,/%2C/g") 

echo "# tutte le recensioni per gli artisti $1" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/artisti/$ARTISTI --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT})
echo 

