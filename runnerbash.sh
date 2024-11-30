#!/bin/bash

# Valori di default
default_input_file="percorsi_da_eseguire.json"
default_section="Test"
default_key="script"

# Se non sono passati i parametri, usa i valori di default
input_file="${1:-$default_input_file}"  # Se non passato, usa $default_input_file
section="${2:-$default_section}"        # Se non passato, usa $default_section
key="${3:-$default_key}"                # Se non passato, usa $default_key

# Verifica che il file JSON esista
if [ ! -f "$input_file" ]; then
    echo "File JSON non trovato: $input_file"
    exit 1
fi

# Itera sui percorsi degli script nella sezione e chiave specificata
for file in $(jq -r ".${section}.${key}[]" "$input_file"); do
    echo "Eseguendo $file"
    
    if [ -f "$file" ]; then  # Verifica che il file esista
        bash "$file"        # Esegui lo script
    else
        echo "File non trovato: $file"
    fi
done
