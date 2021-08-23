#!/bin/bash

#Juniperus|communis
#Pinus|nigra
#Pinus|sylvestris
#Pinus|uncinata
#Taxus|baccata

	init=$1;

	qry="select distinct especie from flora where genero=\"$init\"";

	lista=$(echo $qry | sqlite3 ~/RETO/apps/Agro/sqlite/repoAgro.sqlite) 

	printf "MATCH (g:Genero {nom:\"$init\"})\n"
	printf "CREATE"
# Crea los nodos Orden
	i=1
	for item in $lista
	do
		printf "(e$i:Especie {nom:\" $init $item\"}),\n";
		let i=i+1
	done


# Crea las relaciones con la Familia
	i=1
	for item in $lista
	do
		if [ "$i" -gt 1 ]; then
			printf ","
		fi
		printf "\n(e$i)-[:ES]->(g)";
		let i=i+1
	done
	printf "\n\n"

