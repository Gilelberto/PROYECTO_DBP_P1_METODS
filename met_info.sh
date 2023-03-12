#!/bin/bash
opt="$1"

#caso donde no se reciba un parámetro válido
if [ $opt != "-a" ] && [ $opt != "-t" ]; then       #como es una cadena usamos != en lugar de -ne
 echo "Error: Parámetro desconocido"
fi

#caso -a metodologías ágiles
if [ $opt == "-a" ]; then       
 echo "PROCEDER AL MENÚ DE AGILES"
fi

#caso -t metodologías tradicionales
if [ $opt == "-t" ]; then       
 echo "PROCEDER AL MENÚ DE TRADICIONALES"
fi