#!/bin/sh
PROGRAM=/cluster/work/igc/CSBMS/GROMOS/gromos++/bin/mk_script
NAME=peptide
SYSTEM=unrestrained
DIR=$PWD

#========input==========#
cat -<< _eof > ./md_mk_script.arg
@sys        md_${SYSTEM}
@bin        /cluster/work/igc/CSBMS/GROMOS/gromosXX/bin/md
@dir            ${DIR}
@files
    topo      ../../topo/${NAME}.top
    input     md_${SYSTEM}.imd
    coord  ../../eq/eq_${NAME}_5.cnf 
@template   ../mk_script.4.procs.lib
@version        md++
@script        1 100
_eof
#=======end input========#

#=======run=========#
$PROGRAM @f ./md_mk_script.arg

#=======clean=========#
rm -f ./md_mk_script.arg
