#!/bin/bash

qry="select a.node_id,a.node_name,b.node_id,b.node_name \
from tol_nodos a,tol_nodos b,tol_arcos c \
where a.node_id=$1 \
and a.node_id=c.source_node_id \
and b.node_id=c.target_node_id;"

   lista=$(echo $qry | sqlite3 ~/RETO/apps/Agro/sqlite/repoAgro.sqlite) 

   for item in $lista
   do
      printf "($item)\n";
   done
