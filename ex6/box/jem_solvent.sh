#!/bin/sh
PROGRAM=/usr/local/gromos-0614/bin/md
NAME=peptide
SOLV=H2O

$PROGRAM \
  @topo ../topo/${NAME}.top \
  @conf sim_box_${NAME}.cnf \
  @fin ${NAME}_${SOLV}.cnf \
  @refpos sim_box_${NAME}.rpr \
  @posresspec sim_box_${NAME}.por \
  @input em_solvent.imd > em_solvent.omd

