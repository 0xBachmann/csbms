PROGRAM=/cluster/work/igc/CSBMS/GROMOS/gromos++/bin/post_noe
NAME=peptide
SYSTEM=unrestrained
DIR=$PWD
st=1
ns=100

#========input==========#
cat -<< _eof > ./post_noe_${SYSTEM}.arg
@topo ../../topo/${NAME}.top
@noe ../../prep_noe/prep_noe.out
@noeoutput noe_${SYSTEM}.out 
@filter ../../prep_noe/noe.filter
@averaging 6
_eof
#=======end input========#

#=======run=========#
$PROGRAM @f ./post_noe_${SYSTEM}.arg > post_noe_${SYSTEM}.out

#=======clean=========#
rm -f ./post_noe_${SYSTEM}.arg 
