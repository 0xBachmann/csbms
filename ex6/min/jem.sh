#!/bin/sh
PROGRAM=/cluster/work/igc/CSBMS/GROMOS/gromosXX/bin/md
NAME=peptide

$PROGRAM \
  @topo ../topo/${NAME}.top \
  @conf ../coord/${NAME}_gch.cnf \
  @fin ${NAME}_min.cnf \
  @input em.imd > em.omd
  
