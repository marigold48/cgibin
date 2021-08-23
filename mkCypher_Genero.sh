#!/bin/bash

#Ordenes:
#Acanthaceae
#Aceraceae
#Adiantaceae
#Alismataceae
#Amaryllidaceae
#Apiaceae
#Apocynaceae
#Aquifoliaceae
#Araceae
#Araliaceae
#Asclepiadaceae
#Aspidiaceae
#Aspleniaceae
#Asteraceae
#Berberidaceae
#Boraginaceae
#Botrychiaceae
#Buxaceae
#Campanulaceae
#Caprifoliaceae
#Caryophyllaceae
#Celastraceae
#Cistaceae
#Compositae
#Convolvulaceae
#Crassulaceae
#Cruciferae
#Cupressaceae
#Cyperaceae
#Dioscoreaceae
#Dipsacaceae
#Ericaceae
#Euphorbiaceae
#Fabaceae
#Fagaceae
#Gentianaceae
#Geraniaceae
#Gesneriaceae
#Globulariaceae
#Guttiferae
#Hypolepidaceae
#Iridaceae
#Juncaceae
#Labiatae
#Lamiaceae
#Leguminosae
#Lentibulariaceae
#Liliaceae
#Linaceae
#Oleaceae
#Onagraceae
#Orchidaceae
#Orobanchaceae
#Oxalidaceae
#Papaveraceae
#Pinaceae
#Plantaginaceae
#Plumbaginaceae
#Poaceae
#Polygalaceae
#Polygonaceae
#Potamogetonaceae
#Primulaceae
#Ranunculaceae
#Rhamnaceae
#Rosaceae
#Rubiaceae
#Salicaceae
#Santalaceae
#Saxifragaceae
#Scrophulariaceae
#Smilacaceae
#Solanaceae
#Taxaceae
#Thymelaeaceae
#Tiliaceae
#Typhaceae
#Ulmaceae
#Umbelliferae
#Valerianaceae
#Violaceae

	init=$1;

	qry="select distinct genero from flora where familia=\"$init\"";

	lista=$(echo $qry | sqlite3 ~/RETO/apps/Agro/sqlite/repoAgro.sqlite) 

	printf "MATCH (c:Familia {nom:\"$init\"})\n"
	printf "CREATE"
# Crea los nodos Orden
	i=1
	for item in $lista
	do
		printf "(f$i:Genero {nom:\"$item\"}),\n";
		let i=i+1
	done


# Crea las relaciones con la Familia
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

