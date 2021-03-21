#!/bin/bash
#[NOM:gnuEscac.cgi][INFO:interfaz para GNU Chess]


  pgn=$1
  mov=$2

  
  gnuchess

  replay $pgn
  $mov
  pgnsave $pgn
  quit