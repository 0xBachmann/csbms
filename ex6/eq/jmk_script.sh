#!/bin/sh
PROGRAM=/usr/local/gromos-0614/bin/mk_script
NAME=peptide
SOLV=H2O
DIR=$PWD

#========input==========#
cat -<< _eof > ./eq_mk_script.arg
@sys        eq_${NAME}
@bin        /usr/local/gromos-0614/bin/md_mpi
@dir            ${DIR}
@files
    topo      ../topo/${NAME}.top
    input     equilibration.imd
        coord     ../box/${NAME}_${SOLV}.cnf
        posresspec ../box/${NAME}_${SOLV}.por
        refpos     ../box/${NAME}_${SOLV}.rpr
@template   /usr/local/gromos-0614/doc/mk_script/mk_script.4.procs.lib
@version        md++
@joblist        equilibration.jobs
_eof
#=======end input========#

#=======run=========#
$PROGRAM @f ./eq_mk_script.arg
