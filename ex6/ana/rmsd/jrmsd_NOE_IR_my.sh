PROGRAM=/cluster/work/igc/CSBMS/GROMOS/gromos++/bin/rmsd
NAME=peptide
SYSTEM=NOE_IR
DIR=$PWD
st=1
ns=100
TRAJ=../../md/${SYSTEM}

#========input==========#
cat -<< _eof > ./rmsd_${SYSTEM}_my.arg
@topo ../../topo/${NAME}.top
@pbc r
@time 0 1
@atomsrmsd  1:res(2-15:CA,N,C)
@atomsfit   1:res(2-15:CA,N,C)
@ref        ../../box/peptide_H2O.cnf
@traj
_eof

for i in `seq ${st} ${ns}`; do
        cat << _eod >> ./rmsd_${SYSTEM}_my.arg
${TRAJ}/md_${SYSTEM}_${i}.trc.gz
_eod
done
#=======end input========#

#=======run=========#
$PROGRAM @f ./rmsd_${SYSTEM}_my.arg > rmsd_${SYSTEM}_my.out

#=======clean=========#
rm -f ./rmsd_${SYSTEM}_my.arg 
