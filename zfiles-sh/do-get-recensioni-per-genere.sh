#!/bin/bash

# trova tutte le recensioni relative a un certo genere  

if [ $# -eq 0 ]
  then
    echo "Manca il parametro: genere"
	exit 1 
fi

# se un genere contiene spazi deve essere racchiuso tra virgolette 
GENERE=$(echo $1 | sed -e "s/ /%20/g") 

echo "# tutte le recensioni per il genere $1" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/genere/$GENERE --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT})
echo 
