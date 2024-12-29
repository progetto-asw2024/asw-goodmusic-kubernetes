#!/bin/bash

# esegue un insieme di interrogazioni di esempio 

echo "# tutte le recensioni"  
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/recensioni) | jq .
echo 

echo "# la recensione 1" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/recensioni/1) | jq .
echo 

echo "# tutte le recensioni del recensore Woody" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/recensore/Woody) | jq .
echo 

echo "# tutte le recensioni di The Dark Side of the Moon" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/album/The%20Dark%20Side%20of%20the%20Moon) | jq .
echo 

echo "# tutte le recensioni degli album dei Pink Floyd" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/artista/Pink%20Floyd) | jq .
echo 

echo "# tutte le recensioni degli album Pop" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni/cercarecensioni/genere/Pop) | jq .
echo 

echo "# tutte le connessioni" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni) | jq .
echo 

echo "# le connessioni di Alice" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni/Alice) | jq .
echo 

echo "# le connessioni di Bob" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni/Bob) | jq .
echo 

echo "# le connessioni di Carlo" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/connessioni/connessioni/Carlo) | jq .
echo 

echo "# le recensioni seguite da Alice" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Alice) | jq .
echo 

echo "# le recensioni seguite da Bob" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Bob) | jq .
echo 

echo "# le recensioni seguite da Carlo" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Carlo) | jq .
echo 

echo "# conta le recensioni seguite da Alice" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Alice) | jq length 
echo 

echo "# conta le recensioni seguite da Bob" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Bob) | jq length 
echo 

echo "# conta le recensioni seguite da Carlo" 
echo $(curl -s ${SERVICE_INGRESS_HOST}/recensioni-seguite/recensioniseguite/Carlo) | jq length 
echo 
