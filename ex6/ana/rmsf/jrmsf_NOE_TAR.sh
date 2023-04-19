PROGRAM=/cluster/work/igc/CSBMS/GROMOS/gromos++/bin/rmsf
NAME=peptide
SYSTEM=NOE_TAR
DIR=$PWD
st=1
ns=100
TRAJ=../../md/${SYSTEM}

#========input==========#
cat -<< _eof > ./rmsf_${SYSTEM}.arg
@topo ../../topo/${NAME}.top
@pbc r
@atomsrmsf  1:res(1-16:CA,N,C)
@ref        ../../box/peptide_H2O.cnf
@traj
_eof

for i in `seq ${st} ${ns}`; do
        cat << _eod >> ./rmsf_${SYSTEM}.arg
${TRAJ}/md_${SYSTEM}_${i}.trc.gz
_eod
done
#=======end input========#

#=======run=========#
$PROGRAM @f ./rmsf_${SYSTEM}.arg > rmsf_${SYSTEM}.out

#=======clean=========#
rm -f ./rmsf_${SYSTEM}.arg 
