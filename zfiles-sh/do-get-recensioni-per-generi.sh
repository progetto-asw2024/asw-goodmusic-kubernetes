#!/bin/bash

# trova tutte le recensioni relative a un certo insieme di generi  

if [ $# -eq 0 ]
  then
    echo "Manca il parametro: generi-separati-da-virgola"
	exit 1 
fi

# i generi devono essere separati da virgola 
# se un genere contiene spazi deve essere racchiuso tra virgolette 
GENERI=$(echo $1 | sed -e "s/ /%20/g" | sed -e "s/,/%2C/g") 

echo "# tutte le recensioni per i generi $1" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/generi/$GENERI --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT})
echo 

