PROGRAM=/cluster/work/igc/CSBMS/GROMOS/gromos++/bin/noe
NAME=peptide
SYSTEM=unrestrained
DIR=$PWD
st=1
ns=100
TRAJ=../../md/${SYSTEM}

#========input==========#
cat -<< _eof > ./noe_${SYSTEM}.arg
@topo ../../topo/${NAME}.top
@pbc r
@noe ../../prep_noe/prep_noe.out 
@traj
_eof

for i in `seq ${st} ${ns}`; do
        cat << _eod >> ./noe_${SYSTEM}.arg
${TRAJ}/md_${SYSTEM}_${i}.trc.gz
_eod
done
#=======end input========#

#=======run=========#
$PROGRAM @f ./noe_${SYSTEM}.arg > noe_${SYSTEM}.out

#=======clean=========#
rm -f ./noe_${SYSTEM}.arg 
