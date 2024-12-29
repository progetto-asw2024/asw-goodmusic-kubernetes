#!/bin/bash

# trova una recensione 

if [ $# -eq 0 ]
  then
    echo "Manca il parametro: id-recensione"
	exit 1 
fi

RECENSIONE=$1 

echo "# trova la recensione $RECENSIONE" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/recensioni/${RECENSIONE} --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) 
echo 

