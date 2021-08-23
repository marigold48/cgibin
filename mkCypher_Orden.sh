#!/bin/bash

# Clases:
# Magnoliopsida
# Filicopsida
# Liliopsida
# Ophioglossopsida
# Coniferopsida

	init=$1;

	qry="select distinct orden from flora where clase=\"$init\"";

	lista=$(echo $qry | sqlite3 ~/RETO/apps/Agro/sqlite/repoAgro.sqlite) 

	printf "MATCH (c:Clase {nom:\"$init\"})\n"
	printf "CREATE"
# Crea los nodos Orden
	i=1
	for item in $lista
	do
		printf "(o$i:Orden {nom:\"$item\"}),\n";
		let i=i+1
	done


# Crea las relaciones con la Clase
	i=1
	for item in $lista
	do
		if [ "$i" -gt 1 ]; then
			printf ","
		fi
		printf "\n(o$i)-[:ES]->(c)";
		let i=i+1
	done
	printf "\n\n"

