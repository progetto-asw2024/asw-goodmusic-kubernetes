#!/bin/bash

# Define the subfolder containing the scripts
SUBFOLDER="subfolder"

# Step 1: Initialize Recensioni
echo "Esecuzione di do-init-recensioni.sh..."
./$SUBFOLDER/do-init-recensioni.sh

# Step 2: Initialize Connessioni
echo "Esecuzione di do-init-connessioni.sh..."
./$SUBFOLDER/do-init-connessioni.sh

# Step 3: Run Curl Client (Initial Check)
echo "Esecuzione di run-curl-client.sh (prima verifica)..."
./$SUBFOLDER/run-curl-client.sh

echo "Controlla che le recensioni seguite da Alice, Bob e Carlo siano rispettivamente 5, 5 e 3."
read -p "Premi Invio per continuare una volta verificato..."

# Step 4: Update Recensioni
echo "Esecuzione di do-update-recensioni.sh..."
./$SUBFOLDER/do-update-recensioni.sh

# Step 5: Run Curl Client (After Update to Recensioni)
echo "Esecuzione di run-curl-client.sh (seconda verifica)..."
./$SUBFOLDER/run-curl-client.sh

echo "Controlla che le recensioni seguite da Alice, Bob e Carlo siano rispettivamente 6, 7 e 4."
read -p "Premi Invio per continuare una volta verificato..."

# Step 6: Update Connessioni
echo "Esecuzione di do-update-connessioni.sh..."
./$SUBFOLDER/do-update-connessioni.sh

# Step 7: Run Curl Client (Final Check)
echo "Esecuzione di run-curl-client.sh (terza verifica)..."
./$SUBFOLDER/run-curl-client.sh

echo "Controlla che le recensioni seguite da Alice, Bob e Carlo siano rispettivamente 7, 8 e 1."
read -p "Premi Invio per terminare il processo..."

echo "Processo completato con successo."
