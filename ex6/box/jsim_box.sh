#!/bin/sh
PROGRAM=/usr/local/gromos-0614/bin/sim_box
NAME=peptide
#========input==========#
cat -<< _eof > ./sim_box.arg

@topo ../topo/${NAME}.top
@pbc r
@pos ../min/${NAME}_min.cnf
@solvent spc.cnf
@minwall 1.0
@thresh 0.23
@rotate
_eof
#=======end input========#

#=======run=========#
$PROGRAM @f ./sim_box.arg > ./sim_box_${NAME}.cnf

