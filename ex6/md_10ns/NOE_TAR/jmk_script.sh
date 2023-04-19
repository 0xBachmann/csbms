#!/bin/sh
PROGRAM=/usr/local/gromos-0915/bin/mk_script
NAME=peptide
SYSTEM=NOE_TAR
DIR=$PWD

#========input==========#
cat -<< _eof > ./md_mk_script.arg
@sys        md_${SYSTEM}
@bin        /usr/local/gromos-0915/bin/md_mpi
@dir            ${DIR}
@files
    topo      ../../topo/${NAME}.top
    input     md_${SYSTEM}.imd
    coord     #TO_DO
    disres    ../../prep_noe/noe.dsr
@template   /usr/local/gromos-0915/doc/mk_script/mk_script.4.procs.lib
@version        md++
@script        1 100
_eof
#=======end input========#

#=======run=========#
$PROGRAM @f ./md_mk_script.arg

#=======clean=========#
rm -f md_mk_script.arg
