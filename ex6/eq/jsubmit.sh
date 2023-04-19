NAME=eq_peptide
NUM=1
qsub -N ${NAME}_${NUM} -cwd -j y -o ${NAME}_${NUM} -pe orte 4 ./${NAME}_${NUM}.run
