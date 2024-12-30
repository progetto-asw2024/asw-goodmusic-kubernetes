#!/bin/bash

# esegue un insieme di interrogazioni di esempio 

echo "# tutte le recensioni"  
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/recensioni --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# la recensione 1" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/recensioni/1 --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# tutte le recensioni del recensore Woody" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/recensore/Woody --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# tutte le recensioni di The Dark Side of the Moon" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/album/The%20Dark%20Side%20of%20the%20Moon --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# tutte le recensioni degli album dei Pink Floyd" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/artista/Pink%20Floyd --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# tutte le recensioni degli album Pop" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/genere/Pop --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# tutte le connessioni" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# le connessioni di Alice" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni/Alice --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# le connessioni di Bob" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni/Bob --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# le connessioni di Carlo" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni/Carlo --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# le recensioni seguite da Alice" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Alice --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# le recensioni seguite da Bob" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Bob --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# le recensioni seguite da Carlo" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Carlo --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq .
echo 

echo "# conta le recensioni seguite da Alice" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Alice --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq length 
echo 

echo "# conta le recensioni seguite da Bob" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Bob --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq length 
echo 

echo "# conta le recensioni seguite da Carlo" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Carlo --connect-to ${SERVICE_INGRESS_HOST}:80:${SERVICE_HOST}:${INGRESS_PORT}) | jq length 
echo 
