#!/bin/bash

# trova tutte le recensioni relative a un certo album  

if [ $# -eq 0 ]
  then
    echo "Manca il parametro: album"
	exit 1 
fi

# se un album contiene spazi deve essere racchiuso tra virgolette 
ALBUM=$(echo $1 | sed -e "s/ /%20/g") 

echo "# tutte le recensioni per l'album $1" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/album/$ALBUM --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT})
echo 
