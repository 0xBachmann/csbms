PROGRAM=/cluster/work/igc/CSBMS/GROMOS/gromos++/bin/rmsd
NAME=peptide
SYSTEM=unrestrained
DIR=$PWD
st=1
ns=100
TRAJ=../../md_10ns/${SYSTEM}

#========input==========#
cat -<< _eof > ./rmsd_${SYSTEM}.arg
@topo ../../topo/${NAME}.top
@pbc r
@time 0 1
@atomsrmsd  1:res(2-15:CA,N,C)
@atomsfit   1:res(2-15:CA,N,C)
@ref        ../../box/peptide_H2O.cnf
@traj
_eof

for i in `seq ${st} ${ns}`; do
        cat << _eod >> ./rmsd_${SYSTEM}.arg
${TRAJ}/md_${SYSTEM}_${i}.trc.gz
_eod
done
#=======end input========#

#=======run=========#
$PROGRAM @f ./rmsd_${SYSTEM}.arg > rmsd_${SYSTEM}.out

#=======clean=========#
rm -f ./rmsd_${SYSTEM}.arg 
