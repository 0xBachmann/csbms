PROGRAM=/cluster/work/igc/CSBMS/GROMOS/gromos++/bin/jval
NAME=peptide
SYSTEM=NOE_IR
DIR=$PWD
st=1
ns=100
TRAJ=../../md_10ns/${SYSTEM}

#========input==========#
cat -<< _eof > ./jval_${SYSTEM}.arg
@topo ../../topo/${NAME}.top
@pbc r
@jval p16-31_jval_corrected.dat
@traj
_eof

for i in `seq ${st} ${ns}`; do
        cat << _eod >> ./jval_${SYSTEM}.arg
${TRAJ}/md_${SYSTEM}_${i}.trc.gz
_eod
done
#=======end input========#

#=======run=========#
$PROGRAM @f ./jval_${SYSTEM}.arg > jval_${SYSTEM}.out

#=======clean=========#
rm -f ./jval_${SYSTEM}.arg 
