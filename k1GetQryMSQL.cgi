#!/bin/bash
#[NOM:t2GetQueryMSQL.cgi][INFO:Ejecuta la sentencia SQL en MySQL]

  id=$1
  bd=$2
stmt=$3
 usr=$4
 pwd=$5

temp="apps/Pauet/temp"


ahora=$(date +%Y%m%d-%H%M%S)
echo "[id0:$id][hora:$ahora][cgi:$0][fich:$bd]" >> $temp/trazas.txt


echo $stmt > "$temp/base64_$id.txt"
cgibin/base64.sh -a decode -f "$temp/base64_$id.txt" > "$temp/stmt_$id.sql"
cat "$temp/stmt_$id.sql" | mysql --user=$usr --password=$pwd $bd | sed 's/\t/\|/g' 

echo "[error:$?]"

#rm -f temp/"aux1_$id.txt"
#rm -f temp/"stmt_$id.sql"

