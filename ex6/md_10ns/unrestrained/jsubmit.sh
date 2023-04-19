JOB_NAME=md_unrestrained
NUM=1
qsub -N ${JOB_NAME}_${NUM} -cwd -j y -o ${JOB_NAME}_${NUM} -pe orte 4 ./${JOB_NAME}_${NUM}.run
