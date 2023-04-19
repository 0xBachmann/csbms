export OMP_NUM_THREADS=4
JOB_NAME=md_NOE_IR
NUM=1
echo "this command will be submitted:"
echo "bsub -n 4 -W 4:00 -R '"rusage[scratch=2000]"' -J ${JOB_NAME}_${NUM} -e ${JOB_NAME}_${NUM}.err -o ${JOB_NAME}_${NUM}.out  < ${JOB_NAME}_${NUM}.run"
bsub -n 4 -W 4:00 -R "rusage[scratch=2000]" -J ${JOB_NAME}_${NUM} -e ${JOB_NAME}_${NUM}.err -o ${JOB_NAME}_${NUM}.out  < ${JOB_NAME}_${NUM}.run
