#!/bin/bash

#Ordenes:
#Scrophulariales
#Sapindales
#Ranunculales
#Pteridiales
#Cyperales
#Rosales
#Alismatales
#Liliales
#Capparales
#Asterales
#Fabales
#Caryophyllales
#Arales
#Rubiales
#Aspidiales
#Solanales
#Ophioglossales
#Umbellales
#Euphorbiales
#Lamiales
#Campanulales
#Dipsacales
#Violales
#Poales
#Asparagales
#Primulales
#Orchidales
#Myrtales
#Apiales
#Ericales
#Geraniales
#Celastrales
#Fagales
#Rhamnales
#Gentianales
#Asparagales 
#Theales
#Juncales
#Coniferales
#Plumbaginales
#Linales
#Papaverales
#Plantaginales
#Najadales
#Dennstaedtiales
#Polygonales
#Salicales
#Taxales
#Santalales
#Malvales
#Typhales
#Urticales

	init=$1;

	qry="select distinct familia from flora where orden=\"$init\"";

	lista=$(echo $qry | sqlite3 ~/RETO/apps/Agro/sqlite/repoAgro.sqlite) 

	printf "MATCH (c:Orden {nom:\"$init\"})\n"
	printf "CREATE"
# Crea los nodos Orden
	i=1
	for item in $lista
	do
		printf "(f$i:Familia {nom:\"$item\"}),\n";
		let i=i+1
	done


# Crea las relaciones con la Clase
	i=1
	for item in $lista
	do
		if [ "$i" -gt 1 ]; then
			printf ","
		fi
		printf "\n(f$i)-[:ES]->(c)";
		let i=i+1
	done
	printf "\n\n"

